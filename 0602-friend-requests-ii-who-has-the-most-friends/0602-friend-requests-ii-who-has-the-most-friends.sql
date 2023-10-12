# Write your MySQL query statement below
WITH friends_total AS (
    SELECT requester_id AS id
        , COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY id

    UNION ALL

    SELECT accepter_id AS id
         , COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY id
)

SELECT id
     , SUM(num) AS num
FROM friends_total
GROUP BY id
ORDER BY num DESC
LIMIT 1