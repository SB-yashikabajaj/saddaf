---
stoplight-id: ksaksqbqykutk
---

# Agency Management APIs

CoverForce also provides APIs to aid in the management of Agencies within a Network. Every application created within CoverForce platform is associated to an agency.

The Get all agencies API - will let you list the complete list of CoverForce agency that the Agency Network client has access too.

Every unique agency is identified by its `agencyId`. The agency id can be passed in as an additional header information when creating a CoverForce application, this will force the application to be created within the specified agency.

>Agency Management APIs are accessible only to the Agency Network API Clients, operating on a network level. Agency ID Headers are also expected only for Agency Network Clients.

#### Agency ID headers
There are optional headers in the [Create Application API](https://coverforce.stoplight.io/docs/coverforce-api/224ba39a465c8-create-an-application), for Agency Network level clients.

```json json_schema
type: object
properties:
  x-cf-agency-id:
    type: string
    description: 'This denotes a direct CoverForce agency ID to which an application has to be associated.'
  x-client-agency-id:
    type: string
    description: 'If in case the CoverForce agency ID is not explicitly known, but the user is aware of the agency ID of the client system, the header attribute `x-client-agency-id` can be set. We will internally determine the agency to which the application has to be assoicated.'
  x-cf-sso-client-id:
    type: string
    description: 'When passing the Client Agency ID, the user/client has to also pass in the single sign-on (SSO) client ID and the system will internally determine the CoverForce agency ID mapped with the sso-client, for the given Client Agency ID.'
```
