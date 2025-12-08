------------------------------------------------------
-- FILE: 01_create_tables.sql
-- PROJECT: Snowflake Analytics Simulation
-- AUTHOR: Astrid Villalobos
-- DESCRIPTION:
--   Creates base tables and simulated tables used
--   for analytics in DATA_PROJECT.ANALYTICS.
------------------------------------------------------

------------------------------------------------------
-- 0. Environment Setup
------------------------------------------------------
USE DATABASE DATA_PROJECT;
USE SCHEMA ANALYTICS;

------------------------------------------------------
-- 1. Base Tables (already created via file upload)
--    Included here for reference
------------------------------------------------------
-- CUSTOMERS
-- ORDERS
-- ORDER_ITEMS

-- These tables were created using Snowflake's
-- "Upload Local Files" feature.

------------------------------------------------------
-- 2. Simulated Production Table
------------------------------------------------------
CREATE OR REPLACE TABLE PRODUCTION_STATUS (
    production_id INT AUTOINCREMENT,
    product_id STRING,
    machine_id STRING,
    production_date DATE,
    units_produced INT,
    units_failed INT,
    failure_rate FLOAT
);

------------------------------------------------------
-- 3. Simulated Technical Test Results Table
------------------------------------------------------
CREATE OR REPLACE TABLE TEST_RESULTS (
    test_id INT AUTOINCREMENT,
    product_id STRING,
    test_date DATE,
    latency_ms FLOAT,
    packet_loss FLOAT,
    test_passed BOOLEAN
);
