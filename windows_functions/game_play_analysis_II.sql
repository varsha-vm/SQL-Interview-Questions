-- Write your query below
SELECT
        player_id,
        device_id
FROM (SELECT
        player_id,
        device_id,
        ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rn
FROM activity) 
WHERE rn=1;