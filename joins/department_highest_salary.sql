-- Write your query below
WITH max_salary_in_dept AS(
SELECT
department_id AS id,
name AS employee,
salary,
RANK() OVER(PARTITION BY department_id ORDER BY SALARY DESC) AS rnk
FROM employee
)


SELECT
b.name AS department,
a.employee,
a.salary
FROM max_salary_in_dept a
INNER JOIN department b 
ON a.id = b.id
WHERE rnk = 1
ORDER BY department    

