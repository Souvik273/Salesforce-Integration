public with sharing class opportunityTriggerHandler {
    public static void handleBeforeInsert(List<Opportunity> oppList){
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList){
            if(opp.AccountId == null){
                Task taskRecord = new Task();
                taskRecord.Subject = 'Opportunity is created without Account';
                taskRecord.Description = 'Opportunity is created without Account, Please assign the Correct account to Opportunity.';
                taskRecord.ActivityDate = System.today().addDays(7);
                taskRecord.Status = 'Not Started';
                taskRecord.Priority = 'High';
                taskRecord.whatId = opp.Id;
                taskRecord.ownerId = opp.ownerId;
                taskList.add(taskRecord);
            }
            if(!taskList.isEmpty()){
                insert taskList;
            }
        }
    }
}