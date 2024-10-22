-- 1. Using COUNT, get the number of cities in the USA.
SELECT COUNT(ID)
FROM city
WHERE countrycode = "USA";

-- 2. Find out the population and life expectancy for people in Argentina.
SELECT lifeexpectancy, population
FROM country
WHERE name = "argentina";

-- 3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy is NOT NULL 
ORDER BY lifeexpectancy DESC
LIMIT 1;