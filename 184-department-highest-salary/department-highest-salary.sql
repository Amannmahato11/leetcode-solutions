# Write your MySQL query statement below
WITH cte AS 
(SELECT e.name AS Employee, e.salary, d.name AS
department,Max(e.salary)OVER(PARTITION BY
e.departmentID) AS max_salary
FROM Employee e
LEFT JOIN Department d
ON e.departmentID = d.id)

SELECT department, employee, salary
FROM cte
WHERE salary = max_salary