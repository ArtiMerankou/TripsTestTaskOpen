public with sharing class ConnectedTripsController {

    @AuraEnabled(Cacheable=true)
    public static List<Trip__c> getRelatedTrips (String accountId) {
        if (accountId == '' || accountId == null) {
            return null;
        }
        return [SELECT Id, Name FROM Trip__c WHERE Account__c =:accountId];
    }
}