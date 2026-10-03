# Snowflake DataOps Detective

**Hackathon prototype — Snowflake CoCo CLI / Cortex Agents**

## One-line pitch

DataOps Detective turns a vague data-quality alert into an evidence-backed root cause, impact assessment, and safe remediation plan by correlating Snowflake tables with operational documents.

## Demo question

> "Investigate today's customer data-quality degradation."

The agent correlates:
- DQ results
- pipeline runs
- schema changes
- customer/order data
- incident/runbook documents

and returns:
1. what failed
2. how many records are affected
3. the most likely root cause
4. supporting evidence
5. a remediation SQL proposal
6. a confidence score and approval requirement

## Architecture

```text
                         ┌───────────────────────┐
                         │      User / Demo       │
                         │ "Why did DQ drop?"    │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │       CoCo CLI        │
                         │ build / test / deploy │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │    Cortex Agent       │
                         │ Investigation Agent   │
                         └───────┬────────┬──────┘
                                 │        │
                    structured   │        │  unstructured
                                 │        │
                  ┌──────────────▼─┐    ┌─▼────────────────┐
                  │ Cortex Analyst │    │  Cortex Search   │
                  │ / SQL          │    │ logs/runbooks/   │
                  │                │    │ incidents        │
                  └───────┬────────┘    └────────┬─────────┘
                          │                      │
                          └──────────┬───────────┘
                                     ▼
                         ┌───────────────────────┐
                         │ RCA + Impact Analysis │
                         │ Evidence correlation  │
                         └───────────┬───────────┘
                                     ▼
                         ┌───────────────────────┐
                         │ Remediation Planner   │
                         │ SQL + approval gate   │
                         └───────────┬───────────┘
                                     ▼
                         ┌───────────────────────┐
                         │ Audit / DQ_INCIDENTS  │
                         └───────────────────────┘
```

## Repository

- `sql/01_setup.sql` — database, schema, tables and synthetic incident
- `sql/02_documents.sql` — operational evidence corpus
- `sql/03_search.sql` — Cortex Search service
- `sql/04_semantic.sql` — semantic view for structured analysis
- `sql/05_agent.sql` — Cortex Agent definition
- `app/streamlit_app.py` — lightweight demo UI
- `coco/prompts.md` — prompts to use with CoCo CLI during the build
- `DEMO_SCRIPT.md` — 5-minute judging script

## Build sequence

1. Create a Snowflake database/schema.
2. Run `sql/01_setup.sql`.
3. Run `sql/02_documents.sql`.
4. Create the Cortex Search service using `sql/03_search.sql`.
5. Create the semantic view using `sql/04_semantic.sql`.
6. Create the agent using `sql/05_agent.sql`.
7. Run the demo app or query the agent directly.
8. Use the CoCo prompts in `coco/prompts.md` to demonstrate that CoCo was used to build and refine the solution.

## Important

The prototype uses synthetic data. The remediation path is deliberately approval-gated. Do not grant the demo role write access to production tables.

## Current Snowflake direction

The implementation is intentionally aligned with current Cortex Agent capabilities:
- structured data through a semantic view / SQL tool
- unstructured evidence through Cortex Search
- optional analytical search for broader document analysis
- custom tool capability can later be added for controlled remediation

