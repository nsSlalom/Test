@isTest(SeeAllData=true)
private class TestEmailContact {
    
    @isTest static void TestEmail() {
    
   Messaging.InboundEmail email = new Messaging.InboundEmail();
   Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
                              

    email.plainTextBody = 'Frank, Heller Steven, Kris';
    email.fromAddress = 'test@test.com';
    String contactEmail ='ficknation@gmail.com';
    email.ccAddresses = new String[] {'jon smith <' + contactEmail + '>'};
    email.subject='Dummy Account Name 123';
    
    EmailContact edr = new EmailContact();
    
    
    Test.startTest();
    Messaging.InboundEmailResult result = edr.handleInboundEmail(email, env);
    Test.stopTest();
    
    System.assert(result.success);
    
    }
}