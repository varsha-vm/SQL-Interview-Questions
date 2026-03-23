
# Write your MySQL query statement below
WITH CTE AS(
SELECT
        COUNT(DISTINCT b.post_id)/COUNT(DISTINCT a.post_id) AS daily_avg
FROM actions a
LEFT JOIN removals b 
ON a.post_id = b.post_id
WHERE extra = 'spam'
GROUP BY a.action_date
)

SELECT
        ROUND(AVG(daily_avg*100),2) AS average_daily_percent
FROM CTE


