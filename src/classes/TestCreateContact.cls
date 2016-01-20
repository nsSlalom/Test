@isTest
private class TestCreateContact {

    @isTest static void TestCreateCons() {
                Account acct = new Account(Name='Test 1');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + 'Opportunity',
                                          StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=acct.Id);
        insert opp;
        
        Contact con = new Contact(FirstName='Tyler', LastName='Gurkens', AccountId= acct.Id);
        
        Contact ser = new Contact(FirstName='Steve', LastName='Gurkens');
        
      
        Integer a = [Select count() From Opportunity Where 
                     Opportunity.AccountId = :con.AccountId];
        con.Number_of_Opportunities__c = a;
        insert con;
        
        System.assertEquals(1, con.Number_of_Opportunities__c);
        
    }
}