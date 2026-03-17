-- Write your query below
WITH most_exp_cte AS(
SELECT
        p.project_id,
        e.employee_id,
        RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rnk
FROM project p
JOIN employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id, e.employee_id
)

SELECT
        project_id,
        employee_id
FROM most_exp_cte
WHERE rnk = 1
