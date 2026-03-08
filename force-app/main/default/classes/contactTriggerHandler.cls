public with sharing class contactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : conList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        Map<Id,Account> accMap = new Map<Id,Account>([SELECT Id,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet,Description FROM Account WHERE Id IN: accIds]);
        for(Contact con:conList){
            if(!String.isEmpty(con.AccountId)){
                /*Account acc = [SELECT Id,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet FROM Account WHERE Id=:con.AccountId];*/     // Bad practice running soql inside loop
                Account acc = accMap.get(con.AccountId);
                con.MailingCity = acc.BillingCity;
                con.MailingCountry = acc.BillingCountry;
                con.MailingPostalCode = acc.BillingPostalCode;
                con.MailingState = acc.BillingState;
                con.MailingStreet = acc.BillingStreet;
                con.Description = acc.Description;
            }
        }
    }
    public static void handleBeforeUpdate(List<Contact> conList){
        for(Contact con: conList){
            con.Fax = con.Phone;
        }
    }
}