@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates() {
        VerifyDate.CheckDates(System.today(),System.today()+10);
        VerifyDate.CheckDates(System.today(),System.today()+50);
    } 
}