-- Write your MySQL query statement below
SELECT
        a.customer_id
FROM customer a
GROUP BY customer_id 
HAVING count(distinct a.product_key) = (SELECT count(*) FROM product);