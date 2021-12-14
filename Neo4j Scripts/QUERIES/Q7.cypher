//7. Get the user information of the user with the largest anime list and their total watch time as well as the age of their account.
MATCH (u:User)-[r:HAS_IN_LIST]->(a:Anime)
RETURN COUNT(r) AS number_of_animes, u.username AS username, u.user_days_spent_watching AS watch_time, duration.inDays(date(u.join_date), date()).days AS account_age
ORDER BY number_of_animes DESC
LIMIT 1
