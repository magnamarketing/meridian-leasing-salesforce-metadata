/*******************************************************************************
 * Name             :   UserTriggerHandler
 * Description      :   Class containing methods called by the UserTrigger trigger
 *                          - calculate custom sharing for Community users
 * Tested By        :   UserTriggerTest
 * Created/Modified by                  Created/Modified Date
 * 1. Lindsay Holmes (Rafter One)        2022-11-22
*******************************************************************************/
public inherited sharing class UserTriggerHandler {
    public static final List<Id> communityProfileIds;
    static {
        Set<String> profNames = new Set<String>();
        for(CommunityCustomSharingProfile__mdt cmdt : [SELECT MasterLabel FROM CommunityCustomSharingProfile__mdt]) {
            profNames.add(cmdt.MasterLabel);
        }
        Map<Id, Profile> profiles = new Map<Id, Profile>([SELECT Id FROM Profile WHERE Name = :profNames]);
        communityProfileIds = new List<Id>(profiles.keySet());
    }
    public static void determineSharingInsert(List<User> triggerNew) {
        List<Id> userIds = new List<Id>();
        for(User u : triggerNew) {
            if(communityProfileIds.contains(u.ProfileId) && u.ContactId != null) {
                userIds.add(u.Id);
            }
        }
        if(!userIds.isEmpty() && !System.isBatch() && !System.isFuture()) {
            CommunitySharing_CreateBatch createBatch = new CommunitySharing_CreateBatch();
            createBatch.userIds = userIds;
            Database.executeBatch(createBatch, 50);
        }
    }
    public static void determineSharingUpdate(List<User> triggerNew, Map<Id, User> triggerOldMap) {
        List<Id> usersForShareDelete = new List<Id>();
        List<Id> usersForShareCreate = new List<Id>();
        for(User u : triggerNew) {
            if(communityProfileIds.contains(u.ProfileId) && !communityProfileIds.contains(triggerOldMap.get(u.Id).ProfileId)) {
                usersForShareCreate.add(u.Id);
            }
            if(!communityProfileIds.contains(u.ProfileId) && communityProfileIds.contains(triggerOldMap.get(u.Id).ProfileId)) {
                usersForShareDelete.add(u.Id);
            }
        }
        if(!usersForShareDelete.isEmpty() && !System.isBatch() && !System.isFuture()) {
            CommunitySharing_DeleteBatch deleteBatch = new CommunitySharing_DeleteBatch(true, false);
            deleteBatch.userIds = usersForShareDelete;
            Database.executeBatch(deleteBatch);
        }
        if(!usersForShareCreate.isEmpty() && !System.isBatch() && !System.isFuture()) {
            CommunitySharing_CreateBatch createBatch = new CommunitySharing_CreateBatch();
            createBatch.userIds = usersForShareCreate;
            Database.executeBatch(createBatch, 50);
        }
    }
}