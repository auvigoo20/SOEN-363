CREATE VIEW number_of_People_by_location as
    SELECT location,count(username) as population
    from users
    GROUP BY location
    ORDER BY count(username) DESC ;

CREATE  VIEW Location_Anime_Score as
    SELECT users.location,Anime.anime_id,Anime.title, sum(my_score) as sumOfVotes,count(AnimeList.username)
        as numberOfVotes, cast(sum(my_score) as decimal)/(count(AnimeList.username)*10) as lovePercentage,
        population, cast(count(AnimeList.username) as decimal)/population as popularityPercentage,
        (cast(count(AnimeList.username) as decimal)/population+cast(sum(my_score) as decimal)/(count(AnimeList.username)*10))/2 as scorePercentage
    FROM animelist,users,anime,number_of_People_by_location
    WHERE AnimeList.username = users.username and Anime.anime_id=AnimeList.anime_id
          and Users.location=number_of_People_by_location.location
    GROUP BY users.location,Anime.anime_id,population
    ORDER BY population DESC ;




select A.location,A.title,A.scorePercentage,A.sumOfVotes,A.numberOfVotes,A.population,A.lovePercentage,A.popularityPercentage
from Location_Anime_Score as A
INNER JOIN
    (SELECT location,max(scorePercentage) as scorePercentage
     FROM Location_Anime_Score
     GROUP BY location  )as B ON A.location=B.location and A.scorePercentage=B.scorePercentage
ORDER BY population DESC;





--Time: 4m, 35s, 42ms
