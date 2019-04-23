USE sakila;

SELECT * FROM actor;

SELECT first_name, last_name
FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS Actor_Name 
FROM actor;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

SELECT last_name
FROM actor
WHERE last_name LIKE '%gen%';

SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%li%';

SELECT * FROM country;

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
ADD COLUMN description BLOB;

ALTER TABLE actor
DROP COLUMN description;

SELECT last_name, COUNT(*) AS Actors_Count
FROM actor GROUP BY last_name;

SELECT last_name, COUNT(*) AS Actors_Count
FROM actor GROUP BY last_name HAVING COUNT(*) >= 2;

UPDATE actor
SET first_name = "Harpo"
WHERE first_name = "Groucho" AND last_name = "Williams";

UPDATE actor
SET first_name = "Groucho" 
WHERE first_name = "Harpo";

DESCRIBE sakila.address;

SELECT * FROM staff;
SELECT * FROM address;

SELECT first_name, last_name, address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

SELECT * FROM payment;

SELECT p.staff_id, s.first_name, s.last_name, p.amount, p.payment_date
FROM staff s INNER JOIN payment p ON
s.staff_id = p.staff_id AND payment_date LIKE '2005-08%'; 

SELECT * FROM film_actor;
SELECT * FROM film;

SELECT f.title, COUNT(fa.actor_id)
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY f.title;

SELECT COUNT(title)
FROM 

