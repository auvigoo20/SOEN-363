CREATE VIEW User_with_most_screen_time as
    SELECT username,user_days_spent_watching as Screen_time_in_Days,user_completed as Watched_Anime
    FROM Users
    GROUP BY username
    ORDER BY user_days_spent_watching DESC
    LIMIT 1;

CREATE VIEW User_who_completed_the_most_anime as
    SELECT username,user_days_spent_watching as Screen_time_in_Days,user_completed as Watched_Anime
    FROM Users
    GROUP BY username
    ORDER BY user_completed DESC
    LIMIT 1;

SELECT *
FROM User_with_most_screen_time
UNION ALL
SELECT *
FROM User_who_completed_the_most_anime;


-- Time : 657ms