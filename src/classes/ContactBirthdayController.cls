public class ContactBirthdayController{
    
    public Date inputDate{get;set;}
    public List<Contact> getBirthday(){       
         List<Contact> con = [Select LastName, BirthDate, Email 
                             From Contact Where BirthDate = :inputDate];
        if(inputDate != NUll){
            return con;
        }
        return null;      
    }               
    public void find(){        
      getBirthday();
    }    
}