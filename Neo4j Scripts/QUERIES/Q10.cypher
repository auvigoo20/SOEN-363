//10. How many times more likely is a user going to complete the Naruto series rather than dropping it?
CALL {
    MATCH (u1:User)-[r1:HAS_IN_LIST]->(a1:Anime)
    WHERE (a1.title = "Naruto: Shippuuden" OR a1.title = "Naruto") AND r1.my_status = 2
    RETURN COUNT(r1) AS complete_count  
}
CALL {
    MATCH (u2:User)-[r2:HAS_IN_LIST]->(a2:Anime)
    WHERE (a2.title = "Naruto: Shippuuden" OR a2.title = "Naruto") AND r2.my_status = 4
    RETURN COUNT(r2) AS incomplete_count  
}
RETURN complete_count/incomplete_count AS times_more_likely
