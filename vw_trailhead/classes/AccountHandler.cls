/**
* @author vaibhav@trailhead.com
* @description 
*/
public class AccountHandler {
    public static Account insertNewAccount(String accName) {
        try {
            Account account = new Account();
            account.Name = accName;
            insert account;
            return account;
        } catch(DMLException dmlExp) {
            return null;
        }  catch(Exception exp) {
            return null;   
        }
    } 
}