-- =======================================
-- 1️⃣ DROP existing objects (for fresh start)
-- =======================================
DROP SHARE IF EXISTS ORDERS_SHARE;

DROP DATABASE IF EXISTS DATA_S;

-- =======================================
-- 2️⃣ CREATE database and schema
-- =======================================
CREATE OR REPLACE DATABASE DATA_S;
USE DATABASE DATA_S;
USE SCHEMA PUBLIC;

-- =======================================
-- 3️⃣ CREATE stage (S3 bucket)
-- =======================================
-- Replace with your bucket and credentials if needed
CREATE OR REPLACE STAGE aws_stage
URL = 's3://bucketsnowflakes3'
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1);

-- Verify stage files
LIST @aws_stage;

-- =======================================
-- 4️⃣ CREATE ORDERS table
-- =======================================
CREATE OR REPLACE TABLE ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT NUMBER(38,0),
    PROFIT NUMBER(38,0),
    QUANTITY NUMBER(38,0),
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30)
);

-- =======================================
-- 5️⃣ COPY data from stage into table
-- =======================================
COPY INTO ORDERS
FROM @aws_stage
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
PATTERN = '.*OrderDetails.*'
FORCE = TRUE
ON_ERROR = 'CONTINUE';

-- Verify data loaded
SELECT COUNT(*) AS ROWS_LOADED FROM ORDERS;
SELECT * FROM ORDERS LIMIT 10;

-- =======================================
-- 6️⃣ CREATE secure share
-- =======================================
CREATE OR REPLACE SHARE ORDERS_SHARE;

GRANT USAGE ON DATABASE DATA_S TO SHARE ORDERS_SHARE;
GRANT USAGE ON SCHEMA DATA_S.PUBLIC TO SHARE ORDERS_SHARE;
GRANT SELECT ON TABLE DATA_S.PUBLIC.ORDERS TO SHARE ORDERS_SHARE;

-- Add the consumer account (replace with actual account locator)
ALTER SHARE ORDERS_SHARE ADD ACCOUNT = TPRTVOG.TG33465;

-- Verify grants
SHOW GRANTS TO SHARE ORDERS_SHARE;

-- =======================================
-- 7️⃣ Consumer side commands (run on consumer account)
-- =======================================
-- 1. Create database from share
-- CREATE DATABASE DATA_S_SHARED FROM SHARE TPRTVOG.TG33465.ORDERS_SHARE;

-- 2. Query shared table
-- SELECT * FROM DATA_S_SHARED.PUBLIC.ORDERS;

SHOW SHARES;

