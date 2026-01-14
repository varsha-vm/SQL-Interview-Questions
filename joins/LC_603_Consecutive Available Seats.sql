-- Write your MySQL query statement below
WITH CTE AS(
SELECT
        c1.seat_id as c1,
        c2.seat_id as c2
FROM cinema c1
JOIN cinema c2 ON c1.seat_id - c2.seat_id = -1
WHERE c1.free=1 AND c2.free = 1
)

SELECT
        c1 AS seat_id
FROM CTE
UNION
SELECT
        c2 AS seat_id
FROM CTE
ORDER BY seat_id

