--1. Get all users who added “One Piece” in their list
SELECT al.username, a.title
FROM AnimeList al
JOIN Anime a ON a.anime_id = al.anime_id
WHERE a.title = 'One Piece'