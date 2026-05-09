public class BatchtestNew implements Database.Batchable<SObject> {
    private final String query;

    public BatchtestNew() {
        query = 'SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 200';
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Account> accounts = (List<Account>)scope;
        for (Account acc : accounts) {
            System.debug('Batch processed Account: ' + acc.Name + ' (' + acc.Id + ')');
            system.debug('test');
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch job completed: ' + bc.getJobId());
    }
}