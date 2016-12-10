public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String searchstr) {
		return [FIND :searchstr IN ALL FIELDS 
                   RETURNING Lead(Name),Contact(FirstName,LastName,Department)];        
    }
}