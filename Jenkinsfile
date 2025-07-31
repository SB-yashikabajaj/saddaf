@Library('ods-jenkins-shared-library@4.x') _
import org.ods.services.ServiceRegistry
import org.ods.services.GitService
import org.ods.util.GitCredentialStore

// See https://www.opendevstack.org/ods-documentation/ods-jenkins-shared-library/latest/index.html for usage and customization.
odsComponentPipeline(
  imageStreamTag: "ods/jenkins-agent-maven:4.x",
  notifyNotGreen: false,    
  projectId: "apim",
  branchToEnvironmentMapping: [
    'master': 'dev',
    // 'release/*': 'test'
  ]
) { context ->
  stageBuild(context)
  // odsComponentStageScanWithSonar(context)
  // odsComponentStageBuildOpenShiftImage(context)
  // odsComponentStageRolloutOpenShiftDeployment(context)
}

def stageBuild(def context) {
  def javaOpts = "-Xmx512m"
  def gradleTestOpts = "-Xmx128m"
  def springBootEnv = context.environment
  if (springBootEnv.contains('-dev')) {
    springBootEnv = 'dev'
  }

  def gitCommit = context.gitCommitRawMessage
  stage('Build and Unit Test') {
    if (gitCommit =~ /Import API/) {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "apim-cd-apimgr-ci", usernameVariable: 'apimgrUser', passwordVariable: 'apimgrPassword']]) {
        withEnv(["TAGVERSION=${context.tagversion}", "NEXUS_HOST=${context.nexusHost}", "NEXUS_USERNAME=${context.nexusUsername}", "NEXUS_PASSWORD=${context.nexusPassword}", "JAVA_OPTS=${javaOpts}","GRADLE_TEST_OPTS=${gradleTestOpts}","ENVIRONMENT=${springBootEnv}", "APIMGR_CI_USERNAME=${apimgrUser}","APIMGR_CI_PASSWORD=${apimgrPassword}"]) {
          // Available as an env variable, but will be masked if you try to print it out any which way
          // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
          def status = sh(script: 'sh ./gradlew -i --no-daemon -PapiMgrEnv=dev deployApi', returnStatus: true)
          if (status != 0) {
            notifyError(context);
            error "Build failed!"
          }
        }
      }
    } else if (gitCommit =~ /\[Export API\]/) {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "apim-cd-apimgr-ci", usernameVariable: 'apimgrUser', passwordVariable: 'apimgrPassword']]) {
      withEnv(["TAGVERSION=${context.tagversion}", "NEXUS_HOST=${context.nexusHost}", "NEXUS_USERNAME=${context.nexusUsername}", "NEXUS_PASSWORD=${context.nexusPassword}", "JAVA_OPTS=${javaOpts}","GRADLE_TEST_OPTS=${gradleTestOpts}","ENVIRONMENT=${springBootEnv}", "APIMGR_CI_USERNAME=${apimgrUser}","APIMGR_CI_PASSWORD=${apimgrPassword}"]) {
        // available as an env variable, but will be masked if you try to print it out any which way
        // note:  single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want

        def date = new Date()
        def formattedDate = date.format('yyyyMMddHHmmss')
        exportFolderName = './api/export-' + formattedDate          
        // def currentDatetime = sh(script: "date +%F%T | sed 's/[-:]//gp;d'", returnStdout: true) 
        // def exportFolderName = "./api/export-" + currentDatetime

        def status = sh(script: 'sh ./gradlew -i --no-daemon -PapiMgrEnv=dev -PexportFolderName='+exportFolderName+' exportApi', returnStatus: true)
        // def status = sh(script: 'echo "test" >> ./test.txt', returnStatus: true)
        if (status != 0) {
          notifyError(context);
          error "Build failed!"
        }
        else {
          echo "Export completed OK - Pushing to remote"
          def gitService = ServiceRegistry.instance.get(GitService)
          gitService.configureUser()
          gitService.commit([exportFolderName],'Exporting API defined in config.json into ' + exportFolderName + '[ci skip]')
          withCredentials(
              [usernamePassword(
                  credentialsId: context.credentialsId,
                  usernameVariable: 'BITBUCKET_USER',
                  passwordVariable: 'BITBUCKET_PW'
              )]
          ) {
              GitCredentialStore.configureAndStore(
                  this, context.bitbucketUrl as String,
                  env.BITBUCKET_USER as String,
                  env.BITBUCKET_PW as String)
          }            
          // W/out the HEAD: it throws "src refspec master does not match any." 
          gitService.pushRef("HEAD:${context.gitBranch}") 

        }
      }
    }
    }

  }
}

def notifyError(context) {
//  to = emailextrecipients([
//    [$class: 'CulpritsRecipientProvider'],
//    [$class: 'DevelopersRecipientProvider'],
//    [$class: 'RequesterRecipientProvider']
//  ])
  to = emailextrecipients([culprits(), requestor()])  

  def subject = "Build $context.componentId on project $context.projectId  failed!"
  def body = "<p>$subject</p> <p>Check the attached complete output log from the build</p> <p>URL : <a href=\"$context.buildUrl\">$context.buildUrl</a></p> "
  emailext attachLog: true, compressLog: true,  to: to, 
    subject: subject, body: body, mimeType: 'text/html', from: 'noreply@boehringer-ingelheim.com'
}
