# Write your MySQL query statement below
SELECT name
FROM employee
WHERE id IN (
    SELECT managerId
    FROM employee AS e
    WHERE e.managerId != 'None'
    GROUP BY e.managerId
        HAVING COUNT(*) >= 5    
)