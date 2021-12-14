//4 how much anime do montrealers consume
MATCH (u:User)
WHERE toLower(u.location) CONTAINS "montreal"
RETURN AVG(u.user_days_spent_watching) AS avg_watch_time_in_days, AVG(duration.inDays(date(u.join_date), date()).days) AS avg_account_age_in_days
