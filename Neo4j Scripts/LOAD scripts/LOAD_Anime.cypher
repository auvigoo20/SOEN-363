LOAD CSV WITH HEADERS FROM 'file:///anime_cleaned.csv' AS row
WITH 
toInteger(row.anime_id) AS anime_id,
row.title AS title,
row.title_english AS title_english,
row.title_japanese AS title_japanese,
row.title_synonyms AS title_synonyms,
row.image_url AS image_url,
row.type AS type,
row.source AS source,
toInteger(row.episodes) AS episodes,
row.status AS status,
row.airing AS airing,
row.aired_string AS aired_string,
row.aired AS aired,
row.duration AS duration,
row.rating AS rating,
toFloat(row.score) AS score,
toInteger(row.scored_by) AS scored_by,
toFloat(row.rank) AS rank,
toInteger(row.popularity) AS popularity,
toInteger(row.members) AS members,
toInteger(row.favorites) AS favorites,
row.background AS background,
row.premiered AS premiered,
row.broadcast AS broadcast,
row.related AS related,
row.producer AS producer,
row.licensor AS licensor,
row.studio AS studio,
row.genre AS genre,
row.opening_theme AS opening_theme,
row.ending_theme AS ending_theme,
toFloat(row.duration_min) AS duration_min,
toFloat(row.aired_from_year) AS aired_from_year

MERGE (a:Anime {anime_id: anime_id})
    SET a.title = title,
        a.title_english = title_english,
        a.title_japanese = title_japanese,
        a.title_synonyms = title_synonyms,
        a.image_url = image_url,
        a.type = type,
        a.source = source,
        a.episodes = episodes,
        a.status = status,
        a.airing = airing,
        a.aired_string = aired_string,
        a.aired = aired,
        a.duration = duration,
        a.rating = rating,
        a.score = score,
        a.scored_by = scored_by,
        a.rank = rank,
        a.popularity = popularity,
        a.members = members,
        a.favorites = favorites,
        a.background = background,
        a.premiered =premiered,
        a.broadcast = broadcast,
        a.related = related,
        a.producer = producer,
        a.licensor = licensor,
        a.studio = studio,
        a.genre = genre,
        a.opening_theme = opening_theme,
        a.ending_theme = ending_theme,
        a.duration_min = duration_min,
        a.aired_from_year =aired_from_year


RETURN count(a);






