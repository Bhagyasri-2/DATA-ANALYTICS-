-- List the first name and last name of all customers
select first_name,last_name from customer;
-- . Find all the movies that are currently rented out.
select film.title from rental r
join inventory i on r.inventory_id=i.inventory_id
join film on i.film_id=film.film_id
where r.return_date is null;
--  Show the titles of all movies in the 'Action' category
select film.title from film 
join film_category fc on film.film_id=fc.film_id 
join category c on c.category_id=fc.category_id 
where c.name='Action';
-- Count the number of films in each category
select c.name,count(fc.film_id) from film_category fc join category c on fc.category_id=c.category_id group by c.name;
-- What is the total amount spent by each customer
select c.first_name,c.last_name,c.customer_id,sum(p.amount) from customer c join payment p on c.customer_id=p.customer_id group by c.customer_id,c.first_name,c.last_name; 
-- Find the top 5 customers who spent the most
select c.customer_id,sum(p.amount) as total_revenue from customer c join payment p on c.customer_id=p.customer_id group by c.customer_id order by total_revenue desc limit 5 ;
-- Display the rental date and return date for each rental
select rental_date,return_date,rental_id from rental;
-- List the names of staff members and the stores they manage.
select s.first_name,s.last_name from staff s join store st on s.staff_id=st.manager_staff_id;
-- Find all customers living in 'California'.
select c.first_name,c.last_name from customer c join address a on c.address_id=a.address_id where district='California';
--  Count how many customers are from each city.
select ci.city,count(c.customer_id) as customer_count from customer c join address a on c.address_id=a.address_id join city ci on a.city_id=ci.city_id group by ci.city;
-- Find the film(s) with the longest duration.
select title,rental_duration from film where rental_duration =(select max(rental_duration) from film);
-- . Find the number of rentals made each month
select to_char(rental_date,'mm') as rental_month,count(*) as rental_count from rental group by rental_month ;
--  Show all payments made by customer 'Mary Smith'
select amount,payment_date,payment_id from payment join customer c on payment.customer_id=c.customer_id where c.first_name='Mary' and c.last_name='Smith';
-- List all films that have never been rented
select f.title from film f left join inventory i on f.film_id = i.film_id left join rental r on i.inventory_id = r.inventory_id where r.rental_id is null;
--  What is the average rental duration per category
select avg(rental_duration)as avg_duration,c.name from category c join film_category fc on c.category_id=fc.category_id join film f on fc.film_id=f.film_id group by c.name ;
-- Which films were rented more than 50 times
select f.title,count(r.rental_id) as rental_count from  film f join inventory i ON f.film_id = i.film_id join rental r on i.inventory_id = r.inventory_id group by f.title having count(r.rental_id)>50 order by rental_count asc;
-- List all employees hired after the year 2005.
select staff_id,first_name,last_name from staff where last_update >'2005-12-31';
-- Show the number of rentals processed by each staff member
select s.first_name,s.last_name,count(r.rental_id) as rental_count from staff s join rental r on s.staff_id=r.staff_id group by s.staff_id,s.first_name,s.last_name order by rental_count desc; 
--  Display all customers who have not made any payments.
select c.customer_id,c.first_name,c.last_name from customer c left join payment p ON c.customer_id = p.customer_id where p.payment_id is null;
-- What is the most popular film (rented the most)
select f.title,count(r.rental_id) as rental_count from film f join inventory i on f.film_id=i.film_id join rental r on i.inventory_id=r.inventory_id group by f.film_id,f.title order by rental_count desc limit 1;
-- Show all films longer than 2 hours.
select title,length from film where length>120;
--  Find all rentals that were returned late
select r.rental_id,f.title from rental r join inventory i on r.inventory_id=i.inventory_id join film f on i.film_id=f.film_id where r.return_date>r.rental_date+(f.rental_duration || 'days')::INTERVAL;
--  List customers and the number of films they rented
select c.customer_id, c.first_name, c.last_name,count(r.rental_id) as total_rentals from customer c join rental r on c.customer_id=r.customer_id group by c.customer_id,c.first_name, c.last_name order by total_rentals desc;
--  Write a query to show top 3 rented film categories
select c.name as category,count(r.rental_id) as rental_count from rental r join inventory i ON r.inventory_id = i.inventory_id join film f ON i.film_id = f.film_id join film_category fc on f.film_id = fc.film_id join category c on fc.category_id = c.category_id group by c.name order by rental_count DESC limit 3;
--  Create a view that shows all customer names and their payment totals.
create view customer_payment_totals as select c.customer_id,c.first_name,c.last_name,sum(p.amount) as total_payment from customer c join payment p on c.customer_id=p.customer_id group by c.customer_id,c.first_name,c.last_name;
-- Update a customer's email address given their ID.
update customer set email='jared514@gmail.com' where customer_id=1;
--  Insert a new actor into the actor table.
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Emma', 'Stone', NOW());
--  Delete all records from the rentals table where return_date is NULL.
delete from rental where return_date is null;
--  Add a new column 'age' to the customer table.
alter table customer add column age int;
--  Create an index on the 'title' column of the film table.
create index idx_film_title on film(title);
--  Find the total revenue generated by each store.
select  s.store_id,sum(p.amount) as total_revenue from  payment p join  staff st ON p.staff_id = st.staff_id join store s ON st.store_id = s.store_id group by s.store_id order by total_revenue DESC;
--  What is the city with the highest number of rentals? 
select ci.city,count(r.rental_id) as rental_count from rental r join customer c ON r.customer_id = c.customer_id join  address a ON c.address_id = a.address_id join city ci on a.city_id = ci.city_id group by ci.city order by rental_count DESC LIMIT 1;
-- How many films belong to more than one category?
select count(*) as film_count from (select film_id from film_category group by film_id having count(category_id)>1) as multi_cat_films;
--  List the top 10 actors by number of films they appeared in
select a.actor_id,a.first_name,a.last_name,COUNT(fa.film_id) AS film_count FROM  actor a JOIN film_actor fa ON a.actor_id = fa.actor_id GROUP BY a.actor_id, a.first_name, a.last_name ORDER BY  film_count DESC LIMIT 10;
-- Retrieve the email addresses of customers who rented 'Matrix Revolutions'
SELECT DISTINCT c.email FROM customer c JOIN rental r ON c.customer_id = r.customer_id JOIN  inventory i ON r.inventory_id = i.inventory_id JOIN  film f ON i.film_id = f.film_id WHERE  f.title = 'Matrix Revolutions';
--  Create a stored function to return customer payment total given their ID
CREATE OR REPLACE FUNCTION get_customer_payment_total(cust_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(amount)
    INTO total
    FROM payment
    WHERE customer_id = cust_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;


--. Begin a transaction that updates stock and inserts a rental record.
BEGIN;

UPDATE inventory
SET last_update = CURRENT_TIMESTAMP
WHERE inventory_id = 1;

INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (CURRENT_TIMESTAMP, 1, 1, NULL, 1, CURRENT_TIMESTAMP);

COMMIT;

-- Show the customers who rented films in both 'Action' and 'Comedy' categories
SELECT r.customer_id
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Action', 'Comedy')
GROUP BY r.customer_id
HAVING COUNT(DISTINCT c.name) = 2;
--. Find actors who have never acted in a film.
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;













