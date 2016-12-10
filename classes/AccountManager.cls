@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/','/contacts');
        List<Account> result = new List<Account>();
        if(accId instanceof Id) {
        	result =  [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                                FROM Account
                                WHERE Id = :accId];        
        }
        return result[0];
    }
}