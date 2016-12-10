trigger TaskTrigger on Task (before insert, before update) {
	TaskTriggerHandler.ensureDayBeginTask(Trigger.new);
}