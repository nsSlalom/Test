global class EmailContact implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                                                         Messaging.Inboundenvelope envelope) {
    	
    Contact c;                                                   
	Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    
    List<Contact> con = new List<Contact>();
                                                             
    String[] body = email.plainTextBody.split('\n');
    
    for(String text : body){
         
        String[] ok = text.split(', ');
        c = new Contact(FirstName = ok[0], LastName = ok[1]);
        con.add(c);
    }                                                                                                                   
        
      insert con;
        //test 
        //ok
   	 return result;                                                                                                                                                                                                                                                                                         
    
  }
    
}
