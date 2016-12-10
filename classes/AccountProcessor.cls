public class AccountProcessor {
    @future
    public static void countContacts(List<String> accountIds) {
        List<Account> updatedAccs = new List<Account>();
        
        for(Account acc : [SELECT Id,Number_of_Contacts__c, (SELECT Id FROM Contacts)
                                   FROM Account
                                   WHERE Id IN :accountIds ]) {
                               
            acc.Number_of_Contacts__c = acc.Contacts.size();
            updatedAccs.add(acc);  
            // system.debug                        from class
        }
            
        update updatedAccs;
    }
}