-- SQL LEARNING - WEEK 1 DAY 3
-- Topic: LIKE, NULL, Text Searching

-- Exercise 1
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE 'R%';

-- Exercise 2
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE '%Kumar%';

-- Exercise 3
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE '%a';

-- Exercise 4
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE '%i%';

-- Exercise 5
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE '%a%'
AND annual_spend > 70000;

-- Exercise 6
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE 'A____';

-- Exercise 7
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name NOT LIKE '%Kumar%';

-- Exercise 8
SELECT customer_name, city, annual_spend
FROM customer
WHERE city IS NULL;

-- Exercise 9
SELECT customer_name, city, annual_spend
FROM customer
WHERE city IS NOT NULL
AND annual_spend > 60000;

-- Main Challenge
SELECT customer_name, city, annual_spend
FROM customer
WHERE customer_name LIKE '%a%'
AND city IS NOT NULL
AND city IN ('Chennai', 'Coimbatore', 'Bangalore')
AND annual_spend BETWEEN 50000 AND 100000
ORDER BY annual_spend DESC
LIMIT 3;

-- DAY 3 ASSESSMENT

-- Q1
SELECT customer_name, city
FROM customer
WHERE customer_name LIKE 'S%';

-- Q2
SELECT customer_name, annual_spend
FROM customer
WHERE customer_name LIKE '%a%'
AND annual_spend < 70000;

-- Q3
SELECT customer_name, city
FROM customer
WHERE city <> 'Chennai';

-- Q4
SELECT customer_name, city, annual_spend
FROM customer
WHERE city IS NOT NULL
AND annual_spend BETWEEN 40000 AND 80000;

-- Q5
SELECT customer_name, city, annual_spend
FROM customer
WHERE state = 'Tamil Nadu'
AND customer_name LIKE '%a%'
AND annual_spend > 50000
AND city IS NOT NULL
ORDER BY annual_spend DESC
LIMIT 3;


-- DAY 3 CORRECTION


-- C1
SELECT customer_name, city
FROM customer
WHERE customer_name LIKE 'M%';

-- C2
SELECT customer_name, annual_spend
FROM customer
WHERE customer_name LIKE '%a%'
AND annual_spend < 80000;

-- C3 FINAL
SELECT customer_name, city, annual_spend
FROM customer
WHERE state = 'Tamil Nadu'
AND customer_name LIKE '%a%'
AND annual_spend BETWEEN 40000 AND 100000
AND city IS NOT NULL
ORDER BY annual_spend DESC
LIMIT 3;