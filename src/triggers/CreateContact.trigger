trigger CreateContact on Account (after insert) {

    List<Contact> con = new List<Contact>();
    
    for(Account a : Trigger.new){
        
        Contact c = new Contact(LastName = a.Name, AccountId=a.Id);
        con.add(c);
    }
    insert con;
}