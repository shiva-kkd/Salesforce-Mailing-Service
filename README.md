# 📨 Salesforce Apex Mailing Service

A lightweight, reusable, and production-ready **Apex utility service** designed to streamline email delivery within Salesforce. This service leverages the native `Messaging.SingleEmailMessage` layer to handle HTML-formatted email communications safely, efficiently, and with built-in error trapping.

---

## ✨ Features
* **HTML Component Support:** Send beautifully styled responsive HTML emails directly through Apex.
* **Robust Exception Handling:** Gracefully traps runtime errors and tracks failure statuses without breaking active system transactions.
* **Detailed Error Logging:** Automatically loops through `Messaging.SendEmailError` sets to dump meaningful diagnostic data straight into your debug logs.
* **Signature Bypass:** Explicitly suppresses default user signatures for clean, automated transactional messaging.

---

## 🛠️ Code Structure

Your Salesforce environment should contain the following repository assets:
1. `MailingService.cls` — The core utility engine containing the email generation logic.
2. `MailingService.cls-meta.xml` — The required Salesforce deployment metadata blueprint.

---

## 🚀 How to Use & Test

You can test or invoke this service instantly from anywhere in your application (Triggers, Batch Classes, Controllers) or run it manually via the Salesforce **Developer Console** using the **Execute Anonymous** window.

### Quick Test Script
```apex
// 1. Define your parameters
String recipient = 'your-email@example.com'; // 👈 Replace with your actual email address
String emailSubject = 'Salesforce Mailing Service Test';
String htmlContent = '<h1>Success! 🎉</h1><p>My custom Apex mailing service is working perfectly directly from the cloud.</p>';

// 2. Execute the mailing handler
Boolean isSent = MailingService.sendHtmlEmail(recipient, emailSubject, htmlContent);

// 3. Inspect the execution logs
System.debug('>>> WAS EMAIL SENT? ' + isSent);
```

---

## 📉 Salesforce Architecture Considerations & Limits

When embedding this service into high-volume automations, please stay mindful of standard Multi-Tenant Governor Limits:
* **Single Email Limit:** Standard Salesforce orgs are restricted to sending single emails to a maximum of **5,000 external email addresses per day**.
* **Internal Routing:** Emails directed to internal Salesforce users of your own organization do not count against your 5,000 daily external threshold.
* **Recipient Caps:** Each outgoing message transaction supports a maximum of **100 `To` addresses** and **25 `Cc`/`Bcc` addresses**.

---

## 📝 License
This project is open-source and available under the [MIT License](LICENSE).
