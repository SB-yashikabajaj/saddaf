---
stoplight-id: kit8nv2ah0ih7
---


# Special Handling
For Liberty Mutual (referred to as LM hereafter), certain policy types necessitate special handling and follow a different workflow to generate a quote. These requirements are detailed below:
## CGL
In some cases, LM CGL quoting requires the selection of an additional industry code, in addition to the primary industry code. Due to this constraint, we cannot automatically map the industry selection from NAICS codes to LM-specific codes.

To obtain a successful LM quote, you must use the carrier-specific industry selection APIs and update the application accordingly. Here are the detailed steps:

1. **Create and Update the Application**: Start by using the regular APIs to create and then update the application. 
2. **Fetch LM Specific Industry Codes**: Use the [get carrier industry codes API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/05df7646473a7-get-carrier-industry-codes) to retrieve LM-specific industry codes.
3. **Fetch Industry Code Details**: Use the [get carrier industry code details API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/5a7b08ccbc2da-get-carrier-industry-code-details) to obtain details of the selected industry code. The `industryCodeDetails` object structure for LM is provide below as `LMIndustryClassCodeDetails`:
4. **Determine Secondary Class Code Requirement**: If the selected industry code has the field `requiresSecondaryClassCode` set to true, you need to select an additional industry code. Otherwise, only the primary code needs to be passed, and you should skip to step 6.
5. **Fetch Secondary Class Codes**: Reuse the API mentioned in step 3 to get secondary class codes.
6. **Update Application with LM Industry Codes**: Use the [Carrier industry codes selection API](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/fbc4a1ffb71f9-carrier-industry-code-selection) to update the application with LM industry codes.
7. **Proceed with Quote Generation**: The process to get the quote after this remains similar to what is followed for other carriers.

## BOP
LM BOP quote generation is similar to CGL quote generation with some additional requirement:
You need to pass the `buildingAndBusinessCoverageDetails` to obtain an LM BOP quote.

Here are the detailed steps:
1. **Follow Steps 1-6 from CGL**: Begin by following steps 1-6 from the CGL process for BOP as well.
2. **Fetch Secondary Class Code Details**: If the application has a secondary industry code selected, fetch the details of the secondary class code as mentioned in step 3 of the CGL flow.
3. **Provide Building and Business Coverage Details**: While creating or updating the location information of the application, include the [`buildingAndBusinessCoverageDetails`](https://coverforce.stoplight.io/docs/coverforce-api/branches/main/a10090e2c7204-building-and-business-coverage-details) in the `buildingInfo`.
4. **Set Coverage Class IDs**: Pass the `internalCodeId` of the `dependentCode` from the `LMIndustryClassCodeDetails` object into the `businessPersonalPropertyCoverageClassId` and `buildingCoverageClassId` fields of the `buildingAndBusinessCoverageDetails`. If the application has a secondary industry code selected, use the dependent codes from the details of the secondary code. Otherwise, use the dependent codes from the primary industry code.

```json json_schema
type: object
title: LMIndustryClassCodeDetails
properties:
  requiresSecondaryClassCode:
    type: boolean
    description: 'Is Secondary Industry code required'
  dependentCodes:
    type: array
    items:
      type: object
      title: LMDependentCode
      properties:
        codeId:
          type: string
          description: 'Dependent Code Id'
        codeDescription:
          type: string
          description: 'Dependent Code description'
        internalCodeId:
          type: string
          description: 'Internal Code Id'
    description: 'Dependent Code Information'
required:
  - requiresSecondaryClassCode
  - dependentCodes
```