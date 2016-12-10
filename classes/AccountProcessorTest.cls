@isTest(seeAllData = true)
public class AccountProcessorTest {
    @isTest
    public static void testCountContacts() {
        List<String> accids = new List<String>();
        Map<Id, Account> accmap = new Map<Id, Account>([SELECT Id,Number_of_Contacts__c FROM Account]);
        for(Id theid : accmap.keySet())
            accids.add(theid);
       
        Test.startTest();
        	AccountProcessor.countContacts(accids);
        Test.stopTest();
    }
}