LOAD CSV WITH HEADERS FROM 'file:///users_cleaned.csv' AS row
WITH 
row.username AS username,
toInteger(row.user_id) AS user_id,
toInteger(row.user_watching) AS user_watching,
toInteger(row.user_completed) AS user_completed,
toInteger(row.user_onhold) AS user_onhold,
toInteger(row.user_dropped) AS user_dropped,
toInteger(row.user_plantowatch) AS user_plantowatch,
toFloat(row.user_days_spent_watching) AS user_days_spent_watching,
row.gender AS gender,
row.location AS location,
datetime(replace(row.birth_date, ' ', 'T')) AS birth_date,
toInteger(row.access_rank) AS access_rank,
datetime(replace(row.join_date, ' ', 'T')) AS join_date,
datetime(replace(row.last_online, ' ', 'T')) AS last_online,
toFloat(row.stats_mean_score) AS stats_mean_score,
toFloat(row.stats_rewatched) AS stats_rewatched,
toInteger(row.stats_episodes) AS stats_episodes


MERGE (u:User {username: username})
    SET u.user_id = user_id,
        u.user_watching = user_watching,
        u.user_completed = user_completed,
        u.user_onhold = user_onhold,
        u.user_dropped = user_dropped,
        u.user_plantowatch = user_plantowatch,
        u.user_days_spent_watching = user_days_spent_watching,
        u.gender = gender,
        u.location = location,
        u.birth_date = birth_date,
        u.access_rank = access_rank,
        u.join_date = join_date,
        u.last_online = last_online,
        u.stats_mean_score = stats_mean_score,
        u.stats_rewatched = stats_rewatched,
        u.stats_episodes = stats_episodes

RETURN count(u);






