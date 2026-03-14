-- Write your MySQL query statement below
SELECT
        extra AS report_reason,
        COUNT(DISTINCT post_id) AS report_count
FROM actions
WHERE action_date = DATE_ADD('2019-07-05', INTERVAL -1 DAY) 
AND action = 'report' AND extra IS NOT NULL
GROUP BY extra;