WITH CTE AS(
SELECT
        *,
        LAG(free) OVER(ORDER BY seat_id) AS prev_seat,
        LEAD(free) OVER(ORDER BY seat_id) AS next_seat
FROM cinema
)

SELECT
        seat_id
FROM cte
WHERE free = 1 AND (prev_seat = 1 OR next_seat = 1)
ORDER BY seat_id