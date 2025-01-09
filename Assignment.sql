create database Assignment;
use Assignment;
#Q1.  Create a table called employees with the following structure.
create table employees
(emp_id int primary key,
emp_name text not null,
age int check(age>=18),
email varchar(100) unique, 
salary decimal default(30000));

#Q2. Explain the purpose of constraints and how they help maintain data integrity in a database. provid examples of common types of constraints. 
# Ans - Constraints are some condition or rule given to Table.
# It prevent from invalid data. exapmple -  negative salary is not added.
# It maintain consistency.
# examples of constraint are - unique, not null, default, check, primary key and foriegn key.

#Q3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer. 
# Ans - We apply not null constraint to a column so that our column does not contain any null or empty value.
# example employee_id can't be null, therefore we apply not null constaint.
# Primary key cannot contain null value because it must uniquely identify each row and null can't be used for uniquness.

#Q4.  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint. 
# Ans - Alter add and Alter drop is used for adding and removing constraints for an existing table. example for unique constraint:-
create table xyz
(id int,
students_name varchar(50));
insert into xyz values(1,"Vipin"),(2,"Neha"),(3,"Rishi"),(4,"Vivan"),(5,"Bharti");
Alter table xyz add constraint unique_id unique(id);
Alter table xyz drop index unique_id;

#Q5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
#Provide an example of an error message that might occur when violating a constraint.
#Ans - When we try to insert, update or delete in database against constraint rule it stop action and show an error. example:-
Insert into employees values(1,"Riya",20,"riya@gmail.com",25000),(2,"Vivan",26,"vivan@gmail.ccom",13000);
Insert into employees values(3,"rishi",17,"rishi@gmail.com",13000);
#here it is violiting check condition in age column giving error -- Error Code: 3819. Check constraint 'employees_chk_1' is violated.

#Q6. You created a products table without constraints as follows.
# Now you realise that he product_id should be a primary keyQ and The price should have a default value of 50.00.
drop table products;
Create table Products
(product_id INT,
product_name varchar(50),
price decimal(10,2));
Alter table products add primary key(product_id);
Alter table products change column price price decimal(10,2) default(50.00);

#Q7. Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
create table Students   
(student_id int,Student_name varchar(50),class_id int);
Insert into Students values (1, "Alice", 101),(2,"Bob",102),(3,"charlie",101);
create table Classes
(Class_id int, class_name varchar(50));
insert into Classes values (101,"Math"),(102,"Science"),(103,"History");
Select Student_name, class_name from Students inner join Classes
on Students.class_id=Classes.class_id;

#Q8. Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
#listed even if they are not associated with an order.
drop table orders;
create table orders (order_id int, order_date varchar(50), customer_id int);
insert into orders values(1,"2024-01-01",101),(2,"2024-01-03",102);
drop table customers;
create table customers (customer_id int, customer_name varchar(50));
insert into customers values(101,"Alice"),(102,"Bob");
create table product (product_id int, product_name varchar(50), order_id int);
insert into product values(1,"Laptop", 1);
insert into product (product_id, product_name) values(2,"Phone");
Select orders.order_id, customer_name,product_name from orders inner join customers
on orders.customer_id=customers.customer_id right join product on orders.order_id=product.order_id;

#Q9. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
Create table Sales (sale_id int, product_id int, amount int);
insert into Sales values( 1,101,500),(2,102,300),(3,101,700);
drop table products;
create table products(product_id int, product_name varchar(50));
insert into products values(101,"Laptop"),(102,"Phone");
select Sales.product_id, product_name, sum(amount) as total_amount from Sales inner join Products on
Sales.product_id=Products.product_id group by Sales.product_id;

#Q10. Write a query to display the order_id, customer_name, and the quantity of products ordered by each
#customer using an INNER JOIN between all three tables.
drop table orders;
create table orders(order_id int, order_date varchar(50), customer_id int);
insert into orders values(1,"2024-01-02",1),(2,"2024-01-05",2);
drop table customers;
create table customers (customer_id int, customer_name varchar(50));
insert into customers values(1,"Alice"),(2,"Bob");
create table order_details (order_id int, product_id int, quantity int);
insert into order_details values(1,101,2),(1,102,1),(2,101,3);
select o.order_id, customer_name,sum(quantity) as total_quantity from orders o inner join
customers c on o.customer_id=c.customer_id inner join order_details od 
on o.order_id=od.order_id group by o.order_id;

##SQL COMMANDS
use mavenmovies;
#Q1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
#Primary keys -  used to uniquely identify rows in table. example - actor_id, address_id,advisory_id, etc.
#Foriegn keys - create relationship between tables. example -  movie_id, actor_id, etc.

#Q2.List all details of actors.
select*from actor;
#Q3.List all customer information from DB. 
select * from customer;
#Q4. List different countries.
select distinct country from country;
#Q5. Display all active customers
select first_name, last_name from customer where active = 1;
#Q6.List of all rental IDs for customer with ID 1.
select rental_id from rental where customer_id=1;
#Q7. Display all the films whose rental duration is greater than 5 .
select film_id, title from film where rental_duration>5;
#Q8. List the total number of films whose replacement cost is greater than $15 and less than $20.
select count(title) as total_film from film where replacement_cost between 15 and 20;
#Q9.Display the count of unique first names of actors.
select count(distinct first_name) from actor;
#Q10. Display the first 10 records from the customer table.
select * from customer limit 10;
#Q11. Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer where first_name like "b%" order by first_name limit 3;
#Q12. Display the names of the first 5 movies which are rated as ‘G’.
select title from film where rating = "G" order by title limit 5 ;
#Q13. Find all customers whose first name starts with "a".
select first_name, last_name from customer where first_name like "a%";
#Q14. Find all customers whose first name ends with "a".
select first_name, last_name from customer where first_name like "%a";
#Q15. Display the list of first 4 cities which start and end with ‘a’.
select city from city where city like "a%a" order by city limit 4; 
#Q16. Find all customers whose first name have "NI" in any position. 
select first_name from customer where first_name like "%NI%";
#Q17.  Find all customers whose first name have "r" in the second position.
select first_name from customer where first_name like "_r%";
#Q18. Find all customers whose first name starts with "a" and are at least 5 characters in length. 
select first_name, last_name from customer where first_name like "a____%";
#Q19.  Find all customers whose first name starts with "a" and ends with "o".
select first_name from customer where first_name like "a%o";
#20. Get the films with pg and pg-13 rating using IN operator.
select film_id,title from film where rating in("PG", "PG-13");
#21.  Get the films with length between 50 to 100 using between operator.
select film_id, title from film where length between 50 and 100;
#22. Get the top 50 actors using limit operator.
select actor_id, first_name,last_name from actor limit 50;
#23. - Get the distinct film ids from inventory table.
select distinct film_id from inventory; 

##FUNCTIONS
#Q1. Retrieve the total number of rentals made in the Sakila database.
SELECT count(customer_id) as total_rental from rental;
#Q2. Find the average rental duration (in days) of movies rented from the Sakila database.
select  round(avg(datediff(return_date,rental_date)),2) as avg_duration from rental;
#Q3. Display the first name and last name of customers in uppercase.
select upper(first_name) as first_name, upper(last_name) as last_name from customer;
#Q4. Extract the month from the rental date and display it alongside the rental ID.
select rental_id, month(rental_date) as month from rental;
#Q5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
select customer_id, count(customer_id) as count_of_rentals from rental group by customer_id;
#Q6. Find the total revenue generated by each store.
select s.store_id,sum(p.amount) as total_revenue from store s join inventory i on
s.store_id=i.store_id join rental r on i.inventory_id=r.inventory_id join payment p
on r.rental_id=p.rental_id group by s.store_id;
#Q7.Determine the total number of rentals for each category of movies.
select c.name as category_name, count(r.rental_id) as total_rentals from category c join
film_category fc on c.category_id=fc.category_id join inventory i on fc.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id group by c.category_id;
#Q8.Find the average rental rate of movies in each language.
select name as movie_language, avg(rental_rate) as avg_rental from language 
join film on language.language_id=film.language_id group by movie_language;

#JOINS
#Q9Display the title of the movie, customer s first name, and last name who rented it.
SELECT f.title AS movie_title, c.first_name AS customer_first_name, c.last_name AS customer_last_name
FROM rental r JOIN  inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;
#Q10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind.
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';
#Q11. Retrieve the customer names along with the total amount they've spent on rentals.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id;
#Q12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title
ORDER BY c.first_name, c.last_name, f.title;
#Q13. Display the top 5 rented movies along with the number of times they've been rented.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;
#Q14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
SELECT c.first_name, c.last_name, c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

#WINDOWS FUNCTION
#Q1. Rank the customers based on the total amount they've spent on rentals
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_spent,
    DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank_
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
JOIN 
    rental r ON p.rental_id = r.rental_id
GROUP BY 
    c.customer_id ORDER BY 
    total_spent DESC;
#Q2.Calculate the cumulative revenue generated by each film over time.
WITH CumulativeRevenue AS (
    SELECT 
        f.title,
        p.payment_date,
        SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
)
SELECT DISTINCT title, payment_date, cumulative_revenue
FROM CumulativeRevenue
ORDER BY title, payment_date;
#Q3. Determine the average rental duration for each film, considering films with similar lengths.
select title, length(title) as length , avg(rental_duration) as avg_duration from film group by length(title);
#Q4. Identify the top 3 films in each category based on their rental counts.
SELECT 
    c.name,
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM 
    category c
JOIN 
    film f ON c.category_id = f.category_id
JOIN 
    rental r ON f.film_id = r.film_id
GROUP BY 
    c.name, f.title
ORDER BY 
    c.name, rental_count DESC
LIMIT 3;
#Q5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.  
WITH CustomerRentalCounts AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(r.rental_id) AS total_rentals
    FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
),
AverageRental AS (
    SELECT AVG(total_rentals) AS avg_rentals FROM CustomerRentalCounts
)
SELECT 
    crc.customer_id,
    crc.customer_name,
    crc.total_rentals,
    ROUND(crc.total_rentals - ar.avg_rentals, 2) AS rental_difference
FROM CustomerRentalCounts crc, AverageRental ar
ORDER BY rental_difference DESC;

#Q6. Find the monthly revenue trend for the entire rental store over time.
SELECT 
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month, 
    SUM(amount) AS total_revenue
FROM 
    rental r
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    rental_month
ORDER BY 
    rental_month;
#Q8. Calculate the running total of rentals per category, ordered by rental count.
SELECT 
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (ORDER BY COUNT(r.rental_id) DESC) AS running_total
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    c.name
ORDER BY 
    rental_count DESC;
#10. Identify the top 5 months with the highest revenue and display the revenue generated in each month. 
select month(payment_date) as month,sum(amount) as total_revenue from payment group by month
order by total_revenue desc limit 5;
select * from film;

#Normalisation and CTE
#Q1. First Normal Form (1NF):
#Ans - The address table contain multiple phone number in a single cell it violets 1NF.
#To normalize: - split the phone numbers into seperate rows or columns.

#Q2.  Second Normal Form (2NF):
#Ans - film_actor has actor_id and film_id as a composite key. 
#If it has attributes like actor_age, these depend only on actor_id and violate 2NF 
#Normalization steps:
#Move the partial dependency (actor_age) to a separate table.
#Ensure all non-prime attributes depend on the whole key

#Q3.Third Normal Form (3NF)
#Ans -  In rental, if city_name depends on address_id (and not on rental_id), it violates 3NF.
#Normalization Steps:
#Create a city table for city data.
#Link it to the address table via city_id

#Q4.Normalization Process:
#Ans - Normalize the customer table if it has multiple emails in one row.
#Steps:-
#1.Split repeating attributes into separate rows in a new table.
#2.Ensure the primary key in the new table relates back to the original table.

#Q5. CTE Basics:
WITH ActorFilmCount AS (
    SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)
SELECT first_name, last_name, film_count FROM ActorFilmCount;

#Q6. CTE with Joins:
WITH FilmLanguage AS (
    SELECT f.title, l.name AS language_name, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM FilmLanguage;

#Q7. CTE for Aggregation:
WITH CustomerRevenue AS (
    SELECT customer_id, SUM(amount) AS total_revenue
    FROM payment
    GROUP BY customer_id
)
SELECT c.customer_id, c.first_name, c.last_name, cr.total_revenue
FROM customer c
JOIN CustomerRevenue cr ON c.customer_id = cr.customer_id;

#Q8. CTE with Window Functions:
WITH RankedFilms AS (
    SELECT 
        title, 
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS rank_
    FROM film
)
SELECT * FROM RankedFilms;

#Q9.  CTE and Filtering:
WITH FrequentRenters AS (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 2
)
SELECT c.*
FROM customer c
JOIN FrequentRenters fr ON c.customer_id = fr.customer_id;

#Q10.  CTE for Date Calculations:
WITH MonthlyRentals AS (
    SELECT DATE_FORMAT(rental_date, '%Y-%m') AS rental_month, COUNT(*) AS total_rentals
    FROM rental
    GROUP BY rental_month
)
SELECT * FROM MonthlyRentals;

#Q12.CTE and Self-Join:
WITH ActorPairs AS (
    SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
)
SELECT a1.first_name AS actor1_first_name, a1.last_name AS actor1_last_name,
       a2.first_name AS actor2_first_name, a2.last_name AS actor2_last_name
FROM ActorPairs ap
JOIN actor a1 ON ap.actor1 = a1.actor_id
JOIN actor a2 ON ap.actor2 = a2.actor_id;








