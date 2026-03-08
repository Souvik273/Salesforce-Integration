trigger AccountTrigger on Account(before insert,after insert,before update,after update){
    AccountTriggerDispatcher.run(Trigger.OperationType);
}