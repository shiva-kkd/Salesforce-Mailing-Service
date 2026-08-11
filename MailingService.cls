public class MailingService {

    public static Boolean sendHtmlEmail(String toAddress, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new String[] { toAddress };
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setHtmlBody(body);
        mail.setUseSignature(false);
        
        try {
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            return handleSendResults(results);
        } catch (Exception ex) {
            System.debug('Email sending failed: ' + ex.getMessage());
            return false;
        }
    }

    private static Boolean handleSendResults(List<Messaging.SendEmailResult> results) {
        Boolean isSuccess = true;
        for (Messaging.SendEmailResult res : results) {
            if (!res.isSuccess()) {
                isSuccess = false;
                for (Messaging.SendEmailError err : res.getErrors()) {
                    System.debug('Email Error: ' + err.getStatusCode() + ' - ' + err.getMessage());
                }
            }
        }
        return isSuccess;
    }
}
