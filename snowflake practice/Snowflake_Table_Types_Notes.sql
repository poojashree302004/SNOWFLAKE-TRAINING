use my_practice_db;
create or replace table orders(
    order_id int,
    order_date date
);

create or replace temporary table temp_orders(
    order_id int,
    total_amt number(10,2)
);


create or replace transient table staging_orders(
    order_id int,
    order_status string
);

show tables in schema my_practice_db.public;

alter table orders
set data_retention_time_in_days = 30;

CREATE OR REPLACE TABLE sales_data (
    sale_id INT,
    amount NUMBER(10,2)
);

CREATE OR REPLACE TRANSIENT TABLE sales_stage (
    sale_id INT,
    region STRING
);

CREATE OR REPLACE TEMPORARY TABLE sales_temp (
    sale_id INT,
    discount NUMBER(5,2)
);
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

use our_first_db;


CREATE OR REPLACE TABLE PERMANENT_TABLE (
  ID   INT,
  NAME STRING
);

-- Permanent tables can have up to 90 days (Enterprise)
ALTER TABLE PERMANENT_TABLE
  SET DATA_RETENTION_TIME_IN_DAYS = 3;

-- 2) Transient table
CREATE OR REPLACE TRANSIENT TABLE TRANSIENT_TABLE (
  ID   INT,
  NAME STRING
);

-- Max retention for TRANSIENT is 1 day (2 would fail)
ALTER TABLE TRANSIENT_TABLE
  SET DATA_RETENTION_TIME_IN_DAYS = 1;

-- 3) Temporary table (session-scoped)
CREATE OR REPLACE TEMPORARY TABLE TEMPORARY_TABLE (
  ID   INT,
  NAME STRING
);

SHOW TABLES IN SCHEMA OUR_FIRST_DB.PUBLIC;
use my_practice_db;
ALTER TABLE SALES_DATA SET DATA_RETENTION_TIME_IN_DAYS=7;

INSERT INTO SALES_DATA VALUES (2,'8999.00');
select * from sales_data;
DROP TABLE SALES_DATA;

-- RESTORING DROPPED TABLE`
UNDROP TABLE SALES_DATA;
select * from sales;
SELECT * FROM SALES_DATA;
show tables in schema MY_PRACTICE_DB.PUBLIC;
select * from sales_from_azure;

CREATE OR REPLACE TABLE SALES_FROM_AZURE (
    ID INT AUTOINCREMENT,
    CUSTOMER STRING,
    REGION STRING,
    AMOUNT NUMBER
);

CREATE ROLE DATABRICKS_ROLE;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE DATABRICKS_ROLE;
GRANT USAGE ON DATABASE TRAINING_DB TO ROLE DATABRICKS_ROLE;
GRANT USAGE ON SCHEMA PUBLIC TO ROLE DATABRICKS_ROLE;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA PUBLIC TO ROLE DATABRICKS_ROLE;
-- GRANT ROLE DATABRICKS_ROLE TO USER TRAINER_USER;