# Snowflake Analytics Simulation Project

**Author:** Astrid Villalobos  
**Role:** Data Analyst – Portfolio Project  
**Tools:** Snowflake · SQL · Power BI · Kaggle · Data Modeling  

---

## 📌 Project Overview

This project simulates an **end-to-end analytics workflow** using Snowflake and real-world e-commerce data from Kaggle.

To extend the analytical depth, the project generates **simulated production and technical testing datasets**, creating a **multi-domain analytics environment** similar to what technology, telecom, logistics, or manufacturing companies manage daily.

The project demonstrates:

- Database and schema design in Snowflake
- Table creation (real + simulated datasets)
- Analytical SQL (joins, window functions, KPIs)
- Production and quality monitoring
- Power BI dashboard development
- Reproducible, industry-style project structure

---

## 📂 Repository Structure

/sql
├── 01_create_tables.sql
├── 02_simulation_data.sql
└── 03_analysis_queries.sql

/dashboard
└── analytics_dashboard.pbix (in progress)

/images
└── dashboard_preview.png (in progress)


Each SQL file is modular and represents a distinct phase of the analytics workflow.

---

## 📊 Datasets Used

### ✅ Real Dataset (Kaggle — Olist E-commerce)

Customer, order, and item-level sales data.

Tables loaded into Snowflake:

- `CUSTOMERS`
- `ORDERS`
- `ORDER_ITEMS_DATASET`

---

## 🔧 Simulated Datasets (Generated in Snowflake)

To replicate operational and technical monitoring scenarios, two synthetic tables were generated:

### `PRODUCTION_STATUS`
- Machine-level production tracking
- Units produced vs. units failed
- Failure rate calculation

### `TEST_RESULTS`
- Latency measurements
- Packet loss metrics
- Pass / fail classification

These datasets enable analytics across **commerce, operations, production, and quality monitoring**.

---

## 🏗 Snowflake Architecture

- **Warehouse:** `DATA_WH`
- **Database:** `DATA_PROJECT`
- **Schema:** `ANALYTICS`

### Tables Overview

| Table Name | Description |
|-----------|-------------|
| `CUSTOMERS` | Customer demographic and location data |
| `ORDERS` | Order lifecycle events |
| `ORDER_ITEMS_DATASET` | Line-item pricing and product-level details |
| `PRODUCTION_STATUS` | Simulated production batches per machine |
| `TEST_RESULTS` | Simulated quality and performance test results |

---

## 🧠 SQL Files Explained

### 1️⃣ `01_create_tables.sql` — Table Creation
Includes:
- Environment setup
- Core table definitions
- Simulation table definitions

---

### 2️⃣ `02_simulation_data.sql` — Data Simulation

**Production Simulation**
- Random machine assignment
- Random units produced and failed
- Automatic failure rate calculation

**Technical Test Simulation**
- Random latency values
- Random packet loss
- Random pass/fail assignment
- 500 generated test samples

---

### 3️⃣ `03_analysis_queries.sql` — Analytical Queries

Includes business-oriented analytics:

#### ✔ Revenue Analytics
- Top products by revenue
- Revenue vs. production output

#### ✔ Logistics KPIs
- On-time delivery percentage

#### ✔ Operational Performance
- Failure rate by machine
- Units produced vs. units failed

#### ✔ Quality & Reliability
- Latency and packet loss metrics
- Test pass rate
- Performance degradation detection using `LAG`

#### ✔ Trend & Diagnostic Analysis
- Window functions
- Time-based performance indicators

---

## 🔗 Snowflake Worksheet (Read-Only)

You can view the **full executed SQL script** directly in Snowflake here:

👉 https://app.snowflake.com/iiohfin/fb68639/w3x1O5jui222#query

---

## 🤝 Connect

If you found this project useful or would like to collaborate:

👉 LinkedIn: https://www.linkedin.com/in/astridcvr/

---

## 📄 License

These resources are free to use for **learning and personal development**.  
Please credit the author if you reuse any part of this project.
