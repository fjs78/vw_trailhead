trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account account : Trigger.new) {
        if(account.Match_Billing_Address__c && null != account.BillingPostalCode) {
            account.ShippingPostalCode = account.BillingPostalCode;
        }
    }
}