use sakila;

select * from film;

SELECT c.name AS category,
       COUNT(f.film_id) AS number_of_films
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT s.store_id,
       a.city_id, -- Corrigido para city_id
       co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
LIMIT 0, 1000;

SELECT s.store_id,
       SUM(p.amount) AS total_revenue
FROM store s
JOIN staff st ON s.manager_staff_id = st.staff_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

SELECT c.name AS category,
       AVG(f.length) AS average_running_time
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT c.name AS category,
       AVG(f.length) AS average_running_time
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY average_running_time DESC;

SELECT f.title,
       COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

SELECT 
    CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END AS can_rent
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN store s ON i.store_id = s.store_id
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1;