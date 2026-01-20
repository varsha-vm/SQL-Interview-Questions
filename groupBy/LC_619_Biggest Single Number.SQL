# Write your MySQL query statement below
WITH CTE AS(
SELECT
        num
FROM mynumbers
GROUP BY num 
HAVING COUNT(num)=1
)

SELECT
        MAX(num) AS num
FROM CTE
