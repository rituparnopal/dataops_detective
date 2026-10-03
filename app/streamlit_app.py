"""
Minimal optional UI for the hackathon demo.

This deliberately keeps the application thin. The intelligence lives in the
Snowflake Cortex Agent; the UI only sends the question and renders the answer.

Environment:
  SNOWFLAKE_CONNECTION_NAME=<name from connections.toml>

Install:
  pip install streamlit snowflake-connector-python

Run:
  streamlit run app/streamlit_app.py
"""

import os
import streamlit as st
import snowflake.connector

st.set_page_config(page_title="DataOps Detective", page_icon="🕵️", layout="wide")
st.title("🕵️ DataOps Detective")
st.caption("Evidence-backed data-quality investigation")

question = st.text_area(
    "Investigation request",
    "Investigate DQ incident DQ-1042. Why did customer data quality degrade today?"
)

if st.button("Investigate", type="primary"):
    conn = snowflake.connector.connect(
        connection_name=os.environ["SNOWFLAKE_CONNECTION_NAME"]
    )
    cur = conn.cursor()
    try:
        # DATA_AGENT_RUN syntax can vary by account/release.
        # Keep the exact invocation in one place so it is easy to update.
        safe_q = question.replace("'", "''")
        sql = f"""
        SELECT SNOWFLAKE.CORTEX.DATA_AGENT_RUN(
          'DATAOPS_DEMO.CORE.DATAOPS_DETECTIVE',
          '{safe_q}'
        )
        """
        cur.execute(sql)
        result = cur.fetchone()[0]
        st.markdown("### Investigation")
        st.write(result)
    finally:
        cur.close()
        conn.close()
