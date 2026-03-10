-- Write your query below
WITH CTE AS(
SELECT
        player_id,
        MIN(event_date) AS date
FROM activity
GROUP BY player_id
)

SELECT
        a.player_id,
        a.device_id
FROM activity a INNER JOIN cte b ON a.player_id = b.player_id AND a.event_date = b.date;
