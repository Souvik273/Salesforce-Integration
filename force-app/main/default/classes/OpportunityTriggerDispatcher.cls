public with sharing class OpportunityTriggerDispatcher {
    public static void run(System.TriggerOperation opType){
        switch on opType{
            when BEFORE_INSERT{
                opportunityTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
            when AFTER_INSERT{
                //contactTriggerHandler.handleAfterInsert(Trigger.New);
            }
            when BEFORE_UPDATE{
                //contactTriggerHandler.handleBeforeInsert(Trigger.NEW);
            }
            when AFTER_UPDATE{
                //contactTriggerHandler.handleAfterUpdate(Trigger.New);
            }
            when BEFORE_DELETE{
                //contactTriggerHandler.handleBeforeUpdate(Trigger.New);
            }
            when AFTER_DELETE{
                //contactTriggerHandler.handleAfterInsert();
            }
            when AFTER_UNDELETE{
                //contactTriggerHandler.handleBeforeInsert();
            }
        }
    }
}