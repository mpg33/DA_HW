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

SELECT title, (
SELECT COUNT(*) FROM inventory
WHERE film.film_id = inventory.film_id)
FROM film
WHERE title = "Hunchback Impossible";

SELECT * FROM customer;

SELECT c.last_name, SUM(p.amount) 
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.last_name;

SELECT * FROM film_actor;

SELECT title
FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%'
AND title IN (
SELECT title
FROM film
WHERE language_id = 1);

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
SELECT actor_id
FROM film_actor
WHERE film_id IN(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'));

SELECT * FROM city;

SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
JOIN address a
ON (cu.address_id = a.address_id)
JOIN city ct
ON (ct.city_id = a.city_id)
JOIN country co
ON (co.country_id = ct.country_id)
WHERE co.country = 'Canada'
;

SELECT * FROM film_category;

SELECT title, description 
FROM film
WHERE film_id IN (
SELECT film_id FROM film_category
WHERE category_id IN (
SELECT category_id FROM category
WHERE name = 'Family'))
;

SELECT * FROM rental;

SELECT f.title, COUNT(rental_id) 
FROM rental r
JOIN inventory i
ON (r.inventory_id = i.inventory_id)
JOIN film f
ON (i.film_id = f.film_id)
GROUP BY f.title
ORDER BY 'Times Rented' DESC
;




