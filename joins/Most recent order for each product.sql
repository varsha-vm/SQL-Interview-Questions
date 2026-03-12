-- Write your query below
WITH CTE AS(
SELECT
        product_id,
        MAX(order_date) AS recent_date
FROM orders
GROUP BY product_id
)

SELECT
        p.product_name,
        p.product_id,
        o.order_id,
        o.order_date
FROM orders o 
JOIN CTE c 
ON o.product_id = c.product_id AND o.order_date = c.recent_date
JOIN products p ON o.product_id = p.product_id
ORDER BY p.product_name, p.product_id, o.order_id;