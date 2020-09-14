global with sharing class BatchCasesManager implements Database.Batchable<SObject>{
    global BatchCasesManager() {}

    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id, TripID__c, CaseNumber FROM Case WHERE Trip__c = NULL AND TripID__c != NULL AND AccountId = NULL';
        Database.QueryLocator result = Database.getQueryLocator(query);
        System.debug(result);
        return result;
    }
    
    global void execute(Database.BatchableContext BC, List<Case> caseList) {
       
        Set<String> tripIds = new Set<String>();
        for (Case incomingCase : caseList) {
            tripIds.add(incomingCase.TripID__c);
        }

        List<Trip__c> trips = [SELECT Id, Account__c, Name FROM Trip__c WHERE Name IN :tripIds];
        Map<String, Trip__c> mTripsNames = new Map<String, Trip__c>();
        for (Trip__c trip : trips) {
            mTripsNames.put(trip.Name, trip);
        }

        for (Case incomingCase : caseList) {
            Trip__c theTrip = mTripsNames.get(incomingCase.TripID__c.toUpperCase());
            Id accountId = theTrip.Account__c;
            incomingCase.AccountId = accountId;
            incomingCase.Trip__c = theTrip.Id;
            System.debug('connectAccountToCaseByTripId... updating case... ' + incomingCase);
        }

        try {
            Database.update(caseList, false);
        } catch(Exception e) {
            System.debug(e);
        }
    }   
    
    global void finish(Database.BatchableContext BC) {
        System.debug('Batch finished');
  }
}