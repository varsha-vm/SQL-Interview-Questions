
# Write your MySQL query statement below
WITH posts AS(
SELECT
        DISTINCT sub_id AS post_id
FROM submissions 
WHERE parent_id IS NULL
),

dist_sub AS(
SELECT
        DISTINCT sub_id,
        parent_id
FROM submissions
)

SELECT
        b.post_id,
        COUNT(a.parent_id) AS number_of_comments
FROM dist_sub a RIGHT JOIN posts b 
ON a.parent_id = b.post_id
GROUP BY b.post_id
ORDER BY post_id
