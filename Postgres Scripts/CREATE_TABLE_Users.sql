CREATE TABLE Users(
	username text PRIMARY KEY,
	user_id int,
	user_watching int,
	user_completed int, 
	user_onhold int,
	user_dropped int,
	user_plantowatch int,
	user_days_spent_watching float,
	gender varchar(10),
	location text,
	birth_date Date,
	access_rank int,
	join_date date,
	last_online date,
	stats_mean_score float,
	stats_rewatched float,
	stats_episodes int
);
