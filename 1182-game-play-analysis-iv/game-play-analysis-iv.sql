SELECT 
    ROUND(
        COUNT(a.player_id) / COUNT(DISTINCT first_login.player_id),
        2
    ) AS fraction
FROM (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
) AS first_login
LEFT JOIN Activity AS a
    ON first_login.player_id = a.player_id
    AND a.event_date = DATE_ADD(first_login.first_date, INTERVAL 1 DAY);

