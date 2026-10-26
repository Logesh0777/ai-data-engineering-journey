-- SQL LEARNING JOURNEY - WEEK 2 DAY 1
-- Topic: INNER JOIN, LEFT JOIN and Aggregation
-- Database: PostgreSQL
-- Tables: customer, orders


-- EXERCISE 1: Show each order with customer details

SELECT c.customer_name,
       c.city,
       o.order_id,
       o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- EXERCISE 2: Orders greater than 7000

SELECT c.customer_name,
       o.order_id,
       o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_amount > 7000
ORDER BY o.order_amount DESC;


-- EXERCISE 3: Total order spending per customer

SELECT c.customer_name,
       SUM(o.order_amount) AS total_order_spend
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_spend DESC;


-- EXERCISE 4: Customers whose total spending exceeds 10000

SELECT c.customer_name,
       SUM(o.order_amount) AS total_order_spend
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.order_amount) > 10000
ORDER BY total_order_spend DESC;


-- EXERCISE 5: Total of orders individually greater than 5000

SELECT c.customer_name,
       SUM(o.order_amount) AS total_order_spend
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_amount > 5000
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_spend DESC;


-- EXERCISE 6: Show all customers and their order IDs

SELECT c.customer_name,
       c.city,
       o.order_id
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- EXERCISE 7: Find customers without orders

SELECT c.customer_name,
       c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- EXERCISE 8: Count orders per customer, including zero orders

SELECT c.customer_name,
       c.city,
       COUNT(o.order_id) AS order_count
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY order_count DESC;


-- EXERCISE 9: Customers with at least two orders

SELECT c.customer_name,
       c.city,
       COUNT(o.order_id) AS order_count
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
HAVING COUNT(o.order_id) >= 2
ORDER BY order_count DESC;


-- EXERCISE 10: Customer order summary, including customers
-- without orders. Replace NULL spending with zero.

SELECT c.customer_name,
       c.city,
       COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.order_amount), 0) AS total_order_spend
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_order_spend DESC;



-- DAY 1 FINAL ASSESSMENT


-- Q1: Each order with customer name and amount

SELECT c.customer_name,
       o.order_id,
       o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Q2: All customers, including those without orders

SELECT c.customer_name,
       c.city,
       o.order_id
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Q3: Customers whose total order spending exceeds 10000

SELECT c.customer_name,
       SUM(o.order_amount) AS total_order_spend
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.order_amount) > 10000
ORDER BY total_order_spend DESC;


-- Q4: Customers who have never placed an order

SELECT c.customer_name,
       c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Q5: All customers with order count and total spending,
-- replacing NULL totals with zero

SELECT c.customer_name,
       c.city,
       COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.order_amount), 0) AS total_order_spend
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_order_spend DESC;


    -- END OF WEEK 2 DAY 1
