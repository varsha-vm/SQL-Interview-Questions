-- Write your query below
SELECT
       DISTINCT customer_id
FROM customers 
WHERE YEAR = '2020' AND revenue > 0;