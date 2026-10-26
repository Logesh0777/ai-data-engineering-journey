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