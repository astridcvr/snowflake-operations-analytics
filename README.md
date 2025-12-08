README.md — Snowflake Analytics Simulation Project

### Snowflake Analytics Simulation Project

---

# Author: Astrid Villalobos
# Role: Data Analyst / Data Engineering Portfolio Project
# Tools: Snowflake · SQL · Power BI · Kaggle · Data Modeling

---

# Project Overview
This project simulates an end-to-end analytics workflow using Snowflake and real-world e-commerce data from Kaggle.
To enrich the analysis, the project generates simulated production and quality testing data, allowing for a more realistic multi-domain analytics scenario similar to what a technology, manufacturing, or telecom company would handle.

The goal is to demonstrate:
- Database & schema design
- Table creation (real + simulated data)
- Analytical SQL (joins, window functions, KPIs)
- Data quality metrics
- Production monitoring
- Visual analytics (Power BI dashboard)
- Reproducible project structure for industry use

---

# 📂 Repository Structure
/sql
   ├── 01_create_tables.sql
   ├── 02_simulation_data.sql
   └── 03_analysis_queries.sql

/dashboard
   └── analytics_dashboard.pbix

/images
   └── dashboard_preview.png   (optional screenshot)


Each SQL file is modular and corresponds to one phase of the project.
📊 Datasets Used
✅ Real Dataset (Kaggle — Olist E-commerce)

Contains customer, order, and item-level sales data.

Tables loaded into Snowflake:
- CUSTOMERS
- ORDERS
- ORDER_ITEMS

---

# 🔧 Simulated Datasets (Generated in Snowflake)
To mimic operations, production, and technical diagnostics, the following tables were generated:

# PRODUCTION_STATUS
Machine performance
Units produced / failed
Failure rates

# TEST_RESULTS
Latency
Packet loss
Pass/fail technical testing

This creates a multi-domain environment suitable for analytics projects.

---

# Snowflake Architecture
- Warehouse: DATA_WH
- Database: DATA_PROJECT
- Schema: ANALYTICS
- Tables:

| Table | Description |
|-------|-------------|
CUSTOMERS | Customer demographic + location data |
ORDERS | Order lifecycle events |
ORDER_ITEMS | Line-item details with prices & freight |
PRODUCTION_STATUS | Simulated production batches per machine |
TEST_RESULTS | Simulated quality and performance test results |

---

# SQL Explained
# 1. Table Creation – 01_create_tables.sql
Creates all core and simulated tables.
Includes environmental setup and schema selection.

# 2. Data Simulation – 02_simulation_data.sql
# Production Simulation
Random machine assignment
Variable units produced and failed
Automatic failure rate calculation

# Technical Test Simulation
Random latency
Random packet loss
Pass/fail outcome
500 sample tests

# 3. Analytical Queries – 03_analysis_queries.sql
Includes advanced SQL with real business applications:

✔ Revenue Analytics
Top products by revenue
Revenue vs production output

✔ Logistics KPI
% on-time deliveries

✔ Operational Performance
Failure rate per machine
Units produced vs failed

✔ Quality & Reliability
Latency & packet loss averages
Test pass rate
Degradation detection using LAG

✔ Trend & Diagnostic Analysis
Time-based performance indicators
Window functions
Ordered evaluations

---

# Connect
If you found these helpful or want to suggest a topic, feel free to connect or follow on [LinkedIn](https://www.linkedin.com/in/astridvillalobos).

---

# License
These resources are free to use for learning and personal use. Please credit the author if you reuse the visuals.


