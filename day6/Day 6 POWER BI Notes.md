# Combining Data and Data Modeling in Power BI

Open the previous we did work

![alt text](image.png)

- Now let us add some more datasource too
-  in query Editor ->New source -> text/csv -> sales 2018
-  make it FirstRow as Headers
-  same way load ->sales 2019 as well
-  make it FirstRow as Headers
- Let us Append the data in one sheet
- While append make sure both the queries should have same columnnames and same number of column

![alt text](image-1.png)
![alt text](image-2.png)
![alt text](image-3.png)
- Select First column second last column -> Detect Datatype
- check the datatype ->price it shows ->Text -> as we have some NA. show filter rows
- Append1 ->Rename it as ->Sales
- select Sales  ->Home Ribbon ->Append Queries

![alt text](image-4.png)

Now all data available sales query. We do not need sales 2017,sales2018,sales2019
# How to Group and Manage Queries in Power BI: Organizing Your Data Sources (33)

- Right click on query -> New Group ->
- ![alt text](image-5.png)
- name it as Helper Tables -> Move sales 2017,2018,2019 to Helpertables Folder -> Other queries will be other queries folder 
- This is how we are grouping the queries
- ![alt text](image-6.png)
- Here we have state abbr, state column in stores query
- assume we need merge both column values
- select both the columns -> Right click -> Merge -> Custom -> - 
- ![alt text](image-7.png)
- ![alt text](image-8.png)
- ![alt text](image-9.png)
  
# How to Hide Tables in Power BI: Improving User Experience in Report View(34)
- sometimes we need to hide tables and enhance the user experience
- or we don't want show the tables to the End users
- As we moved sales 2017,2018,2019 to the Helper Tables -> Collapse that folder in query editor
- ![alt text](image-10.png)
- close & apply
- Go back to desktop view -> in Data pane -> It shows all tables
- ![alt text](image-11.png)
- it makes the enduser get confuse what should we do with these tables
- to avoid the confusion Right click on the table in Data pane -> hide
- ![alt text](image-12.png)
- same way hide all unnecessary tables

- if we needs brings them back(hidden tables) -> how to do so
- right click on Data Pane ->Unhide all
- ![alt text](image-13.png)
- suppose you do not want to unhide all ->specific tables if you want unhide
- View Hidden
- ![alt text](image-14.png)
- uncheck the Hide
- ![alt text](image-15.png)

# How to Use Date Hierarchy in Power BI Line Charts for Time-Based Visualizations(35)

- place line chart
- x axis -> delivary_date
- y axis -> Revenue

![alt text](image-16.png)

![alt text](image-20.png)
- the datatype of the delivary_date is text -> so it order in alphabatic ascending order
- let us change the datatype of the delivary_date 
- same other date columns (order date,)
- ![alt text](image-17.png)
- ![alt text](image-18.png)
- yes
- after changing the datatype 
- ![alt text](image-19.png)
- ![alt text](image-21.png)
- we have another feature is Date Hierarchy
- Just drag and drop year from data pane -> canvas
- ![alt text](image-22.png)
- drag and drop the revenue
- ![alt text](image-23.png) ![alt text](image-24.png)
- based on year we can analyse the date without extract year from delivary_date or order_date
- ![alt text](image-25.png) 
- drill down
- ![alt text](image-26.png)
- ![alt text](image-27.png)
- ![alt text](image-28.png)
- ![alt text](image-29.png)

# How to Use Drill Down Mode in Power BI: Beyond Date Hierarchies (36)
![alt text](image-30.png)
- x - axis -> productname (category)
- and add sub category
- whenever you add both the field in x-axis
- you are getting the drilldown icon (enable)
- ![alt text](image-31.png)
- ![alt text](image-32.png)
- like this we can get drill down other date fields as well
- Now in y-axis -> drag the sum of revenue
- ![alt text](image-33.png)
- this because data model 
- ![alt text](image-34.png)
- ![alt text](image-35.png)
- ![alt text](image-36.png)
- ![alt text](image-37.png)
- ![alt text](image-38.png)
- ![alt text](image-39.png)

# How to Create and Customize Line Charts in Power BI: A Step-by-Step Guide

- in Line chart -> we can add some more field in y-axis
- secondary y-axis
- customize the Date Hierarchy -> remove quarter or month -> if don't want
- ![alt text](image-40.png)
- when i add sales in y-axis along with revenue.My chart looks like the above
- as sales values are low we can't differentiate it
- now i moved sales to secondary y-axis and see the difference
- ![alt text](image-41.png)
- now we have other filed in build visual pane ->Legend
- if we have some additional field y axis or secondary y axis -> we can't keep any field in Legend
- ![alt text](image-42.png)
- Farmat
- series label on

# How to Combine Multiple Files from a Folder in Power BI
- let us see how to load the data from Multiple files (or) from Folder
- in query editor (or) desktop
![alt text](image-43.png)
- ![alt text](image-44.png)
- ![alt text](image-46.png)
- Transform Data
- ![alt text](image-45.png)
- ![alt text](image-47.png)
- ![alt text](image-48.png)
- ![alt text](image-49.png)
- Now i don't wan these file  -> Delete ->Delete group
- ![alt text](image-50.png)

- otherway around
- ![alt text](image-51.png)
- combine & Transform Data
- Ok
- Source_Name ->will show data comes from which file ->Remove (if you don't want)
- Detect datatype
  
# How to Create a Fact-Dimension Model in Power BI: Star Schema Explained
# 📘 How to Manage Active and Inactive Relationships in Power BI Data Models

In Power BI, managing **active and inactive relationships** is crucial for ensuring accurate data modeling and correct results in your reports, especially when dealing with **multiple relationships between tables** (e.g., one fact table and multiple date columns).

---

## 🔹 What Are Active and Inactive Relationships?

- **Active Relationship** (solid line): Only **one relationship** between two tables can be active at a time. It's the default used by DAX when performing calculations.
- **Inactive Relationship** (dashed line): Additional relationships that are **not used automatically** in calculations. You must explicitly activate them using DAX.

---

## 🔹 Why Use Inactive Relationships?

You may need **multiple relationships** between tables (e.g., Order Date vs. Ship Date). Only one can be active. The other becomes inactive and needs special handling using DAX.

---

## 🔹 How to View and Manage Relationships

1. **Go to Model View** in Power BI Desktop.
2. **Inspect relationships** between tables:
   - Solid line = Active
   - Dashed line = Inactive
![alt text](image-54.png)
![alt text](image-52.png)

after you uncheck the make relationship active
![alt text](image-53.png)
save button enabled.
![alt text](image-55.png)
Now inactive Relationship created using Dotted line

If you feel you wnat to delete the inactive relationship ->Right click dotted line -> delete
![alt text](image-56.png)

3. To **change active relationship**:
   - Delete the current active relationship (if needed).
   - Activate the other using the **"Manage Relationships"** dialog.

---

## 🔹 How to Use Inactive Relationships in DAX

Use the `USERELATIONSHIP()` function to activate an inactive relationship **only for a specific calculation**.

### ✅ Example Scenario:
You have a Sales table with both `OrderDate` and `ShipDate`. You want to analyze revenue by both.

### 📊 Default Calculation (uses active `OrderDate` relationship):
```dax
TotalSales := SUM(Sales[Revenue])
```

### 🟡 Custom Measure using Inactive Relationship (`ShipDate`):
```dax
TotalSalesByShipDate :=
CALCULATE(
    SUM(Sales[Revenue]),
    USERELATIONSHIP(Sales[ShipDate], Calendar[Date])
)
```

---

## 🔹 Tips for Best Practices

| Practice                           | Recommendation                                                                 |
|------------------------------------|--------------------------------------------------------------------------------|
| **Only one active relationship**   | Ensure only one per pair of tables to avoid ambiguity.                         |
| **Name measures clearly**          | e.g., `TotalSalesByShipDate`, `TotalSalesByOrderDate`.                         |
| **Avoid circular relationships**   | Restructure model if needed to prevent loops.                                  |
| **Use calendar/date dimension**    | One shared date table improves flexibility and consistency across time metrics.|

---

## 🔹 Visual Indicator in Model View

- **Solid line**: Used automatically in visuals and DAX.
- **Dashed line**: Must be manually invoked in DAX using `USERELATIONSHIP()`.


# 🔗 How to Manage Relationships in Power BI: Autodetect & Data Model Best Practices

Power BI allows you to create and manage relationships between tables to build a coherent data model. Proper relationship management is essential to ensure accurate aggregations, filtering, and cross-table analysis.

---

## 🔹 1. AutoDetect Relationships in Power BI

Power BI attempts to **automatically detect relationships** between tables when you load data.

### ✅ Steps:
1. Go to **Model view**.
2. If Power BI hasn’t created relationships automatically:
   - Click on **"Manage Relationships"** → **Autodetect**.
3. Power BI will scan tables and detect relationships based on:
   - Matching column names
   - Compatible data types
   - Unique vs. non-unique column values

> ⚠️ Auto-detected relationships are not always correct. Always review and edit them manually.

---
AS in the beginning we set option never autodetuct 
![alt text](image-57.png)

It is not find autodetect relationship
but we have an option to do manually
## 🔹 2. Manually Create Relationships

### ✅ Steps:
1. Go to **Model view**.
2. Drag a field from one table and drop it on a related field in another table.
3. Or go to **Manage Relationships** → **New**.
![alt text](image-58.png)
NewRelationship
![alt text](image-59.png)
Here you can check and uncheck according to our need
![alt text](image-60.png)
We can even delete Relationship as well
4. Configure:
   - **Table1[Column1] → Table2[Column2]**
   - Cardinality: One-to-many, many-to-one, one-to-one
   - Cross filter direction: Single or Both
   - Active or Inactive

---

## 🔹 3. Relationship Cardinality Types

| Cardinality       | Description                                             |
|-------------------|---------------------------------------------------------|
| **One-to-Many**   | A common relationship between a dimension and a fact.   |
| **Many-to-One**   | Inverse of one-to-many (Power BI still supports this).  |
| **One-to-One**    | Both tables contain unique values.                      |
| **Many-to-Many**  | Requires special handling, usually with composite models.|

> ❗ Avoid many-to-many unless absolutely necessary. Use dimension tables with distinct keys.

---

## 🔹 4. Cross Filter Direction

| Direction     | Use Case Example                                            |
|---------------|-------------------------------------------------------------|
| **Single**    | Recommended for star schemas – filters only one direction.  |
| **Both**      | For complex models like snowflake schemas or bi-directional filters.|

> Use **"Both"** direction with caution – it may lead to ambiguous relationships or performance issues.

---

## 🔹 5. Best Practices for Managing Relationships

| Best Practice                         | Description |
|--------------------------------------|-------------|
| ✅ Use a **date/calendar dimension**  | Always connect your fact tables to a centralized date table. |
| ✅ Normalize your data                | Break down into dimension and fact tables. |
| ✅ Avoid bidirectional filters unless required | Helps maintain performance and clarity. |
| ✅ Use surrogate keys where needed    | Especially if natural keys aren’t unique or reliable. |
| ✅ Name relationships and fields clearly | Helps with debugging and understanding. |
| ✅ Document your data model           | Include relationship definitions and purposes.|

---

## 🔹 6. Checking and Troubleshooting Relationships

- Use **"Manage Relationships"** window to:
  - View all relationships
  - Edit/delete existing ones
  - Identify ambiguous or incorrect links

- Use **Diagram View** for visual clarity.

- Use `USERELATIONSHIP()` in DAX to activate inactive relationships in calculated measures.

---

## 🔹 7. Common Pitfalls to Avoid

- ❌ Relying only on AutoDetect
- ❌ Using too many bidirectional filters
- ❌ Not verifying unique keys in dimension tables
- ❌ Creating circular dependencies
- ❌ Failing to model date relationships properly

---

## 📌 Summary

Power BI relationships are the backbone of your data model. Whether using **AutoDetect** or **manual relationships**, it’s important to:

- Understand relationship types and filters
- Follow modeling best practices
- Actively manage and review relationship definitions




