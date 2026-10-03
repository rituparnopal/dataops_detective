USE DATABASE DATAOPS_DEMO;
USE SCHEMA CORE;

-- Semantic view used by the Cortex Agent for structured questions.
-- Review/adjust syntax in Snowsight if your account's semantic-view release
-- requires additional metadata.

CREATE OR REPLACE SEMANTIC VIEW DATAOPS_SEMANTIC
  TABLES (
    DQ_RESULTS AS DATAOPS_DEMO.CORE.DQ_RESULTS,
    PIPELINE_RUNS AS DATAOPS_DEMO.CORE.PIPELINE_RUNS,
    SCHEMA_CHANGES AS DATAOPS_DEMO.CORE.SCHEMA_CHANGES,
    DQ_INCIDENTS AS DATAOPS_DEMO.CORE.DQ_INCIDENTS
  )
  FACTS (
    DQ_RESULTS.failed_rows AS failed_rows,
    DQ_RESULTS.total_rows AS total_rows,
    DQ_RESULTS.failure_rate AS failure_rate,
    PIPELINE_RUNS.rows_processed AS rows_processed,
    DQ_INCIDENTS.affected_rows AS affected_rows,
    DQ_INCIDENTS.confidence AS confidence
  )
  DIMENSIONS (
    DQ_RESULTS.rule_id AS rule_id,
    DQ_RESULTS.rule_name AS rule_name,
    DQ_RESULTS.table_name AS table_name,
    DQ_RESULTS.run_id AS run_id,
    PIPELINE_RUNS.pipeline_name AS pipeline_name,
    PIPELINE_RUNS.status AS pipeline_status,
    SCHEMA_CHANGES.change_id AS change_id,
    SCHEMA_CHANGES.object_name AS object_name,
    SCHEMA_CHANGES.change_type AS change_type,
    DQ_INCIDENTS.incident_id AS incident_id,
    DQ_INCIDENTS.severity AS severity,
    DQ_INCIDENTS.status AS incident_status
  );
