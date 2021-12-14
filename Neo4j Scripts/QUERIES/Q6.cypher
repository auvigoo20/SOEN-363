//6 Get the top 25 anime that are most often dropped (status = 4)

MATCH (u:User)-[r:HAS_IN_LIST]->(a:Anime)
WHERE r.my_status = 4 
RETURN a.title AS title, COUNT(r) AS drop_count
ORDER BY drop_count DESC
LIMIT 25
