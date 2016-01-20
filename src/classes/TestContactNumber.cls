@isTest
private class TestContactNumber {

    @isTest static void TestCreateNumbers() {
        
        Account acct = new Account(Name='Test 1');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + 'Opportunity',
                                          StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=acct.Id);
        insert opp;
        
        Contact con = new Contact(FirstName='Tyler', LastName='Gurkens', AccountId= acct.Id);                            
        Integer a = [Select count() From Opportunity Where 
                     Opportunity.AccountId = :con.AccountId];
        con.Number_of_Opportunities__c = a;
        insert con;
        
        System.assertEquals(1, con.Number_of_Opportunities__c);
        
        Contact ser = new Contact(Firstname ='Steve', LastName='Darkwa');
         
        Integer b = [Select count() From Opportunity Where 
                     Opportunity.AccountId = Null];
        ser.Number_of_Opportunities__c = b;
        insert ser;
        System.assertEquals(0, ser.Number_of_Opportunities__c);                                      
    }                 
}