/* Write your T-SQL query statement below */
SELECT sub.Department
     , sub.Employee
     , sub.Salary
FROM (
    SELECT d.name AS Department
         , e.name AS Employee
         , e.salary AS Salary
         , MAX (e.salary) OVER (PARTITION BY e.departmentid) AS Max_Salary
    FROM employee AS e
        JOIN department AS d ON e.departmentid = d.id
    ) AS sub
WHERE sub.Salary = sub.Max_Salary;