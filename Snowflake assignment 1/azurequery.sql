

-- Create a table
CREATE TABLE CUSTOMER (

  id INT,
  customer VARCHAR(30),
  region VARCHAR(30),
  amount INT
);
INSERT INTO CUSTOMER (id, customer, region, amount) VALUES
(1, 'Amit Kumar', 'North', 12000),
(2, 'Priya Sharma', 'South', 18000),
(3, 'Rahul Mehta', 'East', 15000),
(4, 'Sneha Rao', 'West', 22000),
(5, 'Ravi Patel', 'Central', 17000);

SELECT * FROM CUSTOMER;