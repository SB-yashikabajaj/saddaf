---
stoplight-id: u2b43tlkts3gb
tags: [Applications]
internal: true
---

# Application Flow

```mermaid
flowchart LR
    incomplete --> submitted
    submitted-->review
    review-->pending-->review
    review-->denied
    review-->offer
    submitted-->withdrawn1[withdrawn]
    review-->withdrawn3[withdrawn]
    pending-->withdrawn3[withdrawn]
    submitted-->expired1[expired]
    pending-->expired3[expired]
    review-->expired3[expired]
    offer-->accept
    offer-->decline
    offer-->offerexpired[expired]
```
