CREATE OR REPLACE DATABASE SNOWPIPE;

-- create integration object that contains the access information
CREATE OR REPLACE STORAGE INTEGRATION azure_snowpipe_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID =  '7540734b-e567-46c3-9ad3-ec9fb9e50140'
  STORAGE_ALLOWED_LOCATIONS = ( 'azure://sfhexastorage.blob.core.windows.net/snowflakecontainer');

  
  
-- Describe integration object to provide access
DESC STORAGE integration azure_snowpipe_integration;


CREATE OR REPLACE file format snowpipe.public.fileformat_azure
TYPE=CSV
FIELD_DELIMITER=','
SKIP_HEADER=1;


create or replace stage snowpipe.public.stage_azure
STORAGE_INTEGRATION= azure_snowpipe_integration
URL='azure://sfhexastorage.blob.core.windows.net/snowflakecontainer'
FILE_FORMAT=fileformat_azure;


lIST @SNOWPIPE.PUBLIC.STAGE_AZURE;


CREATE OR REPLACE NOTIFICATION INTEGRATION snowpipe_event
ENABLED=TRUE
TYPE=QUEUE
NOTIFICATION_PROVIDER = AZURE_STORAGE_QUEUE
AZURE_STORAGE_QUEUE_PRIMARY_URI='https://sfhexastorage.queue.core.windows.net/snowpipequeue1'
AZURE_TENANT_ID='7540734b-e567-46c3-9ad3-ec9fb9e50140';

DESC INTEGRATION azure_snowpipe_integration;


DESC notification integration snowpipe_event;
CREATE OR REPLACE STAGE snowpipe.public.stage_azure_sas
  URL='azure://sfhexastorage.blob.core.windows.net/snowflakecontainer'
  CREDENTIALS=(AZURE_SAS_TOKEN='sp=racwdlmeop&st=2025-10-15T12:11:25Z&se=2025-10-15T20:26:25Z&spr=https&sv=2024-11-04&sr=c&sig=70GA22YG2c%2B%2FL0eIFPR6K0NxYf6UoGlXlKDrSuYM1sU%3D')
  FILE_FORMAT=(TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1);

-- List @stage_azure;
LIST @snowpipe.public.stage_azure_sas;

select $1,$2,$3,$4,$5
from @snowpipe.public.stage_azure_sas;

CREATE OR REPLACE TABLE CUSTOMER (
  id STRING,
  customer STRING,
  region STRING,
  amount NUMBER
  
);

    select * from  CUSTOMER;

    copy into CUSTOMER 
    from @snowpipe.public.stage_azure_sas;

    truncate table happiness;

CREATE OR REPLACE PIPE snowpipe.public.azure_pipe
  AUTO_INGEST = TRUE
  INTEGRATION = 'SNOWPIPE_EVENT'
AS
COPY INTO CUSTOMER
FROM @snowpipe.public.stage_azure_sas
FILE_FORMAT = (TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1);

DESC INTEGRATION snowpipe_event;

select * from CUSTOMER;
show integrations;
    