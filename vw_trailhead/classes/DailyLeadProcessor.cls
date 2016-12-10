global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leadsList = new List<Lead>();
        for(Lead lead : [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200]) {
            lead.LeadSource = 'Dreamforce';
            leadsList.add(lead);
        }
        update leadsList;
    }
}