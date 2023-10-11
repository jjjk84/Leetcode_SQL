# Write your MySQL query statement below
-- the fraction = players that logged in again on the day after the day they first logged in / the total number of players.

--  rounded to 2 decimal places

-- 각 아이디별 첫 접속일
WITH first_log AS (
    SELECT player_id
         , MIN(event_date) AS first_logged_in
    FROM activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(DISTINCT CASE WHEN a.event_date = DATE_ADD(f.first_logged_in, INTERVAL 1 DAY) THEN a.player_id END) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM activity AS a
    JOIN first_log AS f ON a.player_id = f.player_id
