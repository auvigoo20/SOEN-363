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

1. In pgAdmin, create the tables for `Anime`, `Users` and `AnimeList` using the `CREATE` scripts [here](https://github.com/auvigoo20/SOEN-363/tree/main/Postgres%20Scripts)
2. Download the dataset [here](https://www.dropbox.com/sh/odgx8qew37st1sb/AAD0-8OxngY6YXAtmUIrlDt5a?dl=0) 
3. Run the `INSERT` [scripts](https://github.com/auvigoo20/SOEN-363/tree/main/Postgres%20Scripts) to insert the data into the `Anime` and `Users` tables
4. Since `animelists_cleaned.csv` is too large to be directly imported into pgAdmin, it has been split into three separate [files](https://www.dropbox.com/s/e7zh0w7cuuwoadl/animelists_cleaned_split.zip?dl=0):
      * `animelists_cleaned_0.csv`
      * `animelists_cleaned_1.csv`
      * `animelists_cleaned_2.csv`
<br/>Import these three files into the `AnimeList` table separately. Ensure that in the import options on pgAdmin, the escape character is `"`

## Import the dataset to Neo4j

Data model for Neo4j:
<p align="center">
<img src="https://github.com/auvigoo20/SOEN-363/blob/main/Diagrams/MyAnimeList_neo4j.png" />
</p>

1. In Neo4j, create the indexes for `Anime` and `User` by running the `CREATE CONSTRAINT` [scripts](https://github.com/auvigoo20/SOEN-363/tree/main/Neo4j%20Scripts)
2. Download the dataset [here](https://www.dropbox.com/sh/odgx8qew37st1sb/AAD0-8OxngY6YXAtmUIrlDt5a?dl=0) 
3. Import the dataset into the DBMS
4. Run the `LOAD` [scripts](https://github.com/auvigoo20/SOEN-363/tree/main/Neo4j%20Scripts) for `Anime` and `User` to create the nodes. Ensure that the directory specified here    is correct with the proper path and file name
```
LOAD CSV WITH HEADERS FROM 'file:///anime_cleaned.csv' AS row
```
5. If possible, set the DBMS settings to close values to this for acceptable performance:
```
dbms.memory.heap.initial_size=1G
dbms.memory.heap.max_size=4G
dbms.memory.pagecache.size=512m
```
6. The previously split animelists `.csv` files have been manually modified and fixed due to the inability to specify escape characters in Neo4j, which caused importing problems. Use the [modified files](https://www.dropbox.com/s/jhz7c3gauo6vv57/animelists_cleaned_split_neo4j_fixed.zip?dl=0) for importing
7. Run the `LOAD` [script](https://github.com/auvigoo20/SOEN-363/blob/main/Neo4j%20Scripts/LOAD_HAS_IN_LIST.cypher) to create the `HAS_IN_LIST` relationships between the `Anime` and `Users`. This has to be repeated three times, for each animelists file. Ensure that the directory specified here is correct with the proper path and file name
```
:auto USING PERIODIC COMMIT 100000
LOAD CSV WITH HEADERS FROM 'file:///animelists_cleaned_split/animelists_cleaned_2.csv' AS row
```
