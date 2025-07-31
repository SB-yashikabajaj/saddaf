---
stoplight-id: arme849h9h38r
---

# Broker Code Configuration APIs

CoverForce also provides Broker Code CRUD APIs to aid in the management of Broker Codes. The Broker Codes are needed in the CoverForce application. 

A Broker Code configuration has the relevant appointment information that is required by each carrier to identify an agency and agent (some carriers). A Broker Code is required in order to generate quotes and bind them successfully.

Every unique Broker configuration can be identified by its `brokerConfigurationId`. The `brokerConfigurationId` needs to be set for each carrier in the application when creating the application. We do have an option to default the `brokerConfigurationId` based on the set-up of the API Client.

The Broker Code Configuration model definition can be viewed over here: [Broker Code Model](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/9a4de8d1da9b6-broker-code)

The `configuration` field within the model has a unique structure for each carrier which can be found below. This is because each insurance carrier has different requirements/fields used to identify the appointment details with their agency partners.

>Creating and Updating Broker codes through the API is restricted for the following carriers: **Employers, CNA, GAIG, Markel, Coalition**. For these carriers, please reach out to us directly to set up the Broker Codes. This is because they require manual processes on the carrier's side.

### Carrier Specific Configurations

#### AmTrust
```json json_schema
type: object
title: AmTrustBrokerConfiguration
properties:
  agentContactId:
    type: string
    description: 'Agent contact Id of the broker'
  userName:
    type: string
    description: 'username of the broker'
  password:
    type: string
    description: 'password of the broker'
  email:
    type: string
    description: 'Broker email Id'
required:
  - userName
  - email
  - password
```

#### Travelers
```json json_schema
type: object
title: TravelersBrokerConfiguration
properties:
  producerCode:
    type: string
    description: 'Producer code of the broker'
    minLength: 5
    maxLength: 6
    pattern: '^[a-zA-Z0-9]{5,6}$'
required:
  - producerCode
```

#### Liberty Mutual
```json json_schema
type: object
title: LibertyMutualBrokerConfiguration
properties:
  niprId:
    type: string
    description: 'NIPR Id of the broker'
  contractNumber:
    type: string
    description: 'Contract number of the broker'
  firstName:
    type: string
    description: 'First Name of the broker'
  lastName:
    type: string
    description: 'Last Name of the broker'
  email:
    type: string
    description: 'Broker email Id'
required:
  - firstName
  - lastName
  - email
  - contractNumber
  - niprId
```

#### Nationwide
```json json_schema
type: object
title: NationwideBrokerConfiguration
properties:
  agencyCode:
    type: string
    description: 'Agency code of the broker'
    minLength: 5
    maxLength: 5
required:
  - agencyCode
```

#### Chubb
```json json_schema
type: object
title: ChubbBrokerConfiguration
properties:
  contractNumber:
    type: string
    description: 'Contract Number of the broker'
required:
  - contractNumber
```


### Sample Create Broker Code Payload:
```json
{
    "carrierId": "CHUBB",
    "configurationName": "CHUBB-Broker-Code-Test",
    "configuration": {
        "contractNumber": "09534Y"
    }
}