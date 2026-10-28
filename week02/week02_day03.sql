-- Week 2 Day 3 — SQL JOIN practice session
-- Tables used: customer and orders only
-- Database: PostgreSQL
-- Practice solutions from today using the existing customer and orders tables.

/*
Challenge 1: Find customers who have never placed an order.
Return customer_id and customer_name.
Pattern: LEFT JOIN + IS NULL on a right-table key.
*/
SELECT c.customer_id,
       c.customer_name
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
Challenge 2: Show only orders worth at least 10000, with customer name.
Return customer_name, order_id, order_amount.
Only customers with qualifying orders should appear.
*/
SELECT c.customer_name,
       o.order_id,
       o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_amount >= 10000
ORDER BY o.order_amount DESC;

/*
Challenge 3: Show every customer with their order IDs, if any.
Return customer_name, city, order_id.
*/
SELECT c.customer_name,
       c.city,
       o.order_id
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

/*
Challenge 4: Show every order and any matching customer details.
Return order_id, order_amount, customer_name, city.
The orders table must be preserved, even if a customer is unmatched.
*/
SELECT o.order_id,
       o.order_amount,
       c.customer_name,
       c.city
FROM orders AS o
LEFT JOIN customer AS c
    ON o.customer_id = c.customer_id
ORDER BY o.order_amount DESC;

/*
Challenge 5: Find orders with no matching customer.
Return order_id and customer_id.
Pattern: start from orders; test a right-table key for NULL.
*/
SELECT o.order_id,
       o.customer_id
FROM orders AS o
LEFT JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
Challenge 6: Find customers who have never placed an order.
Return customer_id, customer_name, city.
*/
SELECT c.customer_id,
       c.customer_name,
       c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
Challenge 7: List each customer who has placed at least one order once only.
Return customer_id and customer_name.
*/
SELECT DISTINCT c.customer_id,
                c.customer_name
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

/*
Challenge 8: Find orders placed by customers who live in Chennai.
Return order_id, customer_name, city, order_amount.
*/
SELECT o.order_id,
       c.customer_name,
       c.city,
       o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.city = 'Chennai';

/*
Challenge 9: Keep every customer, but match only orders dated on or after
2026-10-07. Return customer_name, city, order_id, order_date.
The order-date condition belongs in ON to preserve all customers.
*/
SELECT c.customer_name,
       c.city,
       o.order_id,
       o.order_date
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
   AND o.order_date >= DATE '2026-10-07'
ORDER BY c.customer_id, o.order_date;

/*
Challenge 10: Show every Chennai customer with order details, if any.
Return customer_name, city, order_id, order_amount.
The city condition is on the left table; it can be in WHERE while still
preserving every customer from Chennai.
*/
SELECT c.customer_name,
       c.city,
       o.order_id,
       o.order_amount