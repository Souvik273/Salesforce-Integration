trigger AccountTrigger on Account(before insert,after insert,before update,after update){
    if(Trigger.IsBefore && (Trigger.isInsert || Trigger.isUpdate)){
        // No DML required for before scenario
        List<Account> accList = Trigger.NEW;
        for(Account acc: accList){
            if(String.isBlank(acc.Industry)){
                acc.Description = 'Industry is blank please provide value to industry field';
            }
            acc.Industry = 'Education';
            acc.ShippingStreet = String.isNotBlank(acc.BillingStreet) ? acc.BillingStreet : null;
            acc.ShippingCity = String.isNotBlank(acc.BillingCity) ? acc.BillingCity : null;
            acc.ShippingState = String.isNotBlank(acc.BillingState) ? acc.BillingState : null;
            acc.ShippingPostalCode = String.isNotBlank(acc.BillingPostalCode) ? acc.BillingPostalCode : null;
            acc.ShippingCountry = String.isNotBlank(acc.BillingCountry) ? acc.BillingCountry : null;
        }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        List<Account> newRecords = [SELECT Id,Name FROM Account WHERE Id IN : Trigger.New];
        List<Task> taskList = new List<Task>();
        for(Account acc: newRecords){
            Task taskRecord = new Task();
            taskRecord.Subject = 'This is created from Apex';
            taskRecord.Description = 'Created from Apex Trigger';
            taskRecord.ActivityDate = System.today().addDays(7);
            taskRecord.Status = 'Not Started';
            taskRecord.Priority = 'High';
            taskRecord.whatId = acc.Id;
            taskRecord.ownerId = acc.ownerId;
            taskList.add(taskRecord);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    else if(Trigger.isAfter && Trigger.isUpdate){
        if(!TriggerRecursionHandler.isAccountTriggerExecuted){
            TriggerRecursionHandler.isAccountTriggerExecuted = true;
            // Update the accounts to append update timestamp to description
            List<Account> accountsToUpdate = new List<Account>();
            for(Account acc : Trigger.new){
                Account accToUpdate = new Account(Id = acc.Id);
                accToUpdate.Description = acc.Description + ' - Last updated on ' + System.now().format('yyyy-MM-dd HH:mm:ss');
                accountsToUpdate.add(accToUpdate);
            }
            if(!accountsToUpdate.isEmpty()){
                update accountsToUpdate;
            }
        }
    }
}