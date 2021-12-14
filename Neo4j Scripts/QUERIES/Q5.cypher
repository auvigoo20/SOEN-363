//5 average age of anime consumer
MATCH (u:User)
RETURN AVG(duration.inDays(date(u.birth_date), date()).days/365)
