---
stoplight-id: 0dxhx8yhljgo1
---

# User Journey
Streamlined B2B Insurance Application Process

## Step 1: Authentication
Begin by securely authenticating your identity to access our platform. Once verified, you'll receive a unique access token that ensures the confidentiality of your application data.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Authenticate with Client ID and Secret
    API-->>Client: Returns Access Token

```
## Step 2: Creating the Application
Creating an application is a breeze. Provide us with the necessary information about your client, their business, and insurance requirements. Our user-friendly interface guides you through this step effortlessly.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Create Application API
    API-->>Client: Application Created

```

## Step 3: Updating the Application
The flexibility is yours when it comes to updating the application. You have the freedom to perform the following tasks in any order that suits your preferences:

### 3.1 Location Management
Easily add, modify, or remove locations associated with your client's business. Our intuitive location management tool ensures accurate representation of their coverage needs.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Add Locations
    API-->>Client: Locations Added

```

### 3.2 Underwriting Questions


Fetch the underwriting questions applicable to the application and each location. Show these questions to your clients and update the Application with the answers entered by the user.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Get General Questions
    API-->>Client: Returns General Questions
    Client->>API: Get Location Specific Questions
    API-->>Client: Returns Location Specific Questions

```

### 3.3 Iterative Application Refinement
Fine-tune the application until it's ready for submission. You can revisit and revise any aspect of the application, ensuring that all details are correct and up-to-date.


```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    loop Update Application until Complete
        Client->>API: Update Application with Answers
        API-->>Client: Application Updated
    end

```

## Step 4: Submitting for Quotes
Once your application is primed, submit it to our platform to receive tailored insurance quotes. Our system efficiently matches your client's needs with appropriate coverage options from our network of trusted insurers.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Submit for Quotes
    API-->>Client: Quotes Submitted
    Client->>API: Get Quotes
    API-->>Client: Returns Quotes

```

## Step 5: Binding the Quote
Review the received quotes and select the one that best aligns with your client's requirements. Our experts are available to guide you through the decision-making process if needed. Once a quote is chosen, we seamlessly move to the binding stage.

```mermaid
sequenceDiagram
    participant Client as Client
    participant API as API

    Client->>API: Get Payment Plans
    API-->>Client: Returns Payment Plans
    Client->>API: Select Payment Plan
    API-->>Client: Payment Plan Selected
    Client->>API: Bind Quote
    API-->>Client: Quote Bound

```