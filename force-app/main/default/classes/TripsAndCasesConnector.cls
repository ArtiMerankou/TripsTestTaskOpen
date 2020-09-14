global with sharing class TripsAndCasesConnector implements Schedulable {

    global TripsAndCasesConnector() {}

    global void execute(SchedulableContext ctx) {
        Id batchJobId = Database.executeBatch(new BatchCasesManager(), 200);
    }

    global void checkCasesEveryNight() {
        String sch = '0 0 2 * * ?';
        String jobID = System.schedule('Search form Cases with TripID', sch, new TripsAndCasesConnector());
    }
}