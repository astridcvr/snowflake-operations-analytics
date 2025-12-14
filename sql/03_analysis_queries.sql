------------------------------------------------------
-- FILE: 03_analysis_queries.sql
-- PROJECT: Snowflake Analytics Simulation
-- AUTHOR: Astrid Villalobos
-- DESCRIPTION:
--   Advanced analytical SQL queries answering
--   business, operational, and quality questions.
------------------------------------------------------

------------------------------------------------------
-- Environment Setup
------------------------------------------------------
USE DATABASE DATA_PROJECT;
USE SCHEMA ANALYTICS;

------------------------------------------------------
-- 1. Top 10 Products by Revenue
--    Business Question:
--    Which products generate the highest revenue?
------------------------------------------------------
SELECT 
    product_id,
    SUM(price) AS total_revenue
FROM ORDER_ITEMS_DATASET
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

------------------------------------------------------
-- 2. On-Time Delivery KPI
--    Business Question:
--    What percentage of orders are delivered on time?
------------------------------------------------------
SELECT 
    COUNT(
        CASE 
            WHEN order_delivered_customer_date <= order_estimated_delivery_date 
            THEN 1 
        END
    ) / COUNT(*)::FLOAT AS pct_on_time
FROM ORDERS
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

------------------------------------------------------
-- 3. Failure Rate by Machine
--    Operational Question:
--    Which machines have the highest failure rates?
------------------------------------------------------
SELECT 
    machine_id,
    AVG(failure_rate) AS avg_failure_rate,
    SUM(units_failed) AS total_failed,
    SUM(units_produced) AS total_produced
FROM PRODUCTION_STATUS
GROUP BY machine_id
ORDER BY avg_failure_rate DESC;

------------------------------------------------------
-- 4. Quality Metrics per Product
--    Quality Question:
--    Which products show poorer test performance?
------------------------------------------------------
SELECT
    product_id,
    AVG(latency_ms)      AS avg_latency_ms,
    AVG(packet_loss)     AS avg_packet_loss,
    AVG(CASE WHEN test_passed THEN 1 ELSE 0 END) AS pass_rate
FROM TEST_RESULTS
GROUP BY product_id
ORDER BY pass_rate ASC, avg_latency_ms DESC
LIMIT 20;

------------------------------------------------------
-- 5. Latency Trend Analysis (Degradation Detection)
--    Diagnostic Question:
--    Is product latency degrading over time?
------------------------------------------------------
SELECT
    product_id,
    test_date,
    latency_ms,
    LAG(latency_ms) OVER (
        PARTITION BY product_id 
        ORDER BY test_date
    ) AS prev_latency_ms,
    latency_ms - LAG(latency_ms) OVER (
        PARTITION BY product_id 
        ORDER BY test_date
    ) AS delta_latency
FROM TEST_RESULTS
ORDER BY product_id, test_date;

------------------------------------------------------
-- 6. Revenue vs Production Output
--    Strategic Question:
--    Does higher production correlate with higher revenue?
------------------------------------------------------
SELECT
    p.product_id,
    SUM(oi.price)         AS total_revenue,
    SUM(p.units_produced) AS total_units_produced,
    SUM(p.units_failed)   AS total_units_failed
FROM PRODUCTION_STATUS p
LEFT JOIN ORDER_ITEMS_DATASET oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC;
