--  Example 1 — COPY INTO

use database practice;
-- Create a stage for Azure Blob Storage
CREATE OR REPLACE STAGE azure_stage
  url='azure://sfhexastorage.blob.core.windows.net/snowflakecontainer'
  credentials=(AZURE_SAS_TOKEN='?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-10-15T12:10:54Z&st=2025-10-15T03:55:54Z&spr=https&sig=u2CNoYoeGBsVjURk42hsxVbrsOpfdczIAv%2BrHz2xB8Y%3D');

-- Create a table
CREATE OR REPLACE TABLE CUSTOMER (
  id STRING,
  customer STRING,
  region STRING,
  amount NUMBER
  
);
LIST @azure_stage;

-- Load data
COPY INTO CUSTOMER
FROM @azure_stage/Customer.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

-- Example 2 — Snowpipe (Continuous Ingestion)
CREATE OR REPLACE PIPE azure_sales_pipe
AS
COPY INTO CUSTOMER
FROM @azure_stage
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);



SELECT * FROM CUSTOMER
order by total_sales desc;

SHOW TABLES;
SELECT region, SUM(total_sales)
FROM Customer
GROUP BY region;



