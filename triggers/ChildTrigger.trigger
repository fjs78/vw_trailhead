trigger ChildTrigger on Child1__c (after insert, after update) {
    Map<Id, Decimal> idVsAmountMap = new Map<Id, Decimal>();
    Map<Id, Decimal> idVsQTYMap = new Map<Id, Decimal>();
    Map<Id, Integer> idVsCountMap = new Map<Id, Integer>();
    
    List<Id> parentIds = new List<Id>();
    for(Child1__c cc : [SELECT Id, Parent1__c FROM Child1__c WHERE Id IN : Trigger.new]  ) {
        parentIds.add(cc.Parent1__c); 
    }
    Map<Id, Child1__c> childMap = new Map<Id, Child1__c>([SELECT Id, Parent1__c FROM Child1__c WHERE Parent1__c IN : parentIds]);
    
    for(AggregateResult ar :
        			[SELECT Parent1__c , SUM(Amount__c ) totalval, SUM(Qty__c) totalqty, Count(Name) totalcount
                        FROM Child1__c
                        WHERE Id IN : childMap.keySet()
                        GROUP BY ROLLUP(Parent1__c)]){
             	idVsAmountMap.put((Id)ar.get('Parent1__c'), (Decimal)ar.get('totalval'));
                idVsQTYMap.put((Id)ar.get('Parent1__c'), (Decimal)ar.get('totalqty'));
                idVsCountMap.put((Id)ar.get('Parent1__c'), (Integer)ar.get('totalcount'));
         }
    
    List<Parent1__c> parentToBeUpdates = new List<Parent1__c>();
    
    for(Parent1__c parent : [SELECT Id, Total_Amount__c, Total_Qty__c, Total_Children__c  FROM Parent1__c 
                             WHERE Id IN: idVsAmountMap.keySet()]) {
		 parent.Total_Amount__c  = idVsAmountMap.get(parent.Id);
         parent.Total_Qty__c     = idVsQTYMap.get(parent.Id);
         parent.Total_Children__c = idVsCountMap.get(parent.Id);
                                 
         parentToBeUpdates.add(parent);
    }
    
    update parentToBeUpdates;
}