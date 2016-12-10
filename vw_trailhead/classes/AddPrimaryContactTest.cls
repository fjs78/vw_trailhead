@isTest
public class AddPrimaryContactTest {
	@TestSetup
    static void prepareTestData() {
        List<Account> accountList = new List<Account>();
        
        for(Integer i=0; i<50; i++)
			accountList.add(new Account(Name = 'NY' + i, BillingState = 'NY'));
        for(Integer i=0; i<50; i++)
			accountList.add(new Account(Name = 'CA' + i, BillingState = 'CA'));

        Database.insert(accountList);
    }
    
    @isTest
    static void testAddPrimaryContact() {
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(new Contact(LastName = 'test'),'CA'));
        Test.stopTest();
        //System.debug('====' + [SELECT Count() FROM Contact WHERE AccountId IN: [SELECT Id FROM Account WHERE BillingState = 'CA']]);
        System.assert([SELECT Count() FROM Contact WHERE AccountId IN: [SELECT Id FROM Account WHERE BillingState = 'CA']] == 50);
    }
}