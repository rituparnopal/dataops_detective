USE DATABASE DATAOPS_DEMO;
USE SCHEMA CORE;

CREATE OR REPLACE TABLE OPERATIONAL_DOCUMENTS (
    DOC_ID STRING,
    DOC_TYPE STRING,
    DOC_TS TIMESTAMP_NTZ,
    TITLE STRING,
    CONTENT STRING,
    SOURCE_SYSTEM STRING
);

INSERT INTO OPERATIONAL_DOCUMENTS VALUES
('DOC-001','PIPELINE_LOG','2026-10-03 08:43:00','CUSTOMER_SYNC_07 run 999',
'Pipeline CUSTOMER_SYNC_07 completed successfully but emitted 12,438 records with missing customer_id. The mapping stage was changed during the 08:42 deployment.',
'DATA_PLATFORM'),
('DOC-002','CHANGE_TICKET','2026-10-03 08:40:00','CRM sync refactor',
'Change CHG-441 updates the CRM mapping. The source field customerNumber is now expected to map to customer_id. Downstream consumers still validate customer_id.',
'JIRA'),
('DOC-003','RUNBOOK','2026-09-20 10:00:00','Customer ID remediation',
'When customer_id null failures follow a mapping change, first restore the source-to-target mapping, validate the affected batch, then reprocess only failed records. Do not update production rows without approval.',
'DATA_PLATFORM'),
('DOC-004','INCIDENT','2026-08-19 14:00:00','Previous CRM mapping incident',
'A previous incident showed the same pattern: a CRM field rename caused customer_id null failures immediately after deployment. Resolution was to restore the mapping and replay the affected batch.',
'INCIDENT_MGMT');
