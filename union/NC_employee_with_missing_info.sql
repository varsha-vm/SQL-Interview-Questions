-- Write your query below
WITH missing_emp AS(
SELECT
        employee_id
FROM employees
WHERE employee_id  NOT IN (SELECT employee_id FROM salaries)
),

missing_salary AS(
SELECT
        employee_id
FROM salaries
WHERE employee_id  NOT IN (SELECT employee_id FROM employees)
)

(SELECT
        *
FROM missing_emp
UNION 
SELECT
        *
FROM missing_salary)
ORDER BY employee_id
