/*******************************************************************************
 * Name             :   ContactTriggerHandler
 * Description      :   Class containing methods called by the Contacts trigger
 *                          - calculate custom sharing of Cases, Contacts, and Accounts for certain Community users
 * Tested By        :   ContactTriggerTest
 * Created/Modified by                  Created/Modified Date
 * 1. Lindsay Holmes (Rafter One)       2023-03-07
*******************************************************************************/
public inherited sharing class ContactTriggerHandler {
    public static void determineSharing(List<Contact> triggerNew, Map<Id, Contact> triggerOldMap) {
        Boolean recalculateSharing = false;
        for(Contact c : triggerNew) {
            if(c.Community_Sharing__c != triggerOldMap.get(c.Id).Community_Sharing__c) {
                recalculateSharing = true;
                break;
            }
        }
        if(recalculateSharing && !System.isBatch() && !System.isFuture()) {
            Database.executeBatch(new CommunitySharing_DeleteBatch());
        }
    }
}