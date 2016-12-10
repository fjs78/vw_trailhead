public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count, String name) {
        List<Contact> conlist = new List<Contact>();
        for(Integer i=0; i < count; i++) {
            conlist.add(new Contact(FirstName = 'name' + i, LastName = name));
        }
        return conlist;
    }
}