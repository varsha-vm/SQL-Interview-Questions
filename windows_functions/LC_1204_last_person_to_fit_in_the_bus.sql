-- Approach: Window function SUM() to get cummulative total, and limit
-- Time:O(N)
-- Space: O(N)
WITH within_1000 AS(
SELECT
        *,
        SUM(weight) OVER(order by turn) AS total_weight
FROM queue
)

SELECT 
        person_name
FROM within_1000
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;

