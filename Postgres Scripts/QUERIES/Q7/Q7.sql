CREATE VIEW number_of_People_by_Gender as
    SELECT gender,count(username) as population
    from users
    GROUP BY gender
    ORDER BY count(username) DESC ;



CREATE  VIEW Gender_Anime_Score as
    SELECT users.gender,Anime.anime_id,Anime.title, sum(my_score) as sumOfVotes,count(AnimeList.username)
        as numberOfVotes, cast(sum(my_score) as decimal)/(count(AnimeList.username)*10) as lovePercentage,
        population, cast(count(AnimeList.username) as decimal)/population as popularityPercentage,
        (cast(count(AnimeList.username) as decimal)/population+cast(sum(my_score) as decimal)/(count(AnimeList.username)*10))/2 as scorePercentage
    FROM animelist,users,anime,number_of_People_by_Gender
    WHERE AnimeList.username = users.username and Anime.anime_id=AnimeList.anime_id
          and Users.gender=number_of_People_by_Gender.gender
    GROUP BY users.gender,Anime.anime_id,population
    ORDER BY population DESC ;



select A.gender,A.title,A.scorePercentage,A.sumOfVotes,A.numberOfVotes,A.population,A.lovePercentage,A.popularityPercentage
from Gender_Anime_Score as A
INNER JOIN
    (SELECT gender,max(scorePercentage) as scorePercentage
     FROM Gender_Anime_Score
     GROUP BY gender  )as B ON A.gender=B.gender and A.scorePercentage=B.scorePercentage
ORDER BY population DESC;




-- Time: 1m 40s 812ms