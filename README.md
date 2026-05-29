# Meridian Leasing Company | Salesforce Metadata Repository

**Client:** Meridian Leasing Company  
**Project:** Sales Cloud Migration | MLC | 05/26  
**Prepared By:** Magna Technology Group  
**Initialized:** 2026-05-29  

---

## Overview

This repository contains the Salesforce DX project structure for the Meridian Leasing Company org-to-org Sales Cloud migration. All metadata files are scaffolded from the migration inventory workbook and serve as placeholders until actual metadata is retrieved from the source org.

> To retrieve actual metadata from the source org, use:
> ```bash
> sf project retrieve start --manifest manifest/package.xml --target-org <source-org-alias>
> ```

---

## Project Structure

```
meridian-leasing-salesforce-metadata/
├── force-app/
│   └── main/
│       └── default/
│           ├── objects/          # Object & Record Type metadata
│           └── flows/            # Flow metadata
├── manifest/
│   └── package.xml               # Deployment manifest
├── sfdx-project.json
├── .gitignore
└── README.md
```

---

## In-Scope Objects

| Object API Name | Object Label | Type | Migration Approach | Notes |
|---|---|---|---|---|
| `Account` | Account | Standard | Full | Core object |
| `Contact` | Contact | Standard | Full | |
| `Opportunity` | Opportunity | Standard | Full | |
| `Lead` | Lead | Standard | Full | |
| `Campaign` | Campaign | Standard | Full | |
| `Task` | Task | Standard | Full | Activity migration; ~150K records |
| `Event` | Event | Standard | Full | Activity migration |
| `Product2` | Product2 | Standard | Full | |
| `CampaignMember` | CampaignMember | Standard | Full | |
| `MLC_Asset__c` | MLC Asset | Custom | Full | |
| `PricebookEntry` | Pricebook Entry | Standard | Full | |

---

## Record Types

| Object | Record Type Label | Developer Name | Status |
|---|---|---|---|
| Account | MLC | `MLC` | Active |
| Campaign | Campaign | `Campaign_v2` | Active |
| Campaign | Campaign: Email | `Campaign_Email` | Active |
| Campaign | Tradeshow | `Tradeshow2` | Active |
| CampaignMember | Campaign Member: MLC | `Campaign_Member_MLC` | Active |
| Contact | MLC Contact | `MLC_Contact` | Active |
| Event | MLC Layout | `MLC_Layout` | Active |
| Lead | MLC | `MLC` | Active |
| Opportunity | MLC | `MLC` | Active |
| Product2 | MLC Products | `MLC_Products` | Active |
| Task | MLC Tasks | `MLC_tasks` | Active |

---

## Flows

| Flow Label | API Name | Type | Status | API Version | Last Modified |
|---|---|---|---|---|---|
| MLC Asset: Automations After Save | `MLC_Asset_Automations_After_Save` | AutoLaunchedFlow | Active | 58 | 2024-10-30 |
| MLC Asset: Automations Before Save | `MLC_Asset_Automations_Before_Save` | AutoLaunchedFlow | Active | 60 | 2024-04-04 |
| MLC Asset: Create and Assign task to BDA | `MLC_Asset_Create_and_Assign_task_to_BDA` | AutoLaunchedFlow | Active | 60 | 2024-05-30 |
| MLC Asset: Inventory Automation | `MLC_Asset_Inventory_Automation` | AutoLaunchedFlow | Active | 60 | 2025-07-28 |
| MLC-CreateContactRoleOpportunity | `MLC_CreateContactRoleOpportunity` | AutoLaunchedFlow | Active | 60 | 2024-05-30 |
| mlc_update_assigned_user_on_asset | `mlc_update_assigned_user_on_asset` | AutoLaunchedFlow | Active | 60 | 2024-05-30 |
| Account: New MLC Opportunity | `Account_New_MLC_Opportunity` | Screen Flow | Active | 60 | 2024-12-16 |
| Opportunity: Automations After Save MLC | `Opportunity_Automations_After_Save_MLC` | AutoLaunchedFlow | Active | 62 | 2025-08-11 |
| Opportunity: Close/Win Opportunity | `Opportunity_Close_Win_Opportunity` | Screen Flow | Active | 64 | 2025-09-24 |
| Product: Automations After Save | `Product_Automations_After_Save` | AutoLaunchedFlow | Active | 60 | 2026-03-16 |
| Lead: Automations After Save | `Lead_Automations_After_Save` | AutoLaunchedFlow | Active | 65 | 2026-01-16 |
| Lead: Automations Before Save | `Lead_Automations_Before_Save` | AutoLaunchedFlow | Active | 65 | 2026-01-16 |
| Task: Automations After Save | `Task_Automations_After_Save` | AutoLaunchedFlow | Active | 65 | 2026-01-16 |
| Task: Automations Before Save | `Task_Automations_Before_Save` | AutoLaunchedFlow | Active | 63 | 2025-03-27 |
| Contact: Automation After Save MLC Contact | `Contact_Automation_After_Save_MLC_Contact` | AutoLaunchedFlow | Active | 62 | 2024-10-30 |
| Event: Automations After Save - Create | `Event_Automations_After_Save_Create` | AutoLaunchedFlow | Active | 62 | 2024-10-30 |
| Campaign: Automations After Save | `Campaign_Automations_After_Save` | AutoLaunchedFlow | Active | 65 | 2026-01-16 |

---

## Notes

- The **Validation Rules** tab was present in the inventory workbook but returned no data (pending re-fetch from source org).
- All flow and object files in this repository are **placeholders**. Actual XML content must be retrieved from the Meridian source org prior to any deployment activity.
- The `MLC_Asset__c` custom object must be fully retrieved before deploying to the target org, as no standard Salesforce template exists for it.

---

*Magna Technology Group | Confidential*
