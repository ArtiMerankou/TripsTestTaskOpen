public with sharing class CaseManager {
    public static void connectAccountToCaseByTripId(List<Case> cases) {
        Set<String> tripIds = new Set<String>();
        for (Case incomingCase : cases) {
            if (incomingCase.TripID__c != null && incomingCase.AccountId == null) {
                tripIds.add(incomingCase.TripID__c);
            }
        }
        if (!tripIds.isEmpty()) {
            List<Trip__c> trips = [SELECT Id, Account__c, Name FROM Trip__c WHERE Name IN :tripIds];
            Map<String, Trip__c> mTripsNames = new Map<String, Trip__c>();
            for (Trip__c trip : trips) {
                mTripsNames.put(trip.Name, trip);
            }
            for (Case incomingCase : cases) {
                if (incomingCase.TripID__c != null && incomingCase.AccountId == null) {
                    Trip__c theTrip = mTripsNames.get(incomingCase.TripID__c.toUpperCase());
                    Id accountId = theTrip.Account__c;
                    incomingCase.AccountId = accountId;
                    incomingCase.Trip__c = theTrip.Id;
                    System.debug('connectAccountToCaseByTripId... updating case... ' + incomingCase);
                }
            }
        }
    }
}