## Day 1 — SQL JOINs and Multi-Table Analysis

### Topics Learned

- `INNER JOIN`
- `LEFT JOIN`
- `ON` and matching keys
- Table aliases using `AS`
- Joining customer and order tables
- `COUNT()` and `SUM()` with JOINs
- `GROUP BY` and `HAVING` with JOINs
- Finding unmatched records using `IS NULL`
- Handling missing aggregate values with `COALESCE()`
- Sorting joined and aggregated results

### Tables Used

- `customer` — customer details, including customer ID, name and city.
- `orders` — order ID, customer ID, order date and order amount.

### Practical Exercises

- Retrieve orders with customer details.
- Filter orders by order amount.
- Calculate total spending per customer.
- Find customers whose total order spending exceeds a threshold.
- Filter individual orders before aggregation.
- Include all customers using `LEFT JOIN`.
- Find customers who have never placed orders.
- Count orders per customer, including zero orders.
- Find customers with at least two orders.
- Create a complete customer order summary.

### Key Learning

#### INNER JOIN

Returns records with matching keys in both tables.

#### LEFT JOIN

Keeps all rows from the left table and returns matching rows from the right table when available.

#### GROUP BY with JOIN

Combines multiple order records into customer-level metrics.

#### COUNT() vs SUM()

- `COUNT(o.order_id)` counts matching orders and returns zero when no order matches a customer.
- `SUM(o.order_amount)` calculates total order spending.
- `COALESCE(SUM(o.order_amount), 0)` replaces a missing total with zero.

#### Finding Customers Without Orders

```sql
SELECT c.customer_name,
       c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

### Day 8 Assessment

**Completed:** All five assessment questions, including their required corrections.

### Skills Checklist

- [x] Connect two tables using a shared key.
- [x] Use `INNER JOIN` for matching records.
- [x] Use `LEFT JOIN` to retain unmatched left-side records.
- [x] Apply table aliases.
- [x] Aggregate order values by customer.
- [x] Filter aggregated results with `HAVING`.
- [x] Identify customers without orders.
- [x] Count orders correctly.
- [x] Replace missing totals using `COALESCE()`.
- [x] Sort customer-level reports by total spending.

### Key Takeaway

JOINs connect related information stored across multiple tables. Combining JOINs with aggregation allows SQL to produce useful business reports from relational data.

## Week 2 — Day 2: Combining SQL Filters
Today's focus
Combine conditions with AND, OR, and parentheses. This stays within Week 2: Filtering of the SQL roadmap.
Key concepts
- AND: every condition must be true for a row to be returned.
- OR: at least one condition must be true.
- Parentheses (): show which conditions belong together, especially when a query mixes AND and OR.
- BETWEEN low AND high: includes both the lower and upper boundaries.
- Date filters: in PostgreSQL, a date literal can be written as DATE '2026-10-07'.
Example
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_amount > 7000
  AND order_date >= DATE '2026-10-07'
ORDER BY order_amount DESC;
This returns only orders where both conditions are true: the amount is above 7,000 and the date is 7 October 2026 or later.
Important reminder
SQL evaluates AND before OR. When you intend a particular logical grouping, use parentheses instead of relying on precedence.
Practice file
Open week02_day02.sql for four worked examples and eight practice queries with solutions.
Roadmap boundary
Today's lesson covers filtering only. Aggregation is scheduled for Week 3, and JOINs are scheduled for Week 4. Earlier bonus exposure to those topics does not count as completing those roadmap weeks.
## Day 3: SQL JOINs

Practised matching customer records with their orders.

Concepts Covered

INNER JOIN

LEFT JOIN

Matching tables using ON

Filtering conditions in ON versus WHERE

Finding customers who have never placed orders

Finding orders without matching customers

Using IS NULL and IS NOT NULL to identify unmatched records

Using DISTINCT to return unique customers

Filtering joined results by city, order amount, and order date

Sorting results using ORDER BY

Practice File

week02_day03.sql — SQL JOIN practice and challenge solutions.

Database Tables

customer

Contains customer information, including:

customer_id

customer_name

city

orders

Contains order information, including:

order_id

customer_id

order_date

order_amount

Key Learnings

INNER JOIN returns rows with matching records in both tables.

LEFT JOIN preserves all rows from the left table.

ON determines which rows match.

WHERE filters the resulting rows.

A LEFT JOIN followed by WHERE o.order_id IS NULL can identify customers without orders.

The table placed on the left side of a LEFT JOIN determines which records are preserved.

Tools Used

PostgreSQL

SQL

Visual Studio Code

Git and GitHub

Learning Goal

Build strong SQL skills through daily practice and follow my SQL learning roadmap in the correct order.

## Week 2 — Day 4: SQL JOINs Practice

### Overview

Today's focus was on SQL JOINs using a practical customer and orders database.
The exercises simulate common business reporting tasks found in retail, sales
operations and ERP systems.

**Topics covered**
- INNER JOIN
- LEFT JOIN
- Filtering joined data with ON and WHERE
- Finding customers without matching orders
- Handling NULL values
- DISTINCT to prevent duplicate customer records
- Filtering by city and order amount
- Sorting results using multiple columns
- Preserving customers who have no orders
- Building customer-order reports

### Database Tables

**customer**
- customer_id
- customer_name
- city

**orders**
- order_id
- customer_id
- order_date
- order_amount

Relationship: `customer.customer_id` connects to `orders.customer_id`.

### Business Scenarios Practised

1. Find customers in selected cities and match only qualifying orders.
2. Find customers with orders above a specified amount.
3. Identify customers without orders meeting a condition.
4. List each qualifying customer only once.
5. Find customers who have never placed an order.
6. Retrieve orders below a specified amount.
7. Display every customer, including customers without orders.
8. Generate an order report for a specific city.
9. Identify customers who have no orders below a threshold.
10. Generate a date-filtered customer-order report.

### Key Learnings

- INNER JOIN returns rows with matching records in both tables.
- LEFT JOIN preserves every row from the left table.
- Conditions in ON control which records match.
- WHERE filters the rows returned by the join.
- LEFT JOIN combined with IS NULL helps identify records without matches.
- DISTINCT helps return unique customers when several orders qualify.
- ORDER BY supports predictable business reporting.

### Practical Skills Checklist

Use this checklist to evaluate independent skills.

- [ ] Choose INNER JOIN or LEFT JOIN based on a requirement.
- [ ] Connect tables using the correct relationship.
- [ ] Apply filtering conditions in ON and WHERE appropriately.
- [ ] Find customers who have never placed an order.
- [ ] Preserve customers with no matching orders.
- [ ] Return unique customers when multiple orders qualify.
- [ ] Apply multiple sorting conditions correctly.
- [ ] Explain the result of a JOIN without relying on a tutorial.
- [ ] Solve a business reporting problem independently.
- [ ] Complete all 10 daily practice problems and review their outputs.

### Employability Connection

These JOIN techniques are useful for:
- Customer and sales reporting
- Order management
- Retail analytics
- ERP reporting
- Data cleaning and validation
- Preparing datasets for BI dashboards
- Building data pipelines for analytics and AI applications

### Next Steps

Continue practising SQL JOINs before progressing to the next topic.

The long-term goal is to use SQL, Excel, Power BI, Python, data engineering,
cloud services and AI to build an integrated end-to-end data platform.

**Repository:** [ai-data-engineering-journey](https://github.com/Logesh0777/ai-data-engineering-journey)