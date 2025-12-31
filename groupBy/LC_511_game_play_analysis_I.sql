-- Write your MySQL query statement below
-- Time: O(N)
-- Space: O(N)
SELECT
        player_id,
        MIN(event_date) AS first_login
FROM activity
GROUP BY player_id
