trigger beginday on Task (before insert, before update) 
{
	List<Task> taskslist = [SELECT Id, Subject, CreatedById, OwnerId 
						    FROM Task 
						    WHERE Subject = 'Day Begin' AND CreatedById =: UserInfo.getUserId()];

	for(Task task1 : trigger.new)
	{
		if(taskslist.size() ==  0 && task1.Subject != 'Day Begin') 
		{
			task1.addError('Please ensure that you created Day Begin task before creating any other meeting.');
		}
	}

    List<Task> taskslist2 = [SELECT Id, Subject, CreatedById, OwnerId, ActivityDate  
	                         FROM Task 
	                         WHERE Subject = 'Day End' AND CreatedById =: UserInfo.getUserId() AND ActivityDate =: (Date.today() - 1)];

 	for(Task task2 : trigger.new)
	{
		if(taskslist2.size() ==  0) 
		{
			task2.addError('Please ensure that you have created Day End task for Yesterday before creating any other meeting.');
		}
	}
}