trigger OpportunityTrigger on Opportunity (before insert,after insert,before update,after update) {
    OpportunityTriggerDispatcher.run(Trigger.OperationType);
}