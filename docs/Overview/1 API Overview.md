---
stoplight-id: ogy5is9833xsn
---


# Introduction to CoverForce API

The CoverForce API connects you to multiple insurance carriers through a single set of RESTful endpoints. Our documentation will walk you through the various components of the API and the concepts related to the insurance products you can access through the API.

You can also dive into our APIs directly using the [API reference](https://coverforce.stoplight.io/docs/coverforce-api/258ac0f5daaa9-cover-force-api)

## How it works

### Authentication

To work with the CoverForce APIs, you need to authenticate your platform before calling the CoverForce APIs. To authenticate you need to be setup with a Username (ClientId) and Password (ClientSecret). You should have received these details during the onboarding process. If not, please reach out to the team to obatin these credentials.

### Application Quote and Bind Flow

The central resource of the CoverForce APIs is an Application. Applications can have one Product Type (aka Policy Type, Line of Business) and multiple Carriers (Insurance companies). 

Once the Application is completed you can submit the application and get quotes for the given Product Type and Carriers in the Application.

Upon receiving the quotes, you can choose to Bind a quote after selecting the appropriate payment plan for the quote.

Both the Quote and Bind process are asynchronous in nature. As a client, you can poll the GET APIs to identify the status of the Quoting and Binding process.