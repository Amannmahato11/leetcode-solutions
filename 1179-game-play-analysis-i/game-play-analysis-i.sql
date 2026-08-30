# Write your MySQL query statement below
SELECT player_id, Min(event_date) AS first_login 
FROM Activity
GROUP BY Player_id