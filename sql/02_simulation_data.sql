------------------------------------------------------
-- FILE: 02_simulation_data.sql
-- PROJECT: Snowflake Analytics Simulation
-- AUTHOR: Astrid Villalobos
-- DESCRIPTION:
--   Inserts simulated production and test results data.
------------------------------------------------------

USE DATABASE DATA_PROJECT;
USE SCHEMA ANALYTICS;

------------------------------------------------------
-- 1. Insert Simulated Production Data
------------------------------------------------------
INSERT INTO PRODUCTION_STATUS (product_id, machine_id, production_date, units_produced, units_failed, failure_rate)
SELECT
    product_id,
    'MACHINE_' || UNIFORM(1, 5, RANDOM()),               
    DATEADD('day', -UNIFORM(1, 90, RANDOM()), CURRENT_DATE()),
    UNIFORM(50, 200, RANDOM()),                          
    UNIFORM(0, 10, RANDOM()),                            
    NULL
FROM ORDER_ITEMS
LIMIT 500;

UPDATE PRODUCTION_STATUS
SET failure_rate = units_failed / NULLIF(units_produced, 0);

------------------------------------------------------
-- 2. Insert Simulated Technical Test Results
------------------------------------------------------
INSERT INTO TEST_RESULTS (product_id, test_date, latency_ms, packet_loss, test_passed)
SELECT
    product_id,
    DATEADD('day', -UNIFORM(1,60,RANDOM()), CURRENT_DATE()),
    UNIFORM(1,100,RANDOM()),                     
    UNIFORM(0,5,RANDOM()) / 100,                
    CASE WHEN UNIFORM(0,100,RANDOM()) > 15 THEN TRUE ELSE FALSE END
FROM ORDER_ITEMS
LIMIT 500;
