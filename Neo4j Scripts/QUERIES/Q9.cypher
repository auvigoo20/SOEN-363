//9. The percentage of users that are adults.

MATCH (u1:User)
CALL {
    MATCH (u2:User)
    WHERE duration.inDays(date(u2.birth_date), date()).days/365 > 18
    RETURN COUNT(u2) AS adult_count
}
RETURN adult_count*100/COUNT(u1) AS adult_user_percentage
