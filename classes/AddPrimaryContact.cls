public class AddPrimaryContact implements Queueable{
    private Contact contact {get;set;}
    private String state {get;set;}
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> contactList = new List<Contact>();
        
        List<Account> acclist = [SELECT Id, Name, BillingState FROM Account WHERE BillingState =: state LIMIT 200];
        for(Account acc : acclist) {
			Contact newContact = contact.clone();
            newContact.AccountId = acc.Id;
            contactList.add(newContact);
        }
        Database.insert(contactList);
    }
}