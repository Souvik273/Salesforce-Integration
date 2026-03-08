public with sharing class AccountTriggerDispatcher {
    public static void run(System.TriggerOperation opType){
        switch on opType{
            when BEFORE_INSERT{
                AccountTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
            when AFTER_INSERT{
                AccountTriggerHandler.handleAfterInsert(Trigger.New);
            }
            when BEFORE_UPDATE{
                //AccountTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
            when AFTER_UPDATE{
                AccountTriggerHandler.handleAfterUpdate(Trigger.New);
            }
            when BEFORE_DELETE{
                //AccountTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
            when AFTER_DELETE{
                //AccountTriggerHandler.handleAfterInsert(Trigger.New);
            }
            when AFTER_UNDELETE{
                //AccountTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
        }
    }
}