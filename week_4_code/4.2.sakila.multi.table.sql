
# INNER JOIN
/* Intro

	Joins are how a database "joins" or connects tables together.  By default mysql doesn't know that the links between tables are, so you have to.
    To tell mysql how to connect tables you use the ON clause.  It's very similar to the WHERE clause, but instead of filtering a field by a value,
    you filter a field based on a field in another table.
    
	select *
    from film_actor fa
    join actor a 
      on fa.actor_id = a.actor_id

	In this example we start in the film_actor table.  For each row in film_actor, mysql will go to the actor table, and find the row with a matching actor_id.
    
    If NO row is found in actor, mysql will DISCARD the row in film_actor from our result set.  If you don't want it discarded, use a LEFT JOIN (covered later)


    The easiest joins are on ids/keys.  When you join to a table on its key, you know that you're just getting one row returned for each row in your 
    source table.  This is called a 1-1 relationship. 

    
    select *
    from address
    ;
    select * 
    from city;

	select a.*, c.city
    from address a
    join city c 
		on a.city_id = c.city_id
    ;
	# The # of rows of the result set should stay constant in a 1-1 join!
		# if it goes up, the target table has more than 1 row with the value you think is unique
        # if it goes down, there are missing values in the target table
        # both are usually issues either with your understanding of the data, or just the data itself.

    */
    /* Exercises
    
    For every address, join to the city table and print the city name.  The country still isn't in our results though.  
		Join to a third table: county, and include the name in the results as well.
        
	In our system the `customer` table has a store_id on it.  That means that each `customer` can only go to one `store`.
		WILLIE HOWELL has been complaining about service lately.  Find the `store` he goes to, 
        and the `staff` manager we should contact about it.
    
    One of the `rentals` returned sometime on '2005-05-27' was damaged.  
		Find all the customer names who returned a rental on that day
        
    */
    /*
select * 
from film f
;

select * 
from customer c 
JOIN store s 
	on c.store_id = s.store_id
JOIN staff st 
	on s.manager_staff_id = st.staff_id
where c.first_name = 'WILLIE' and c.last_name = 'HOWELL';

select *
from rental
;
*/

# 1-many joins
/* Intro
	
    The table you join to isn't always unique in the field you use for the ON clause, and that's okay.
    
    For eg if you have the film 'AGENT TRUMAN' and want to find the actors in the movie, there will be more than one.

	select f.title, fa.actor_id, a.*
	from film f
	JOIN film_actor fa 
		on f.film_id = fa.film_id
	JOIN actor a 
		on fa.actor_id = a.actor_id
	where f.title = 'AGENT TRUMAN'
	;		(returns 7 rows)
    
    In this query the join to:
		- film_actor is a 1-many join
        - actor is a 1-1 join
        
	The trick is each query can only contain one 1-many join at a time.  Otherwise you end up with a lot of extra rows:
    
    This database doesn't have a meaningful example, but we can join to `film_actor` twice:
    
	select *
	from film f
	JOIN film_actor fa 
		on f.film_id = fa.film_id
	JOIN actor a 
		on fa.actor_id = a.actor_id
		
	JOIN film_actor fa2
		on f.film_id = fa2.film_id
	where f.title = 'AGENT TRUMAN'
	; (returns 49 rows)

*/
/* Exercises

	Write a query to find all the `films` in each `category` using the `film_category` table to make the connection.
		This will require 2 joins.  Which is a 1-many join? Which a 1-1 join?

	Find all the cities in the country 'Austria' in our city.  Is this a 1-1 join or a 1-many?
*/
/*
select *
from category c
join film_category fc 
	on c.category_id = fc.category_id
;

select * 
from country c
join city cty on c.country_id = cty.country_id
where c.country = 'Austria'
;
*/







# LEFT JOIN
	# (RIGHT JOIN)
    # (OUTER JOIN)
/* Intro

	Sometimes data is optional.  In our examples when we join to a table, if there isn't a row in the target table, then nothing is returned at all.
    
    If we want to return the source row regardless, use a LEFT JOIN rather than a normal JOIN.
    
    select *
    from country c
    left join city cty
		on c.country_id = cty.country_id
	left join address a 
		on cty.city_id = a.city_id
        ;
        
    */
/* Exercises

	Find all `addresses` in the `city` of 'LONDON'
		First use a JOIN
        Then use a LEFT JOIN
        
	This example database doesn't have much optional data.  But this probably happens in your databases a lot:
		- If bills are in one table, and payments are in the other, the payment will be optional until is comes in
        - If you have a list of customers and addresses, some of the addresses won't be filled in
        
*/

# SUB QUERY for Aggregation
/*

	I said above that each query can only have one 1-many join.  More technically each subquery can (should) only have one 1-many join.
		If a single query 
	
    This database doesn't have a good example to use here, but pretend that I wanted to get 
    - the count of actors in a film and 
    - the list of actors last names
    AND that data was only availble from different tables.  We'd use sub queryies to do each aggregate separately
*/

select f.film_id, A.actor_count, B.actor_names
    from film f
    left join
    (
		select f.film_id, count(1) as actor_count
        from film f
        left join film_actor fa
			on f.film_id = fa.film_id
		group by f.film_id
    ) A 
		on f.film_id = A.film_id

	left join
    (
		select f.film_id, group_concat(a.last_name) as actor_names
        from film f
        left join film_actor fa
			on f.film_id = fa.film_id
		left join actor a 
			on fa.actor_id = a.actor_id
		group by f.film_id
    ) B
		on f.film_id = B.film_id
;

/* Exercises

	Write a query to return actors.  Use subqueries to also return:
		- how many films they've been in
        - how many actors share the same first name
	Each of the bullet points is best done in a sub query

*/

# CTE: Common Table Expressions
/* Intro

	In the example above there is a fair amount of reused code between the sub queries.  They do the same joins between film and film_actor, 
    and in another query that could be 10 tables joined together.  If your query is that big, and you have 3 subqueries, it gets difficult to keep
    all that code in sync as you make changes.
    
    CTEs allow you to reuse code by defining "common tables" for your query to use.

*/
WITH fa_joined AS (
	select f.film_id, fa.actor_id
	from film f
	left join film_actor fa
		on f.film_id = fa.film_id

)
select f.film_id, A.actor_count, B.actor_names
    from film f
    left join
    (
		select f.film_id, count(1) as actor_count
        from fa_joined f
		group by f.film_id
    ) A 
		on f.film_id = A.film_id

	left join
    (
		select f.film_id, group_concat(a.last_name) as actor_names
        from fa_joined f
		left join actor a 
			on f.actor_id = a.actor_id
		group by f.film_id
    ) B
		on f.film_id = B.film_id
;


# WINDOW FUNCTIONS
/* Intro

	Window functions are the third type of function:
		scalar: works on a single row in the result set to compute a new value
        aggregate: works on a set of input rows to return one row in the result set
	
    A window function works on a set of input rows, like an aggregate.  BUT it doesn't reduce the number of rows returned, like a scalar function.
    
    Work through actor example:
		- total film time
        - total film time by rating
        - compare each length to the previous length
        - change sorting of the result set
        - have different sorting for the "previous length" than the result set
*/

select a.first_name, a.last_name, f.film_id, f.title, f.length
, sum(f.length)
, sum(f.length) OVER() as total_film_time
, f.rating
, sum(f.length) OVER(PARTITION BY f.rating) as total_rating_time
, lag(f.length, 1) OVER (ORDER BY f.film_id) as prev_length
, 1.0 *  f.length - lag(f.length) OVER () as change_in_length
from actor a
inner join film_actor fa
	on a.actor_id = fa.actor_id
inner join film f on fa.film_id = f.film_id
where a.actor_id = 3
group by f.film_id
order by f.length
;

/* Exercises
	
    Query the address table
    - use the functions ST_X() and ST_Y() to get the longitude and latitude out of the `location` field
    - Use min and max functions to find the extents of each city.  
		hint: you can apply functions to functions:   min(ST_X(location))
		the result set should be: [city_id, min_x, max_x, min_y, max_y] with one row per city_id
	- Modify the previous query to show the same city extents, but also return the addresses
		ie the result set should be: [address, address_id, city_id, city_min_x, city_max_x, city_min_y, city_max_y] with one row per address_id
    
    Query the rental table
	- return the list of rentals between '2005-05-01' and '2005-05-31 23:59:59'
    - Add column for the total `count` of rentals during the peiod
    - In each row, return the customer_id who rented a movie immediately before this row (ie sorted by rental_dates)
    - return the entire result set ordered by when the rental was returned
    
*/



select ST_X(location), ST_Y(location)
from address;

select r.*
, count(1) OVER () as total_rental_count
from rental r
where rental_date between '2005-05-01' and '2005-05-31 23:59:59'
order by return_date
;

# VIEWs/PROCS
/* Intro

	So far in databases we haven't really had any way to save our code.  In python we saved .py files and checked them into git.  
    Databases don't have anything so nice.
    
    Views and Stored Procedures are the closest, but there's no built in version control- the database just holds the latest version.
    
    In general I think it's better to store your sql logic in your python code, and run it against the database as needed.
    
    But if you have a query that's shared in a lot of places, and either
    1) won't change... EVER
    2) is conceptually very well defined, so if it does change you're confident that everyone who uses the query will want the new definition.
    
    If you have a query that returns customers and their addresses

*/

select c.customer_id, c.first_name, c.last_name, a.address, ct.city
from customer c
inner join address a 
	on c.address_id = a.address_id
inner join city ct
	on a.city_id = ct.city_id
;
# You can convert it to view with:
   CREATE VIEW v_customer_address AS
    select c.customer_id, c.first_name, c.last_name, a.address, ct.city
	from customer c
	inner join address a 
		on c.address_id = a.address_id
	inner join city ct
		on a.city_id = ct.city_id
	;  
   
select * from v_customer_address;

# BUT, now accounting says MARY SMITH isn't a customer anymore b/c she's behind on a bill and forces you to change the view:
 DROP VIEW v_customer_address;
   CREATE VIEW v_customer_address AS
    select c.customer_id, c.first_name, c.last_name, a.address, ct.city
	from customer c
	inner join address a 
		on c.address_id = a.address_id
	inner join city ct
		on a.city_id = ct.city_id
	where NOT (c.first_name = 'MARY' and c.last_name = 'SMITH')
	;  

# now we're in a position that the logic of the view reflects one department's view of the world
# but other departments may be using the same view
# and ACCOUNTS PAYABLE certainly wants to know about mary
# so just be careful.  This isn't view specific, this is a more general programming principal.




# Most queries SHOULD BE SIMPLE.  don't put CTEs/subqueries in everything
# Start simple, grow as eneded
# D.R.Y.
# K.I.S.S.