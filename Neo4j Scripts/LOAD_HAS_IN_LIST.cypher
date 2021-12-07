:auto USING PERIODIC COMMIT 100000
LOAD CSV WITH HEADERS FROM 'file:///animelists_cleaned_split/animelists_cleaned_2.csv' AS row
WITH 
row.username AS username, 
toInteger(row.anime_id) AS anime_id,
toInteger(row.my_watched_episodes) AS my_watched_episodes,
row.my_start_date AS my_start_date,
row.my_finish_date AS my_finish_date,
toInteger(row.my_score) AS my_score,
toInteger(row.my_status) AS my_status,
row.my_rewatching AS my_rewatching,
toInteger(row.my_rewatching_ep) AS my_rewatching_ep,
datetime(replace(row.my_last_updated, ' ', 'T')) AS my_last_updated,
row.my_tags AS my_tags

MATCH (a:Anime {anime_id:anime_id})
MATCH (u:User {username:username})

MERGE (u)-[rel:HAS_IN_LIST {my_watched_episodes: my_watched_episodes}]->(a)
SET rel.my_start_date = my_start_date,
    rel.my_finish_date = my_finish_date,
    rel.my_score = my_score,
    rel.my_status = my_status,
    rel.my_rewatching = my_rewatching,
    rel.my_rewatching_ep = my_rewatching_ep,
    rel.my_last_updated = my_last_updated,
    rel.my_tags = my_tags

RETURN count(rel)    
 