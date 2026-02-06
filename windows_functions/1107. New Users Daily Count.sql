
WITH CTE AS(
SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY activity_date ASC) AS rn
FROM traffic
WHERE activity = 'login'
)

SELECT  
        activity_date AS login_date,
        SUM(rn) AS user_count
FROM CTE
WHERE rn = 1 AND activity_date >= DATE_SUB('2019-06-30', INTERVAL 90 DAY) AND activity_date <= '2019-06-30' 
GROUP BY activity_date
ORDER BY activity_date;
