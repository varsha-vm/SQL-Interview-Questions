-- Write your MySQL query statement below
WITH CTE AS(
SELECT
        COUNT(employee_id) AS emp_count
FROM project
GROUP BY project_id
ORDER BY emp_count DESC
LIMIT 1
)

SELECT
        project_id
FROM project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT * FROM CTE)