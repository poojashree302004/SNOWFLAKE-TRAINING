CREATE OR REPLACE TABLE my_table (
    id INT,
    customer STRING,
    amount FLOAT,
    date DATE
);

CREATE OR REPLACE FILE FORMAT my_csv_format
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
DATE_FORMAT = 'YYYY/MM/DD';  -- matches your CSV


CREATE OR REPLACE STAGE my_stage
URL='azure://sfhexastorage.blob.core.windows.net/snowflakecontainer'
CREDENTIALS=(AZURE_SAS_TOKEN='?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-10-17T03:26:17Z&st=2025-10-16T19:11:17Z&spr=https&sig=cP4QFvBSgBabanQNpaAMJBebDfC%2BmThPrMSYXQI%2BslM%3D')
FILE_FORMAT = my_csv_format;

CREATE OR REPLACE PIPE my_pipe AS
COPY INTO my_table
FROM @my_stage
FILE_FORMAT = my_csv_format
ON_ERROR='CONTINUE';

LIST @my_stage;

ALTER PIPE my_pipe REFRESH;


SELECT * FROM my_table;
SELECT $1, $2, $3, $4
FROM @my_stage (FILE_FORMAT => 'my_csv_format')
LIMIT 5;

SELECT *
FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(
    table_name => 'MY_TABLE',
    start_time => DATEADD('hour', -24, CURRENT_TIMESTAMP)
));


