public with sharing class EmailMessageManager {

    public static void debugEmailMessages(List<EmailMessage> emails ) {
        for (EmailMessage email : emails) {
            System.debug('debugEmailMessages ... incoming email ... ' + email);
        }
    }

    public static void parseTripIdIfExists(Map<Id, EmailMessage> mEmailMessages) {
        Set<Id> relatedCasesIds = new Set<Id>();
        List<Case> casesToUpdate = new List<Case>();
        for (EmailMessage email : mEmailMessages.values()){
            relatedCasesIds.add(email.RelatedToId);
        }
        Map<Id, Case> relatedCases = new Map<Id,Case> ([SELECT Id, TripID__c FROM Case WHERE Id IN :relatedCasesIds]);
        for (EmailMessage emailMessage : mEmailMessages.values()) {
            Case currentCase = relatedCases.get(emailMessage.RelatedToId);
            String bodyText = emailMessage.TextBody.toLowerCase();
            Integer tripIdIndex = bodyText.indexOf('t#');
            if (tripIdIndex >= 0) {
                try {
                    String tripId = emailMessage.TextBody.substring(tripIdIndex, tripIdIndex + 7);
                    System.debug('>>> Found TripId inside Email: ' + tripId);
                    currentCase.TripID__c = tripId;
                    casesToUpdate.add(currentCase);
                } catch (StringException ex) {
                    System.debug('parseTripIdIfExists... StringException ... Can\'t parse TripID. Incorrect format: ' + emailMessage.TextBody.substring(tripIdIndex));
                }
            }
        }

        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
}