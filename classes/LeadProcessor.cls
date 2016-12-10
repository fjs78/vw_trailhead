global class LeadProcessor implements Database.Batchable<sObject>{

	global Database.QueryLocator start(Database.BatchableContext bc) {
		return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead WHERE Id != null]);                                         
    }
                                          
	global void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leads = new List<Lead>();
        for(Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
        }	
        update leads;
    }

	global void finish(Database.BatchableContext bc) {    	                                         
    }
                                          
}
//https://developer.salesforce.com/docs/atlas.en-us.202.0.apexcode.meta/apexcode/apex_classes_iterable.htm