-- Write your query below
WITH purchase_hist AS(
SELECT
        c.customer_id,
        c.customer_name,
        CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END AS purchased_A,
        CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END AS purchased_B,
        CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END AS purchased_C
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
)

SELECT
        customer_id,
        customer_name
FROM purchase_hist
GROUP BY customer_id, customer_name
HAVING SUM(purchased_A) >= 1 AND SUM(purchased_B) >= 1 AND SUM(purchased_C) = 0
ORDER BY customer_name;

