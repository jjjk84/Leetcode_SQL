# Write your MySQL query statement below
# SELECT DISTINCT(logs.num) AS ConsecutiveNums
# FROM logs
#     INNER JOIN logs AS logs_n ON logs.id + 1 = logs_n.id
#     INNER JOIN logs AS logs_n_n on logs_n.id + 1 = logs_n_n.id
# WHERE logs.num = logs_n.num AND logs_n.num = logs_n_n.num

WITH num_summary AS (
SELECT num AS num1
     , LAG(num, 1) OVER (ORDER BY id) AS num2
     , LAG(num, 2) OVER (ORDER BY id) AS num3
FROM logs
)

SELECT DISTINCT num1 AS ConsecutiveNums
FROM num_summary
WHERE num1 = num2
  AND num2 = num3