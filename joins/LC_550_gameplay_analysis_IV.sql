-- Approach: group by with min(date) + self join
-- Time: O(N) => Group by + Join
-- Space: O(N) => CTE
WITH first_login AS(
SELECT 
        player_id,
        MIN(event_date) AS first_login_date
FROM activity
GROUP BY player_id
)


SELECT 
      ROUND((COUNT(DISTINCT a.player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity)),2) AS fraction
FROM first_login a 
JOIN activity b on 
(a.player_id = b.player_id) AND b.event_date = (DATE_ADD(a.first_login_date, INTERVAL 1 DAY));
