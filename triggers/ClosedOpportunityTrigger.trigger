trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> newTasks = new List<Task>();
    for(Opportunity opp : [SELECT Id, Name, StageName FROM Opportunity 
                           WHERE Id IN: Trigger.new AND 
                           StageName = 'Closed Won']) {
		Task task = new Task();
		task.WhatId = Opp.Id;
		task.Subject = 'Follow Up Test Task';
		task.ActivityDate = System.Today() + 1;
		newTasks.add(task);		               
	}
    insert newTasks;
}