//2 top 10 most popular animes by gender 
MATCH (u:User)-[r:HAS_IN_LIST]->(a:Anime)
WHERE u.gender = "Female" 
RETURN a.title AS title, COUNT(r) AS viewers, u.gender AS gender
ORDER BY viewers DESC
LIMIT 10
