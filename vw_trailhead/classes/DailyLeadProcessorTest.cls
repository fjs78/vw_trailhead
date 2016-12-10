@isTest
public class DailyLeadProcessorTest {
	@isTest
    static void testDailyLead() {
        String CRON_EXP = '0 30 21 28 6 ? 2016';
        List<Lead> leadsList = new List<Lead>();
        for(Integer i=0;i<200;i++) {            
            leadsList.add(new Lead(LastName = 'LN' + i, Company = 'Force ' + i));
        } 
        insert leadsList;
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessorTest', CRON_EXP, new DailyLeadProcessor());        
        Test.stopTest();
        System.assertEquals(200, [SELECT Count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}