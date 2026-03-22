# Write your MySQL query statement below
WITH events_cte AS(
SELECT
        *,
        AVG(occurrences) OVER(PARTITION BY event_type) AS avg_activity
FROM events
)

SELECT
        business_id
FROM events_cte
WHERE occurrences > avg_activity
GROUP BY business_id
HAVING COUNT(event_type)>1
ORDER BY business_id