SHOW WAREHOUSES;

CREATE  WAREHOUSE sales_wh

CREATE  or replace WAREHOUSE sales_wh
WITH
WAREHOUSE_SIZE='SMALL'
AUTO_SUSPEND=180
AUTO_RESUME=TRUE
INITIALLY_SUSPENDED=TRUE;

ALTER WAREHOUSE sales_wh
SET WAREHOUSE_SIZE='XSMALL'
AUTO_SUSPEND=120

ALTER WAREHOUSE sales_wh   RESUME;

ALTER WAREHOUSE sales_wh SUSPEND;

USE warehouse sales_wh;

SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_LOAD_HISTORY;

show warehouses like 'sales_wh';

create WAREHOUSE etl_wh
 MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 4
    SCALING_POLICY = 'ECONOMY';
use database practice;
 drop warehouse sales_wh;
create or replace table orders_data
    (
        ORDER_ID string,
        AMOUNT number(10,2),
        PROFIT number(10,2),
        QUANTITY number,
        CATEGORY string,
        SUBCATEGORY string
        
        -- supported types: https://docs.snowflake.com/en/sql-reference/intro-summary-data-types
    )

    select * from orders_data;

    create or replace stage public.localstage

    list @localstage;


CREATE OR REPLACE FILE FORMAT ff_csv
  TYPE = CSV
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  NULL_IF = ('', 'NULL');
    
COPY INTO orders_data
FROM @localstage
FILE_FORMAT = (FORMAT_NAME = ff_csv)
ON_ERROR = 'CONTINUE'            
PURGE = TRUE; 

select * from orders_data;



USE DATABASE PRACTICE;
USE SCHEMA EXTERNAL_STAGE;

CREATE OR REPLACE STAGE AWS_STAGE
  URL='s3://bucketsnowflakes4';
  STORAGE_INTEGRATION = my_s3_integration;  -- use your integration name

SHOW STAGES IN SCHEMA PRACTICE.EXTERNAL_STAGE;

 
CREATE SCHEMA IF NOT EXISTS PRACTICE.EXTERNAL_STAGE;

 // List files in stage
LIST @PRACTICE.EXTERNAL_STAGE.AWS_STAGE;


    // Create example table
create or replace table orders_data
    (
        ORDER_ID string,
        AMOUNT number(10,2),
        PROFIT number(10,2),
        QUANTITY number,
        CATEGORY string,
        SUBCATEGORY string);

// Demonstrating error message
COPY INTO practice.public.orders_data
FROM @practice.public.external_stages
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER=',' SKIP_HEADER=1)
FILES = ('OrderDetails_error.csv')
ON_ERROR = 'CONTINUE'; // remove this error will show



COPY INTO practice.public.orders_data
    FROM @practice.public.external_stages
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'ABORT_STATEMENT';


  // Validating results and truncating table 
SELECT * FROM practice.PUBLIC.ORDERS_data;

TRUNCATE TABLE practice.PUBLIC.ORDERS_data;

COPY INTO practice.PUBLIC.ORDERS_data
    FROM @practice.public.external_stages
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE';
    
    
  // Validating results 
SELECT * FROM practice.PUBLIC.ORDERS_data;
SELECT COUNT(*) FROM practice.PUBLIC.ORDERS_data;
 
COPY INTO practice.PUBLIC.ORDERS_data
    FROM @practice.public.external_stages
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = SKIP_FILE_3 
    SIZE_LIMIT = 30;

    CREATE OR REPLACE STAGE practice.public.external_stages
    URL='s3://snowflakebucket-copyoption/size/';

    COPY INTO practice.PUBLIC.ORDERS_data
    FROM @practice.public.external_stages
    FILE_FORMAT=(TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1)
    PATTERN='.*Order.*'
    VALIDATION_MODE=RETURN_ERRORS;

    COPY INTO practice.PUBLIC.ORDERS_data
    FROM @practice.public.external_stages
    FILE_FORMAT=(TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1)
    PATTERN='.*Order.*'
    VALIDATION_MODE=RETURN_5_ROWS;

    COPY INTO practice.PUBLIC.ORDERS_data
    FROM @practice.public.external_stages
    FILE_FORMAT=(TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1)
    PATTERN='.*error.*'
    VALIDATION_MODE=RETURN_1_ROWS;