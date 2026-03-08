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
        List<Account> accList = Trigger.NEW;
        for(Account acc: accList){
            acc.ShippingStreet = String.isNotBlank(acc.BillingStreet) ? acc.BillingStreet : null;
            acc.ShippingCity = String.isNotBlank(acc.BillingCity) ? acc.BillingCity : null;
            acc.ShippingState = String.isNotBlank(acc.BillingState) ? acc.BillingState : null;
            acc.ShippingPostalCode = String.isNotBlank(acc.BillingPostalCode) ? acc.BillingPostalCode : null;
            acc.ShippingCountry = String.isNotBlank(acc.BillingCountry) ? acc.BillingCountry : null;
        }
}