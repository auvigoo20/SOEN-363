--4. Get the top 100 users who watched the highest total number of episodes and their count and location
SELECT al.username, SUM(al.my_watched_episodes) total_episodes, u.location
FROM AnimeList al, Users u
WHERE al.username = u.username
GROUP BY al.username, u.location
ORDER BY total_episodes DESC
limit 100