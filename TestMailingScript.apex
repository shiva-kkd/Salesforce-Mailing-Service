String recipient = 'your-email@example.com'; 
String emailSubject = 'Salesforce Test Email';
String htmlContent = '<h1>Success!</h1><p>My custom Apex mailing service works perfectly.</p>';

Boolean isSent = MailingService.sendHtmlEmail(recipient, emailSubject, htmlContent);
System.debug('>>> WAS EMAIL SENT? ' + isSent);
