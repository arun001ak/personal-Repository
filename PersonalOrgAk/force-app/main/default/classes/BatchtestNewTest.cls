@isTest
private class BatchtestNewTest {
    @isTest static void testBatchExecution() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;

        Test.startTest();
        BatchtestNew batch = new BatchtestNew();
        Id jobId = Database.executeBatch(batch, 200);
        Test.stopTest();

        System.assertNotEquals(null, jobId, 'Batch job should return a valid Id');
    }
}
