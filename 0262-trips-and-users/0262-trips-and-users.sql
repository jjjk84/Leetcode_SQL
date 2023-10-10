# Write your MySQL query statement below

-- cancellation rate : the number of canceled (by client or driver) requests with unbanned users / the total number of requests with unbanned users
-- each day between "2013-10-01" and "2013-10-03"
-- Round Cancellation Rate to two decimal points.

WITH unbanned AS (
    SELECT users_id
    FROM users
    WHERE banned = 'No'
)

SELECT request_at AS Day
     , ROUND(COUNT(DISTINCT CASE WHEN status LIKE 'cancelled%' THEN id ELSE NULL END) / COUNT(DISTINCT id), 2) AS 'Cancellation Rate'
FROM trips
WHERE client_id IN (SELECT users_id FROM unbanned)
  AND driver_id IN (SELECT users_id FROM unbanned)
  AND request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY Day
