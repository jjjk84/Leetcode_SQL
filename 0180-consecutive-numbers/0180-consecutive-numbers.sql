# Write your MySQL query statement below
SELECT DISTINCT(logs.num) AS ConsecutiveNums
FROM logs
    INNER JOIN logs AS logs_n ON logs.id + 1 = logs_n.id
    INNER JOIN logs AS logs_n_n on logs_n.id + 1 = logs_n_n.id
WHERE logs.num = logs_n.num AND logs_n.num = logs_n_n.num