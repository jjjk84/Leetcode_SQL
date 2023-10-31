# Write your MySQL query statement below
WITH date_rank AS (
    SELECT player_id
         , event_date
         , ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rank_
    FROM activity
)

SELECT player_id
     , event_date AS first_login
FROM date_rank
WHERE rank_ = 1

