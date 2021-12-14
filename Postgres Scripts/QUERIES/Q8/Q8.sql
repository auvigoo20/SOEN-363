SELECT username,user_days_spent_watching,join_date,
       extract(day from(current_timestamp-join_date)) as day_since_joinnning,
       user_days_spent_watching/extract(day from(current_timestamp-join_date)) as watch_percentage
FROM Users
ORDER BY user_days_spent_watching DESC
LIMIT 50;



--Time: 486ms