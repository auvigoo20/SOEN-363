--5. Get the top 25 anime that are most often dropped (status = 4)
SELECT a.title, COUNT(al.my_status) num_of_times_dropped
FROM AnimeList al, Anime a
WHERE al.anime_id = a.anime_id
GROUP BY al.anime_id, a.title, al.my_status
HAVING al.my_status = 4
ORDER BY num_of_times_dropped DESC
LIMIT 100