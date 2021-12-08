--3. Get the number of anime that each user has in their list, descending order
SELECT al.username, count(al.anime_id) num_of_anime
FROM AnimeList al
GROUP BY al.username
ORDER BY num_of_anime desc