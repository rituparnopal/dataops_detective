# CoCo CLI build prompts

Use these prompts during the hackathon so the build itself demonstrates CoCo.

## 1. Scaffold

> Create a Snowflake-native project called DataOps Detective. It should investigate data-quality incidents by correlating structured DQ/pipeline/schema-change data with unstructured operational documents. Use a Cortex Agent with a structured-data tool and Cortex Search. Keep remediation approval-gated.

## 2. Inspect

> Inspect the DATAOPS_DEMO.CORE schema. Explain which tables are useful for identifying a data-quality regression, which joins are needed, and what evidence would establish a likely root cause.

## 3. Build the semantic layer

> Create or refine a semantic view over DQ_RESULTS, PIPELINE_RUNS, SCHEMA_CHANGES and DQ_INCIDENTS for an investigation agent. Include clear descriptions for metrics and dimensions.

## 4. Build the search layer

> Create a Cortex Search service over OPERATIONAL_DOCUMENTS. Make DOC_TYPE and SOURCE_SYSTEM filterable.

## 5. Build the agent

> Create a Cortex Agent named DATAOPS_DETECTIVE. It must investigate DQ incidents using structured data and operational evidence. It must cite evidence IDs, quantify impact, assign confidence using explicit rules, and never perform production writes.

## 6. Test the golden question

> Investigate DQ incident DQ-1042. Explain why CUSTOMER_ID_NOT_NULL degraded on 2026-10-03, quantify impact, correlate the pipeline run with schema changes, search operational evidence, and produce an approval-gated remediation plan.

## 7. Improve

> Critique the current DataOps Detective answer for unsupported claims, missing evidence, unnecessary verbosity, and unsafe remediation. Then propose concrete improvements.
