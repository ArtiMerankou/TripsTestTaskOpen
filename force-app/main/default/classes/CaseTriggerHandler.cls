public with sharing class CaseTriggerHandler {

// CONSTRUCTOR
    public CaseTriggerHandler() {
    }

// BEFORE INSERT
    public void OnBeforeInsert(List<Case> newsObjects) {
    }

// AFTER INSERT
    public void OnAfterInsert(Map<Id, Case> newsObjectMap) {

    }

// BEFORE UPDATE
    public void OnBeforeUpdate(List<Case> oldsObjects, List<Case> updatedsObjects, Map<Id, Case> newsObjectMap, Map<Id, Case> oldsObjectMap) {
        CaseManager.connectAccountToCaseByTripId(updatedsObjects);
    }

// AFTER UPDATE
    public void OnAfterUpdate(List<Case> oldsObjects, List<Case> updatedsObjects, Map<Id, Case> newsObjectMap, Map<Id, Case> oldsObjectMap) {
    }

// BEFORE DELETE
    public void OnBeforeDelete(List<Case> deletedsObjects, Map<Id, Case> sObjectMap) {

    }
// AFTER DELETE
    public void OnAfterDelete(List<Case> deletedsObjects, Map<Id, Case> sObjectMap) {
    }

// (AFTER) UNDELETE
    public void OnUndelete(List<Case> restoredsObjects) {

    }
}