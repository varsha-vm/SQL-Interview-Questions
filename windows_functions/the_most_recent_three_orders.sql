-- Write your query below
WITH recent_orders_cte AS(
SELECT
        c.customer_id,
        c.name AS customer_name,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS rn
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
)

SELECT
customer_name,
customer_id,
order_id,
order_date    
FROM recent_orders_cte
WHERE rn<=3
ORDER BY customer_name, customer_id, order_date DESC;