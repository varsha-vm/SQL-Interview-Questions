-- Write your query below
SELECT
        customer_number
FROM
(SELECT
        customer_number,
        COUNT(order_number) AS total_order_cnt
FROM orders 
GROUP BY customer_number)
ORDER BY total_order_cnt DESC
LIMIT 1;
