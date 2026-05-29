# Meridian Leasing Company - Salesforce Metadata

Exported by Magna Technology Group, 2026-05-29.

## Contents

| Type | Count |
|------|-------|
| Apex Classes | 200 |
| Apex Triggers | 98 |
| Flows | 159 |
| Workflow Objects | 9 |
| Approval Processes | 2 |
| Aura Bundles | 2 |
| Visualforce Pages | 30 |
| Visualforce Components | 5 |

## Repository Structure

```
force-app/main/default/
  classes/       - 200 Apex classes with meta XML
  triggers/      - 98 Apex triggers with meta XML
  flows/         - 159 Flow meta XML files
  workflows/     - 9 Workflow XML files
  approvalProcesses/ - 2 Approval Process XML files
  aura/          - Aura component bundles
  pages/         - 30 Visualforce pages
  components/    - 5 Visualforce components
```

## Notes

Apex class and trigger source files with large bodies include a retrieve instruction:
```
sf project retrieve start -m ApexClass:<ClassName>
```
to pull the full source from the Salesforce org.

## Open Items

- **Validation Rules**: The Validation Rules tab retrieval failed during export due to a special character or empty tab name in the source sheet. These require manual investigation and addition to this repository.
