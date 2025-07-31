@echo off

git pull

IF "%APIIMPORT_HOME%" == "" (
  SET sps=c:\axway\tools\api-import\scripts
) ELSE (
  SET sps=%APIIMPORT_HOME%\scripts
)

SET apm=api-manager-dev.eu.boehringer.com

IF EXIST %sps%\api-import.bat (

SET usr=jenkins
IF "%pwd%"=="" (SET /P pwd=Enter the %usr% password for %apm%: )

%sps%\api-import.bat -c config.json -h %apm% -u %usr% -p %pwd% -f true

) ELSE (

echo *** %sps%\api-import.bat was not found!
echo *** Download https://github.com/Axway-API-Management-Plus/apimanager-swagger-promote/releases
echo *** Extract it to %sps%

)


