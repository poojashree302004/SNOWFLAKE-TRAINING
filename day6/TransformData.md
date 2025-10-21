use the Sales2017_raw.csv

- Load the data

- transform data 

![alt text](image.png)

![alt text](image-1.png)

Now first 2 rows got deleted
![alt text](image-2.png)

undo can do from applied Steps

- Reconfigure the Settings using gear icon
Now if you want you can change the number of rows
![alt text](image-3.png)

- Look into 1st row closely .Actually it is header not a data

to change the column Header
![alt text](image-4.png)

![alt text](image-5.png)

close and Apply.

# How to Fix Data Source Errors in Power BI: Troubleshooting Missing File Paths

suppose after loaded the data into power bi if you move source(datasheet) to some other file path. You will be getting an error.

To avoid that error
![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)

![alt text](image-9.png)

Now error will go off

# Power BI Data Transformation: Using Remove Rows and Choose Columns Features

## Remove Blank Rows

![alt text](image-10.png)

Here we have some blank rows  which is not good .so let us remomve it
![alt text](image-11.png)

Here 
![alt text](image-12.png)

 in row 30 looks like blank row but it was not removed.reason behing Order_id column has the value.

 # Filter Rows 
 in product_id column
 ![alt text](image-13.png)

 # Remove Duplicates
 ![alt text](image-14.png)

 select the Column (order_id) Remove Rows -> Remove Duplicates

![alt text](image-15.png)

Here sales column also have duplicates. if apply remove duplicates . It will behave differently according to the filter we applied
![alt text](image-16.png)


![alt text](image-17.png)

# Remove Columns
![alt text](image-18.png)

Remove other columns also helpful in sometimes

## choose Columns

![alt text](image-19.png)
![alt text](image-20.png)

Now column3 Removed

# Power BI Query Editor: Changing Column Data Types for Accurate Analysis

Add a new visual

y value -> Revenue
![alt text](image-21.png)
![alt text](image-22.png)

as it is a text type under summerization we are not getting sum,Average,...
![alt text](image-24.png)
Actually Revenue is not a number. Let us change the datatype for revenue column-> transform data

![alt text](image-23.png)
change type -> Fixed Decimal number ->

Go back to -> desktop -> and check y value shows aggregation fields.
![alt text](image-25.png)


Select the revenue column in desktop model(data pane)

column  tools

check the datatype -> if  you want to change the currency you can change it.

![alt text](image-26.png)

![alt text](image-28.png)

Rename the column order_id (unique) -> order_id

order_date, order_date2

![alt text](image-29.png)
it shows date  in different format
Now let us change the datatype for both the column as date

![alt text](image-30.png)


after changing the datatype for both the column now format looks like same.
Before changing the datatype it shows in different format


![alt text](image-27.png)

now you drag order_date to your visuals(column(or) bar chart).Now it shows the year-> Drill down -> Quarter-> drill down -> Month,..

We need to change the delivery_date,delivery_date2 to date
![alt text](image-31.png)


if you get some error (Change type -> use Locale) ->Select Appropriate Date format

![alt text](image-32.png)


To check all column datatype are proper -> Query editor ->Transform ->Detect Datatype

Price -> ABC -> Actually it would number or decimal number

![alt text](image-33.png)

As it contain NA it considered as ABC(text) -> Filter the Rows without NA (uncheck the NA) ->  Detect Datatype -> Now it considered as Decimal number

# Replace Values
![alt text](image-34.png)

![alt text](image-35.png)

![alt text](image-36.png)


sales column 
![alt text](image-37.png)
data contains sales .so we can't perfomr the aggreagation later. So let us try to change the datatype as Decimal Number ->We will get an Error

![alt text](image-38.png)


Then remove the previous applied steps to getrid of the error

Select the Column ->Replace values ->

![alt text](image-39.png)

![alt text](image-40.png)

Now you can change the datatype to decimal number

