@isTest 
public class TestRestrictContactByName {
    @isTest static void testcon() {
        insert new Contact(LastName='INVALIDNAME', firstname='asdf');
        
    }
}