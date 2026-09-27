CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    annual_spend DECIMAL(10,2)
);
INSERT INTO customers
(customer_id, customer_name, city, state, annual_spend)
VALUES
(1, 'Arun Kumar', 'Chennai', 'Tamil Nadu', 85000),
(2, 'Priya Sharma', 'Coimbatore', 'Tamil Nadu', 62000),
(3, 'Ravi Kumar', 'Bangalore', 'Karnataka', 41000),
(4, 'Divya Raj', 'Madurai', 'Tamil Nadu', 97000),
(5, 'Karthik S', 'Chennai', 'Tamil Nadu', 54000),
(6, 'Sneha R', 'Hyderabad', 'Telangana', 73000),
(7, 'Vijay P', 'Coimbatore', 'Tamil Nadu', 46000),
(8, 'Anjali M', 'Bangalore', 'Karnataka', 112000),
(9, 'Rahul N', 'Madurai', 'Tamil Nadu', 38000),
(10, 'Meena K', 'Hyderabad', 'Telangana', 69000);


-- WEEK 1 - DAY 1
-- SQL FOUNDATIONS

-- Exercise 1
-- Show all customers

select * from customer;


-- Exercise 2
-- Show customer name and city

select customer_name, city from customer;


-- Exercise 3
-- Find customers whose annual spending is greater than 60000

select * from customer
where annual_spend>60000;


-- Exercise 4
-- Find customers from Tamil Nadu

select * from customer
where state ='Tamilnadu';


-- Exercise 5
-- Find customers from Coimbatore

select * from customer
where city = 'Coimbatore';


-- Exercise 6
-- Show customers from highest spending to lowest

select * from customer
order by annual_spend desc;


-- Exercise 7
-- Show top 3 customers by annual spending

select * from customer
order by annual_spend desc
limit 3;

-- Exercise 8
-- Show all unique cities

select distinct city from customer;


-- Exercise 9
-- Find customers whose annual spending is less than 50000

select * from customer
where annual_spend <50000;


-- Exercise 10
-- Show name and spending of customers spending at least 70000

select customer_name, annual_spend from customer
where annual_spend >= 70000;

--Day 1 challenge
--Give me the names and spending of the three highest-value customers, but only customers from Tamil Nadu.

select customer_name, annual_spend
from customers
where state = 'Tamil Nadu'
order by annual_spend desc
limit 3;
