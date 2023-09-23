# Write your MySQL query statement below
SELECT d.name AS Department
     , e.name AS Employee
     , m.max_salary AS Salary
FROM employee AS e
    JOIN (SELECT departmentId
        , MAX(salary) AS max_salary
        FROM employee
        GROUP BY departmentId) AS m ON e.departmentId = m.departmentId
    JOIN department as d ON e.departmentId = d.id
WHERE e.salary = m.max_salary;

