@isTest
public class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://ap2.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        // Verify results
        System.assert(acc != null);

    }
    
    static Id createTestRecord() {
        Account acc = new Account(Name='Test');
        insert acc;
        Contact con = new Contact(LastName ='Test LN', AccountId = acc.Id);
        insert con;
        return acc.Id;
    }
}