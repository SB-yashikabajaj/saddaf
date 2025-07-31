---
stoplight-id: p3xpzp9zluq4t
---

# Application Helper APIs

Along with the user journey APIs, CoverForce also provides a few Helper APIs to aid the complete insurance application process.

Each Helper API has information that can be used to assist in the construction of the application. 

## Underwriting Helper APIs

The underwriting helper APIs are used to obtain the underwriting details related to a given application.


### Get Underwriting Questions API

[Underwriting Questions API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/4eba38ca6290c-get-uw-questions-for-an-application) is used to get all the underwriting questions for a particular Application. Once the basic details of the Application have been completed you can call this API to request the underwriting questions for the application.


### Get Underwriting Statements API

[List Underwriting Statements API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/69be58c1fe747-list-underwriting-statements) is used to fetch all the underwriting statements for an application.

This is needed to render any declarations or statements that the user needs to acknowledge, before generating a Quote with CoverForce. These statements are Carrier specific in nature.

Once the basic details of the Application have been completed you can call this API to request the underwriting statements for the application.

## Classification APIs

The Classification Helper APIs are useful in listing the various classes available for Industry and Job Codes required in the Application.

### Get All Industry Codes API

[Industry Codes Selection API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/d59129617694e-get-all-industry-codes) is used to fetch all industry codes available for an insurance application.

You can use this API to populate the industry codes field in the Application model.


### Get Job Codes By State API


[Job Codes By State API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/6bc1b23f19878-get-job-codes-by-state) is used to fetch all job codes available for a given state. This is specifically used in a Workers Compensation application

You can use this API to populate the job codes field in the employee information section of a given location in the Application model.


## Application Helper APIs

### Get All Legal Entities API

[Legal Entities API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/2e421d9aae489-get-all-legal-entities) is used to fetch legal entities applicable for a particular `policyType`.

This returns multiple Legal Entity types, like `ASSOCIATION`, `CORPORATION`, `ESTATE`, `JOINT VENTURE` etc. which are applicable for an insurance application.


### Get Liability Limits API

[Liability Limits API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/05922f4a91366-get-liability-limits) is used to fetch liability limits applicable for a particular `state` and `policyType`.

This is `optional`, as there are default Liability Limits which are automatically applicable for an application that is created with CoverForce.

This can be used to select the liability limits within a given Application


### Get Carriers API


[Carriers API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/75afdbbee1844-get-all-carriers) enables you to fetch data for all carriers available on the CoverForce APIs.

This provides carrier level information, like `carrierId`, `displayName`, `shortName` etc, which are used to enrich user screens as needed or used in the Application model.

### Check Appetite API


[Appetite API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/n5xmbgkxqq2i8-check-appetite) provides a comprehensive lookup for identifying the supported combinations of policy types and industry codes across various carriers in different states.

You can further narrow your lookup results by passing `policyType`, `state` and `naicsCode`


