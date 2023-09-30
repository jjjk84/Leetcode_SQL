/* Write your T-SQL query statement below */
SELECT d.name AS Department
     , e.name AS Employee
     , e.salary AS Salary
FROM employee AS e
    JOIN department AS d ON e.departmentid = d.id
    LEFT JOIN (SELECT DISTINCT departmentid AS departmentid
                        , MAX (salary) OVER (PARTITION BY departmentid) AS max_salary
          FROM employee) AS m ON e.departmentid = m.departmentid 
WHERE e.salary = m.max_salary;