trigger ContactNumber on Contact (before insert, before update) {

    set<Id> accountIds = new Set<Id>();
    for(Contact c : Trigger.new){
        
        accountIds.add(c.AccountId);
    }  	
 	List<Opportunity> ungroupedOpps = [Select AccountId From Opportunity Where 
                     AccountId IN :accountIds];
                        
   Map<Id, Integer> oppMap = new Map<Id, Integer>();   
    
   AggregateResult[] mapData = [Select AccountId, COUNT(Id) ids From Opportunity 
                        Where Id IN :ungroupedOpps AND AccountID != NULL Group By AccountId];
    for(AggregateResult a: mapData){
        
        oppMap.put((Id)a.get('AccountId'), (Integer)a.get('ids'));
    }   
    for(Contact d : Trigger.New){
        	if(oppMap.containsKey(d.AccountId)){
            	d.Number_of_Opportunities__c=oppMap.get(d.AccountId);
        	} else {
           		d.Number_of_Opportunities__c=0;         
        }      
    }   
}