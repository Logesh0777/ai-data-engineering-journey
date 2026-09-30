-- SQL LEARNING - WEEK 1 DAY 4
-- Topic: Aggregate Functions & GROUP BY

-- EXERCISE 1
-- Count total number of customers

SELECT COUNT(*)
FROM customer;

-- EXERCISE 2
-- Count customers from Chennai

SELECT COUNT(*)
FROM customer
WHERE city = 'Chennai';

-- EXERCISE 3
-- Total annual spending of all customers

SELECT SUM(annual_spend)
FROM customer;

-- EXERCISE 4
-- Total annual spending of Hyderabad customers

SELECT SUM(annual_spend)
FROM customer
WHERE city = 'Hyderabad';

-- EXERCISE 5
-- Average annual spending of all customers

SELECT AVG(annual_spend)
FROM customer;

-- EXERCISE 6
-- Highest annual spending

SELECT MAX(annual_spend)
FROM customer;

-- EXERCISE 7
-- Lowest annual spending

SELECT MIN(annual_spend)
FROM customer;

-- EXERCISE 8
-- Number of customers in each city

SELECT city,
       COUNT(*) AS customer_count
FROM customer
GROUP BY city;

-- EXERCISE 9
-- Total spending for each city

SELECT city,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY city;

-- EXERCISE 10
-- Average spending for each city

SELECT city,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city;

-- EXERCISE 11
-- Cities with at least 2 customers

SELECT city,
       COUNT(*) AS customer_count
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2;

-- MAIN BUSINESS CHALLENGE
-- Cities with at least 2 customers
-- and total spending above ₹120,000

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2
AND SUM(annual_spend) > 120000
ORDER BY total_spend DESC;

-- DAY 4 ASSESSMENT

-- Q1
-- Number of customers from Tamil Nadu

SELECT COUNT(*) AS customer_count
FROM customer
WHERE state = 'Tamil Nadu';


-- Q2
-- Total annual spending of Bangalore customers

SELECT SUM(annual_spend) AS total_spend
FROM customer
WHERE city = 'Bangalore';


-- Q3
-- Average annual spending of Coimbatore customers

SELECT AVG(annual_spend) AS average_spend
FROM customer
WHERE city = 'Coimbatore';


-- Q4
-- Number of customers in each state

SELECT state,
       COUNT(*) AS customer_count
FROM customer
GROUP BY state;


-- Q5
-- Total annual spending for each state

SELECT state,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY state;


-- Q6
-- States with total spending above ₹200,000

SELECT state,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY state
HAVING SUM(annual_spend) > 200000;


-- Q7
-- Top 2 cities by average annual spending
-- Only cities with at least 2 customers

SELECT city,
       COUNT(*) AS customer_count,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY average_spend DESC
LIMIT 2;