CREATE VIEW ADULT_Users as
SELECT username,birth_date,((extract(epoch from(current_timestamp-birth_date)))/31556952) as Age
FROM users
GROUP BY username
HAVING ((extract(epoch from(current_timestamp-birth_date)))/31556952)>=18
ORDER BY ((extract(epoch from(current_timestamp-birth_date)))/31556952) ASC ;

CREATE VIEW number_total_User as
SELECT count(username) as total_number_of_users
FROM users;

CREATE VIEW number_Adult_User as
SELECT count(username) as number_of_Adults
FROM ADULT_Users;


SELECT total_number_of_users,
       number_of_Adults,
       cast(number_of_Adults as decimal)/(total_number_of_users) as AdultPercentage
FROM number_total_User,number_Adult_User;




--Time : 750ms
