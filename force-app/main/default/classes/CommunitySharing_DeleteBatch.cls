/*******************************************************************************
 * Name             :   CommunitySharing_DeleteBatch
 * Description      :   Batch class for deleting AccountShare, ContactShare, and CaseShare records
 * Tested By        :   CommunitySharingCalculatorTest
 * Created/Modified by                  Created/Modified Date
 * 1. Lindsay Holmes (Rafter One)        2022-11-22
*******************************************************************************/
public without sharing class CommunitySharing_DeleteBatch implements Database.Batchable<SObject> {
    public final Boolean isAccount;
    public final Boolean runCreateAll;
    public List<Id> userIds;
    private String query;
    public CommunitySharing_DeleteBatch() {
        this.isAccount = true;
        this.runCreateAll = true;
        query = 'SELECT Id FROM AccountShare WHERE RowCause = \'Manual\' AND AccountAccessLevel = \'Read\'';
    }
    public Database.QueryLocator start(Database.BatchableContext BC){ return Database.getQueryLocator(query); }
    public void execute(Database.BatchableContext BC, List<sObject> scope){ Database.DeleteResult[] drList = Database.delete(scope, false); }
    public void finish(Database.BatchableContext BC){
        if(isAccount) {
            CommunitySharing_DeleteBatch b = new CommunitySharing_DeleteBatch(true, runCreateAll);
            b.userIds = userIds;
            Database.executeBatch(b);
        }
    }
}