trigger ContactTrigger on Contact (before insert,before update) {
    contactTriggerDispatcher.run(Trigger.OperationType);
}