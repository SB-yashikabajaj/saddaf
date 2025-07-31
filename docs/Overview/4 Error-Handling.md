---
stoplight-id: 0hfqtujlwhoux
---

# Error Handling

CoverForce employs HTTP response status codes to signify the outcome of an API request—whether it succeeds or encounters an issue.

* Codes falling within the 2xx range denote successful outcomes.
* Codes within the 4xx range point to errors arising due to issues with the information provided by the Client.
* Codes within the 5xx range, though rare, suggest errors on CoverForce's end.

In cases of failed/unsuccessful requests (codes in the 4xx or 5xx range), CoverForce will furnish an array of error objects. This array comprehensively encompasses all recognized errors corresponding to the pertinent HTTP status code.

## HTTP Status Codes

| Status Code | Description                                          |
|-------------|------------------------------------------------------|
| 200 (OK)    | Everything worked as expected.                      |
| 400         | Bad Request: The format or content of your request is invalid. |
| 401         | Unauthorized: No valid API key provided.            |
| 404         | Not Found: The resource doesn't exist.              |
| 500         | Server Error: Something went wrong with CoverForce.    |



## Error Response Structure

Our API standardizes the format of error responses to provide clear, comprehensive information about any errors that may occur during request processing. This helps you handle these scenarios in your client applications and debug issues if they arise. 

Our API error responses are shaped according to the `IErrorResponse` interface. Below is a detailed description of our error response structure.


```json json_schema
type: object
title: IErrorResponse
properties:
  statusCode:
    type: number
    description: 'The HTTP status code for the error response. HTTP status codes are standardized codes that represent the status of the client''s request. They can indicate a successful response (200 series), a client error (400 series), a server error (500 series), etc.'
  timestamp:
    type: string
    description: 'The timestamp at which the error occurred. It follows the ISO 8601 standard format (e.g., 2023-06-02T17:25:43.511Z).'
  requestId:
    type: string
    description: 'The unique request id for this request'
  errors:
    type: array
    description: 
    items:
      x-stoplight:
        id: bu9tmd2tb5dj5
      type: object
      properties:
        errorCode:
          type: string
          description: This field provides information about the overall category or type of the error.
          x-stoplight:
            id: wr6zidmwsfw4i
        errorMesssage:
          type: string
          description: This field provides a brief, human-readable explanation of the error. It provides a general overview of the problem without going into details.
          x-stoplight:
            id: 5h3loxozds1qf
        errorDetail:
          type: string
          description: This field provides additional details about the error.
          x-stoplight:
            id: 6qi9u1f0ehzy0

```

**Sample Error Response:**

Here's an example of an error response following the `IErrorResponse` structure:

```json
{
    "statusCode": 400,
    "timestamp": "2023-08-02T07:16:08.633Z",
    "requestId": "cfr-6aafcb7f-bded-4d05-9fc9-fd71aab7e71e",
    "errors": [
        {
            "errorCode": "CF_BAD_REQUEST_ERROR",
            "errorMessage": "policyType should not be empty, email should not be empty, phone should not be empty",
            "errorDetail": "Invalid JSON payload."
        }
    ]
}