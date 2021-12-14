//3. location with the most anime consumers 
MATCH (u:User)
RETURN COUNT(u) AS otaku_count, u.location
ORDER BY otaku_count DESC
LIMIT 1
