@isTest
public class TestContactBirthdayController {

    @isTest static void TestBirthday(){
        
        ContactBirthdayController day = new ContactBirthdayController();
		Date inputDate = System.Today();        
        Contact a = new Contact(LastName = 'Serafin', Birthdate=System.Today(), 
                                  Email='yes@gmail.com');
        insert a;
        
        day.inputDate = System.Today();       
        List<Contact> ok = [Select LastName, BirthDate, Email 
                             From Contact Where BirthDate = :inputDate];
        
        System.assertEquals(1, ok.size());
        
        List<Contact> cons = day.getBirthday();
        day.find();
        System.assertEquals(1, cons.size());
         
        ContactBirthdayController days = new ContactBirthdayController();
        days.inputDate = NULL;
        
        Contact b = new Contact(LastName = 'Steve', Birthdate=System.Today(), 
                                  Email='ys@gmail.com');
        insert b;
        
        List<Contact> contacts = [Select LastName, BirthDate, Email 
                             From Contact Where BirthDate = :days.inputDate];
        List<Contact> check = new List<Contact>();
        days.getBirthday();
        
        System.assertEquals(0, contacts.size());
                                        
    }
}