-- Write your query below

SELECT
        DISTINCT page_id AS recommended_page
FROM likes
WHERE user_id IN (SELECT
    DISTINCT user2_id AS user_id
    FROM friendship
    WHERE user1_id = 1 
    UNION 
    SELECT
        DISTINCT user1_id
    FROM friendship
    WHERE user2_id = 1) 
AND page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
ORDER BY page_id