//8. The percentage of time the top 50 users with the highest watch time have spent watching anime since creating their accounts.

MATCH (u:User)
RETURN u.user_days_spent_watching AS watch_time, u.user_days_spent_watching/duration.inDays(date(u.join_date), date()).days * 100 AS percentage_time_watched, u.username AS username
ORDER BY watch_time DESC
LIMIT 50
