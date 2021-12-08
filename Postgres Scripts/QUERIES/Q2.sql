--2. Get the number of users per gender
SELECT u.gender, COUNT(*) num_of_users
FROM Users u
GROUP BY u.gender