-- Write your query below
WITH CTE AS(
SELECT
        *,
        RANK() OVER(PARTITION BY DATE(day) ORDER BY amount DESC) as rnk
FROM transactions 
)

SELECT
        transaction_id
FROM cte
WHERE rnk = 1
ORDER BY transaction_id 