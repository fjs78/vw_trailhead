@isTest
public class LeadProcessorTest {
    @testSetup static void setup() {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200;i++) {
            leads.add(new Lead(Firstname = 'fn'+i, LastName='Ln'+i, Company = 'com' + i));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead]);
        System.assertEquals(200, [select count() from lead where leadsource ='Dreamforce']);
        System.assertEquals('Dreamforce', [select id, LeadSource from lead][0].LeadSource);
    }
}