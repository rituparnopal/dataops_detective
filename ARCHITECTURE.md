# Architecture decisions

## Why one agent?

For the MVP, a single orchestrating Cortex Agent is easier to explain and judge than several loosely coordinated agents.

The agent has two evidence planes:

### Structured
- DQ_RESULTS
- PIPELINE_RUNS
- SCHEMA_CHANGES
- DQ_INCIDENTS

### Unstructured
- pipeline logs
- change tickets
- runbooks
- historical incidents

## Why not pure RAG?

A RAG-only application could retrieve the runbook, but it would struggle to calculate the actual failure-rate change, compare historical runs and quantify affected rows.

## Why not pure SQL?

SQL can calculate the impact but cannot efficiently interpret free-form incident notes, deployment descriptions and runbooks.

## The differentiator

The root cause is formed by correlating both planes.

Example:

Structured:
`DQ-001 failure rate = 24.876%`

Structured:
`RUN-999 started 08:30`

Structured:
`CHG-441 at 08:42`

Unstructured:
`DOC-001 says missing customer_id began after the mapping deployment`

Unstructured:
`DOC-004 describes the same historical failure pattern`

Together these produce a defensible RCA.

## Safety

The agent is read-only during investigation.

A future production version can expose a custom tool for remediation. That tool should:
- accept only approved remediation IDs
- validate row counts
- use a transaction
- write an audit record
- require explicit human approval
- support rollback
