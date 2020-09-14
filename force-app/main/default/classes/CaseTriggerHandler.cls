public with sharing class CaseTriggerHandler {

    public CaseTriggerHandler() {}

    public void OnBeforeInsert(List<Case> newList) {}

    public void OnAfterInsert(Map<Id, Case> newMap) {}

    public void OnBeforeUpdate(List<Case> oldList, List<Case> newList, Map<Id, Case> newMap, Map<Id, Case> oldMap) {
        CaseManager.connectAccountToCaseByTripId(newList);
    }

    public void OnAfterUpdate(List<Case> oldList, List<Case> updatedList, Map<Id, Case> newMap, Map<Id, Case> oldMap) {}

    public void OnBeforeDelete(List<Case> deletedList, Map<Id, Case> deletedMap) {}

    public void OnAfterDelete(List<Case> deletedList, Map<Id, Case> deletedMap) {}

    public void OnUndelete(List<Case> restoredList) {}
}