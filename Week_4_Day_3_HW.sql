-- 1. List all customers who live in Texas (use JOINs)

SELECT customer.first_name, customer.last_name, address.district
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE district LIKE 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT customer.first_name, customer.last_name, payment.amount
From payment
JOIN customer
On customer.customer_id = payment.customer_id
Where amount > 6.99 
ORDER BY amount DESC


-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount)
);

-- 4. List all customers that live in Nepal (use the city table)

SELECT customer.first_name, customer.last_name, country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
Join country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- 5. Which staff member had the most transactions?

SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC
LIMIT 1

-- 6. How many movies of each rating are there?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer_id IN (
SELECT customer_id 
FROM payment
GROUP BY customer_id
HAVING COUNT(DISTINCT(amount)) > 6.99
ORDER BY COUNT(DISTINCT(amount))
);

-- 8. How many free rentals did our stores give away?

SELECT customer.first_name, customer.last_name, payment.amount
From payment
JOIN customer
On customer.customer_id = payment.customer_id
Where amount = 0.00