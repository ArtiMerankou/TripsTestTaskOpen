public with sharing class EmailMessageTriggerHandler {

    public EmailMessageTriggerHandler() {}

    public void OnBeforeInsert(List<EmailMessage> newList) {
        EmailMessageManager.debugEmailMessages(newList);
    }

    public void OnAfterInsert(List<EmailMessage> newList, Map<Id, EmailMessage> newMap) {
        EmailMessageManager.debugEmailMessages(newList);
        EmailMessageManager.parseTripIdIfExists(newMap);
    }

    public void OnBeforeUpdate(List<EmailMessage> oldList, List<EmailMessage> updatedList, Map<Id, EmailMessage> newMap, Map<Id, EmailMessage> oldMap) {}

    public void OnAfterUpdate(List<EmailMessage> oldList, List<EmailMessage> updatedList, Map<Id, EmailMessage> newMap, Map<Id, EmailMessage> oldMap) {}

    public void OnBeforeDelete(List<EmailMessage> deletedList, Map<Id, EmailMessage> deletedMap) {}

    public void OnAfterDelete(List<EmailMessage> deletedList, Map<Id, EmailMessage> deletedMap) {}

    public void OnUndelete(List<EmailMessage> restoredList) {}
}