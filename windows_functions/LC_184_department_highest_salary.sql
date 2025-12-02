# Write your MySQL query statement below
WITH employee_data AS(
SELECT
        e.id,
        e.name AS employee,
        e.salary,
        d.name AS department,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rnk
FROM employee e
JOIN department d ON (e.departmentid = d.id)
)

SELECT
        department,
        employee,
        salary
FROM employee_data
WHERE rnk=1;
