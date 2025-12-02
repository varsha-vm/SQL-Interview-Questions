# Write your MySQL query statement below
WITH employee_data AS(
SELECT 
        a.id as emp_id,
        a.name as emp_name,
        a.salary as emp_salary,
        a.managerid as manager_id,
        b.salary as manager_salary
FROM employee a
JOIN employee b ON (a.managerid = b.id))

SELECT 
        emp_name as Employee
FROM employee_data
WHERE emp_salary > manager_salary;