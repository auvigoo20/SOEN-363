CREATE TABLE AnimeList(
	username text,
	anime_id int, 
	my_watched_episodes int,
	my_start_date text,
	my_finish_date text,
	my_score int,
	my_status int,
	my_rewatching text ,
	my_rewatching_ep int,
	my_last_updated date,
	my_tags text,
	PRIMARY KEY (username, anime_id),
	FOREIGN KEY (username) REFERENCES users(username),
	FOREIGN KEY (anime_id) REFERENCES anime(anime_id)
);
