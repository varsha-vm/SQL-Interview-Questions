-- Write your query below
-- most frequesntly ordered product for each customer

WITH RANKED_ITEMS AS(
SELECT
        customer_id,
        product_id, 
        RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS rnk
FROM orders 
GROUP BY customer_id, product_id
)

SELECT
        a.customer_id,
        b.product_id,
        b.product_name
FROM RANKED_ITEMS a
JOIN products b 
ON a.product_id = b.product_id
JOIN customers c 
ON a.customer_id = c.customer_id
WHERE rnk = 1
ORDER BY customer_id

