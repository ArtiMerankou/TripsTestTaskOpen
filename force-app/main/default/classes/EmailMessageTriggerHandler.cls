public with sharing class EmailMessageTriggerHandler {
// CONSTRUCTOR
    public EmailMessageTriggerHandler() {
    }

// BEFORE INSERT
    public void OnBeforeInsert(List<EmailMessage> newsObjects) {
        EmailMessageManager.debugEmailMessages(newsObjects);
    }

// AFTER INSERT
    public void OnAfterInsert(List<EmailMessage> newsObjects, Map<Id, EmailMessage> newsObjectMap) {
        EmailMessageManager.debugEmailMessages(newsObjects);
        EmailMessageManager.parseTripIdIfExists(newsObjectMap);
    }

// BEFORE UPDATE
    public void OnBeforeUpdate(List<EmailMessage> oldsObjects, List<EmailMessage> updatedsObjects, Map<Id, EmailMessage> newsObjectMap, Map<Id, EmailMessage> oldsObjectMap) {
    }

// AFTER UPDATE
    public void OnAfterUpdate(List<EmailMessage> oldsObjects, List<EmailMessage> updatedsObjects, Map<Id, EmailMessage> newsObjectMap, Map<Id, EmailMessage> oldsObjectMap) {
    }

// BEFORE DELETE
    public void OnBeforeDelete(List<EmailMessage> deletedsObjects, Map<Id, EmailMessage> sObjectMap) {

    }
// AFTER DELETE
    public void OnAfterDelete(List<EmailMessage> deletedsObjects, Map<Id, EmailMessage> sObjectMap) {
    }

// (AFTER) UNDELETE
    public void OnUndelete(List<EmailMessage> restoredsObjects) {

    }
}