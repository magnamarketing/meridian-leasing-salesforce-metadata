/*******************************************************************************
 * Name             :   CommunitySharingCalculator
 * Description      :   Schedulable class used to kick off batches that calculate custom sharing
 * Tested By        :   CommunitySharingCalculatorTest
 * Created/Modified by                  Created/Modified Date
 * 1. Lindsay Holmes (Rafter One)        2022-11-22
*******************************************************************************/
public without sharing class CommunitySharingCalculator implements Schedulable {
    public List<Id> userIds;
    public void execute(SchedulableContext SC) {
        Datetime last13Hours = System.now().addHours(-13);
        Integer acrCount = [SELECT count() FROM AccountContactRelation WHERE LastModifiedDate > :last13Hours];
        if(acrCount > 0) {
            CommunitySharing_DeleteBatch b = new CommunitySharing_DeleteBatch();
            b.userIds = userIds;
            Database.executeBatch(b);
        }
    }
}