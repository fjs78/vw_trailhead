public class TaskTriggerHandler {
    
    public static void ensureDayBeginTask(List<Task> newTasks) {
        List<Task> taskslist = [SELECT Id, Subject, CreatedById, OwnerId 
                                FROM Task 
                                WHERE Subject = 'Day Begin' AND CreatedById =: UserInfo.getUserId()];

		for(Task task : newTasks) {
            if(taskslist.size() ==  0 && task.Subject != 'Day Begin') {
                task.addError(Label.DayNotBeginError);
            }
        }
    }
    
    // 
    public static void ensureDayEndTask(List<Task> newTasks) {
        List<Task> taskslist = [SELECT Id, Subject, CreatedById, OwnerId 
                                FROM Task 
                                WHERE Subject = 'Day End' AND CreatedById =: UserInfo.getUserId() AND CreatedDate =: (Date.today() - 1)];

		for(Task task : newTasks) {
            if(taskslist.size() ==  0) {
                task.addError(Label.DayNotEndError);
            }
        }
    }
}