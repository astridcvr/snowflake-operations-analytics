# Snowflake Analytics Simulation Project

**Author:** Astrid Villalobos  
**Role:** Data Analyst / Data Engineering Portfolio Project  
**Tools:** Snowflake · SQL · Power BI · Kaggle · Data Modeling  

---

## Project Overview

This project simulates an **end-to-end analytics workflow** using Snowflake and real-world e-commerce data from Kaggle.  
To extend the analytical depth, the project generates **simulated production and technical testing datasets**, creating a multi-domain environment similar to what tech, telecom, logistics, or manufacturing companies manage daily.

This project demonstrates:

- Database & schema design  
- Table creation (real + simulated data)  
- Analytical SQL (joins, window functions, KPIs)  
- Production & quality monitoring  
- Power BI dashboard development  
- Reproducible, industry-style project structure  

---

## Repository Structure

/sql
├── 01_create_tables.sql
├── 02_simulation_data.sql
└── 03_analysis_queries.sql

/dashboard
└── analytics_dashboard.pbix (in progress)

/images
└── dashboard_preview.png (in progress)


Each SQL file is modular and corresponds to a different phase of the project.

---

## Datasets Used

### Real Dataset (Kaggle — Olist E-commerce)

Contains customer, order, and item-level sales data.

Tables loaded into Snowflake:

- `CUSTOMERS`
- `ORDERS`
- `ORDER_ITEMS`

---

## Simulated Datasets (Generated in Snowflake)

Two synthetic tables were created to mimic operational and technical testing environments:

### **`PRODUCTION_STATUS`**
- Machine performance  
- Units produced / failed  
- Failure rate calculation  

### **`TEST_RESULTS`**
- Latency measurements  
- Packet loss  
- Pass/fail classification  

These datasets enable analysis across commerce, operations, production, and quality monitoring.

---

## Snowflake Architecture

- **Warehouse:** `DATA_WH`  
- **Database:** `DATA_PROJECT`  
- **Schema:** `ANALYTICS`  

### **Tables Overview**

| Table | Description |
|-------|-------------|
| `CUSTOMERS` | Customer demographic & location data |
| `ORDERS` | Order lifecycle events |
| `ORDER_ITEMS` | Line-item pricing and product-level details |
| `PRODUCTION_STATUS` | Simulated production batches per machine |
| `TEST_RESULTS` | Simulated quality & performance test results |

---

## SQL Files Explained

### ** 1. `01_create_tables.sql` — Table Creation**
Includes:
- Environment setup  
- Core table definitions  
- Simulation table definitions  

---

### **2. `02_simulation_data.sql` — Data Simulation**

#### **Production Simulation**
- Random machine assignment  
- Random units produced & failed  
- Failure rate calculation  

#### **Technical Test Simulation**
- Random latency  
- Random packet loss  
- Random pass/fail assignment  
- 500 generated test samples  

---

### **3. `03_analysis_queries.sql` — Analytical Queries**

Includes business-oriented analytics:

#### ✔ Revenue Analytics  
- Top products by revenue  
- Revenue vs production output  

#### ✔ Logistics KPIs  
- On-time delivery percentage  

#### ✔ Operational Performance  
- Failure rate by machine  
- Units produced vs failed  

#### ✔ Quality & Reliability  
- Latency & packet loss metrics  
- Test pass rate  
- Performance degradation detection `LAG`  

#### ✔ Trend & Diagnostic Analysis  
- Window functions  
- Time-based performance indicators  

---

## Connect

If you found this project useful or would like to collaborate:

👉 **LinkedIn:** https://www.linkedin.com/in/astridvillalobos  

---

## License

These resources are free to use for learning and personal development.  
Please credit the author if you reuse any part of the project.

