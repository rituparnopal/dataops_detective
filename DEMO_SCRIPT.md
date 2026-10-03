# 5-minute judging demo

## 0:00 — Problem

"Data-quality alerts tell engineers WHAT failed. They usually do not tell them WHY it failed. Engineers have to correlate database results, pipeline runs, schema changes and operational documents."

## 0:40 — Product

"DataOps Detective turns that investigation into an evidence-backed workflow inside Snowflake."

Show the architecture.

## 1:10 — Trigger

Ask:

> Investigate DQ incident DQ-1042. Why did customer data quality degrade today?

## 1:40 — Structured investigation

Show:
- current failure rate: 24.876%
- historical failure rate: 0.024%
- 12,438 affected records
- RUN-999
- CHG-441

Explain that the agent is querying governed Snowflake data rather than receiving a pasted spreadsheet.

## 2:30 — Unstructured evidence

Show evidence:
- DOC-001 pipeline log
- DOC-002 change ticket
- DOC-003 runbook
- DOC-004 previous incident

Key insight:

"The same causal pattern appears in the pipeline log, change ticket and historical incident."

## 3:15 — Root cause

Expected result:

> CRM mapping change CHG-441 introduced a customerNumber → customer_id mapping mismatch during CUSTOMER_SYNC_07.

Confidence: high because independent structured and unstructured signals agree.

## 3:45 — Remediation

Show:

1. restore mapping
2. validate affected batch
3. replay failed records
4. add regression DQ rule

Then say:

"DataOps Detective does not silently modify production. It creates an approval-gated remediation plan."

## 4:20 — Why Snowflake

- structured enterprise data stays in Snowflake
- unstructured evidence is searchable through Cortex Search
- Cortex Agent orchestrates the investigation
- CoCo CLI accelerates development and refinement
- governance and permissions remain inside the platform

## 4:45 — Close

"DataOps Detective is not another chatbot. It is an investigation workflow: anomaly → evidence → root cause → impact → safe action."

