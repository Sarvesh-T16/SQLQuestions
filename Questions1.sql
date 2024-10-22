-- 1. List all actors.
SELECT * FROM actor;

-- 2. Find the surname of the actor with the forename 'John'.
SELECT last_name
FROM actor
WHERE first_name = "John";

-- 3. Find all actors with surname 'Neeson'.
SELECT *
FROM actor
WHERE last_name = "Neeson";

-- 4. Find all actors with ID numbers divisible by 10.
SELECT * 
FROM actor 
WHERE actor_id % 10 = 0;

-- 5. What is the description of the movie with an ID of 100?
SELECT description
FROM film
WHERE film_id = 100;

-- 6. Find every R-rated movie.
SELECT *
FROM film 
WHERE rating = "R";

-- 7. Find every non-R-rated movie.
SELECT * 
FROM film 
WHERE rating != "R";

-- 8. Find the ten shortest movies.
SELECT * 
FROM film 
ORDER BY length
LIMIT 10;

-- 9. Find the movies with the longest runtime, without using LIMIT.
SELECT * 
FROM film 
WHERE length = (SELECT MAX(length) FROM film);

-- 10. Find all movies that have deleted scenes.
SELECT *
FROM film
WHERE special_features LIKE "%Deleted Scenes%";

-- 11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT COUNT(last_name), last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1
ORDER BY last_name DESC;

-- 12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY COUNT(last_name) DESC;

-- 13. Which actor has appeared in the most films?
SELECT * 
FROM actor
WHERE actor_id = (SELECT actor_id 
					FROM film_actor 
					GROUP BY actor_id 
                    ORDER BY COUNT(actor_id) DESC 
                    LIMIT 1);
                    
-- 14. When is 'Academy Dinosaur' due?
SELECT release_year 
FROM film 
WHERE title = "Academy Dinosaur";

-- 15. What is the average runtime of all films?
SELECT AVG(length)
FROM film;

-- 16. List the average runtime for every film category.
SELECT name, AVGlength
FROM film_category
INNER JOIN film on film_category.film_id = film.film_id
INNER JOIN category on film_category.category_id = category.category_id
GROUP BY category.category_id;

-- 17. List all movies featuring a robot.
SELECT *


