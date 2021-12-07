# SOEN-363
SOEN-363 Project Phase II

MyAnimeList dataset: https://www.kaggle.com/azathoth42/myanimelist

Data systems:
- PostgreSQL
- Neo4j

The files being used are:
- `anime_cleaned.csv` (6.33 MB)
- `animelists_cleaned.csv` (1.02 GB)
- `users_cleaned.csv` (15.75 MB)


## Import the dataset to PostgreSQL

ERD for the relational model:
<p align="center">
<img src="https://github.com/auvigoo20/SOEN-363/blob/main/Diagrams/MyAnimeList_ERD.png" />
</p>

1. In pgAdmin, create the tables for `Anime`, `Users` and `AnimeList`
2. Download the dataset here: https://www.dropbox.com/sh/odgx8qew37st1sb/AAD0-8OxngY6YXAtmUIrlDt5a?dl=0 
3. Directly import the data from `anime_cleaned.csv` into the `Anime` table and `users_cleaned.csv` into the `Users` table. Ensure that in the import options on pgAdmin, the escape character is `"`
4. Since `animelists_cleaned.csv` is too large to be directly imported into pgAdmin, it has been split into three separate [files](https://www.dropbox.com/s/e7zh0w7cuuwoadl/animelists_cleaned_split.zip?dl=0):
      * `animelists_cleaned_0.csv`
      * `animelists_cleaned_1.csv`
      * `animelists_cleaned_2.csv`
<br/>Import these three files into the `AnimeList` table separately. Ensure that in the import options on pgAdmin, the escape character is `"`

