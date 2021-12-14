//1. Get 500 users who added “One Piece” in their list
MATCH (u:User)-[rel:HAS_IN_LIST]->(a:Anime {title :"One Piece"}) return u, rel, a LIMIT 500