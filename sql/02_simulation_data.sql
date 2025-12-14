------------------------------------------------------
-- FILE: 02_simulation_data.sql
-- PROJECT: Snowflake Analytics Simulation
-- AUTHOR: Astrid Villalobos
-- DESCRIPTION:
--   Inserts simulated production and technical test
--   results data based on real product-level sales data.
--
-- SOURCE TABLE:
--   ORDER_ITEMS_DATASET
--   (Loaded from olist_order_items_dataset.csv - Kaggle)
------------------------------------------------------

------------------------------------------------------
-- 0. Environment Setup
------------------------------------------------------
USE DATABASE DATA_PROJECT;
USE SCHEMA ANALYTICS;

------------------------------------------------------
-- 1. Clean previous simulated data (idempotent runs)
------------------------------------------------------
TRUNCATE TABLE PRODUCTION_STATUS;
TRUNCATE TABLE TEST_RESULTS;

------------------------------------------------------
-- 2. Insert Simulated Production Data
--    Generates production batches with:
--    - Random machine assignment
--    - Random production dates (last 90 days)
--    - Variable units produced and failed
------------------------------------------------------
INSERT INTO PRODUCTION_STATUS (
    product_id,
    machine_id,
    production_date,
    units_produced,
    units_failed,
    failure_rate
)
SELECT
    product_id,
    'MACHINE_' || UNIFORM(1, 5, RANDOM()),               -- Machines MACHINE_1 to MACHINE_5
    DATEADD('day', -UNIFORM(1, 90, RANDOM()), CURRENT_DATE()),
    UNIFORM(50, 200, RANDOM()),                          -- Units produced
    UNIFORM(0, 10, RANDOM()),                            -- Units failed
    NULL
FROM ORDER_ITEMS_DATASET
LIMIT 500;

------------------------------------------------------
-- 3. Compute Failure Rate
--    Calculated as failed units over produced units
------------------------------------------------------
UPDATE PRODUCTION_STATUS
SET failure_rate = units_failed / NULLIF(units_produced, 0)
WHERE failure_rate IS NULL;

------------------------------------------------------
-- 4. Insert Simulated Technical Test Results
--    Generates quality and performance metrics:
--    - Random test dates (last 60 days)
--    - Latency measurements (1–100 ms)
--    - Packet loss (0%–5%)
--    - Pass/fail outcome (85% pass rate)
------------------------------------------------------
INSERT INTO TEST_RESULTS (
    product_id,
    test_date,
    latency_ms,
    packet_loss,
    test_passed
)
SELECT
    product_id,
    DATEADD('day', -UNIFORM(1, 60, RANDOM()), CURRENT_DATE()),
    UNIFORM(1, 100, RANDOM()),                           -- Latency (ms)
    UNIFORM(0, 5, RANDOM()) / 100,                       -- Packet loss (%)
    CASE
        WHEN UNIFORM(0, 100, RANDOM()) > 15 THEN TRUE
        ELSE FALSE
    END
FROM ORDER_ITEMS_DATASET
LIMIT 500;
