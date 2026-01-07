-- Write your MySQL query statement below
-- Time: O(N)
-- Space: O(N)
SELECT
        a.name
FROM candidate a
JOIN vote b ON a.id = b.candidateid
GROUP BY a.name
ORDER BY COUNT(a.name) DESC
LIMIT 1