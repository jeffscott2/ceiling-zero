
/*
Mon) # Single Table Queries
Tue) # Multi Table Queries
Wed) # Setting up a local DB, more practice
*/


# = 
/* Intro

	The equals sign is primarily used in the WHERE clause to filter the returned rows to those with a specific value in a field:
    
	select * 
    from actor 
    where first_name = 'ED'
    ;
*/
/* 
		What is the film_id of the movie 'Slums Duck'?
    
	   What is the film_id of the movie 'MALLRATS UNITED'?
       
       Make a list of films with a length of 150
*/
/*
select * 
from film
where title = 'SLUMS DUCK'			# not case sensitive
;

select * 
from film
;

	
    
    */
	



# Between
/* Intro

	The BETWEEN keyword is like the equals sign, but it allows filtering on any value "between" the two reference values you use.
    
    select *
    from actor
    where first_name BETWEEN 'ED' and 'G'
    ;
    
    The results will include rows that are equal to 'ED' and 'G'
*/
/* 
    How many films were released between 2007 and 2009? (including all of 2007 and all of 2009 => "inclusive")
    
    How many rentals were made between 2006-02-01 and 2006-02-15?
    
	We got a waterlogged bill from our movie provider that charged us "$29.XX" for a movie and we can't read the cents. 
    Get a list of all the movies with a replacement cost that would match 29.XX

*/
/*
select *
from rental
where rental_date between '2006-02-01' and '2006-02-15'
; 

select * from film where replacement_cost between 28 and 29;

*/


# <, >, <=, >=
/* Intro

	Like the equals sign, there are the normal math operators available: less_than < , greater_than > , less_than_or_equal <= , greater_than_or_equal >=
    
    select * 
	from actor
	where first_name <= 'ANGELINA'  # INCLUDES ANGELINA
	;

	select * 
	from actor
	where first_name < 'ANGELINA'	# EXCLUDES ANGELINA
	;
*/
/* 
	Find all the films with a replacement_cost less than 10 dollars (NOT including 30 dollars, ie "exclusive")

	Find all the films with a rental_duration equal to or greater than 6 days

*/
/*
	select * 
	from film
	where replacement_cost < 10
	;

	select * 
	from film
	where rental_duration >= 6
	;
*/

# IN
/* Intro

	The IN function is like equality, but allows specifying multiple values
    
    select *
    from actor
    where first_name in ('ANGELINA','ED')
    ;
*/
/* 
    Get a list of films with a rental_duration of 3 or 5 days
    
	How many actors were in either the films 'ALONE TRIP' or 'FALCON VOLUME'

    How many films have a category of either 'Animation' or 'Children'?
*/
/*
	select * 
	from film 
	where rental_duration in (3,5);


	select * 
	from film
	where title = 'ALONE TRIP'
    where title = 'FALCON VOLUME'

	select * 
	from film
	where film_id in (17, 300)
;
    
	select *  from category;

	select *			 # What about films that are in multiple categories? they'll be two rows in this result set
	from film_category 
	where category_id in (2, 3)
	;

;
*/

# Not In, <>
/* Intro

	The NOT IN function and inequality operator act a lot like the IN and equals sign, but instead we return all the rows BUT the ones that match.
    
    select *
    from actor
    where first_name NOT IN ('ANGELINA','ED')
    ;

	select *
    from film
    where rental_rate <> 4.99
    ;
*/
/*  
    Get a list of films with a rental_duration of anything BUT 3 or 5 days

    Get all the films with a replacement_cost that isn't 9.99, 19.99, or 29.99
    
    How many films do we have to rent that aren't in english?
*/
/*

	select * 
	from film 
	where rental_duration NOT in (3,5);


	select * 
	from language;

	select * 
	from film 
	where language_id <> 1
	;

*/

# LIKE
/* Intro

	LIKE is another operator similar to the equals sign but it operates on string only.

	select *
    from actor
    where first_name LIKE 'ED'
    ;
    
    The above query is the same as using an equals sign.
    
    What the LIKE operator lets us do is include a special character in the string that says: This matches anything.

	select *
    from actor
    where first_name LIKE 'E%'		# will return all rows that start with the letter E
    ;
   
	select *
    from actor
    where first_name LIKE '%ED%'		# will find all names that have the letters ED in them in any place
    ;
*/
/* 
	Make a list of the films whose rating begins with 'PG' (ie including 'PG' and 'PG-13')
    
	How many films have the word 'zero' in the description?

	How many films have the word 'one' in the description?

	How many films had 'Deleted Scenes' as a special feature?
		And how many in the shortest film that included 'Deleted Scenes' (shortest by length)?
        
    */
/*
	select * 
	from film 
	where rating like 'PG%'
;

	select * 
	from film 
	where description like '%zero%'
	;

	

	select * 
	from film 
	where special_features like '%Deleted Scenes%'
    order by length ASC
	;
*/
	

# ORDER BY 
/* Intro

	The ORDER BY clause doesn't change which rows are returned, but it affects the way they are SORTED (or ORDERED)
    
    The ordering can either be ASCending or DESCending.  And you can include multiple columns, each with different ordering.
    
    select *
    from actor
    ORDER BY first_name ASC;
    
    select *
    from actor
    ORDER BY last_name DESC, first_name ASC;
    
*/
/* 
	Get a list of films ordered by their rental_rate ascending (increasing)
    
    What is the longest length film in the table?
    
	What was the title of the film that was the most recent rental (by rental_date)?  How about the first rental the store ever had?
*/
/*
	select * from film order by rental_rate asc;

	select * from film order by length desc;


	select * from rental order by rental_date desc;
	select * from inventory where inventory_id = 2727;
	select * from film where film_id = 598;

	select * from rental order by rental_date asc;
	select * from inventory where inventory_id = 367;
	select * from film where film_id = 80;
*/


# Scalar Functions
/* Intro

Scalar Functions are like python functions.  They can take inputs from in a row, and return an output value:

select now() as now
, now() + INTERVAL 3 DAY  as now_plus_3_day
, date_format(now(), '%Y-%m-%d') as nice_now
, last_day(now()) 
, hour(now())
;
select rental_rate, ceil(rental_rate) 
from film
;
*/
/* 

	Get a list of films, with the rental_rate rounded to the nearest dollar.

	Get a list of films, and when they would be due back if they were rented today (now + rental_duration)
		use the function: round()
        
	Return all film names as is, as well as in lower case
		use the function: lower()
*/
/*
	select f.film_id, f.rental_duration
	, now()
	, now() + INTERVAL f.rental_duration DAY 
	from film f
    ;

	select f.* 
	 , round(f.rental_rate)
	from film f
	;
    
    select title, lower(title) 
    from film
    ;
    
*/


# AND
/* Intro
	'and' is used in the WHERE clause to apply multiple filters to a query:
    
    If I wanted to find actors whose first_name began with the letter 'A' and last_name began with the letter 'C':
    
    select *
    from actor
    where first_name like 'A%' 
    AND last_name like 'C%'
;
*/
/*  
	Find all the films with a rental_duraction of 6 days and a rental_rate of 0.99
    
    Your kid needs to be distracted for two hours.  Find all the films with a rating of 'PG' and a length over 2 hours

	Find all the rentals that were rented between 8pm (hour 20)    AND returned before noon (on any day)
		Use the scalar function: hour()
	
;
*/
/*
	select * 
	from film
	where rental_duration = 6 
	and rental_rate = 0.99
	;

	select * 
	from film
	where rating = 'PG'
	and length >= 120
	;

	select * 
	from rental
	where hour(rental_date) = 20
	and hour(return_date) < 12

*/

# OR
/* Intro

	'or' is used in the WHERE clause.  It is similar to 'and' but returns rows that match EITHER filter
    
    It is similar to the IN() function
    
	select * 
	from actor
	where first_name = 'ANGELA' 
	OR last_name = 'DAVIS'
	;

*/
/* 
	Find all the films with a rental duration of 5 or 7 days
    
    Find all the films with a rental duration of 5 days or a rental_cost of 0.99
    
	Find all the rentals that were rented between 8pm (hour 20)     OR returned before noon (on any day)
		Use the Scalar function: hour()

;*/
/*
	select *
	from film
	where rental_duration = 5 or rental_duraction = 7		# could be: rental_duraction IN (5,7)
	;

	select *
	from film
	where rental_duration = 5 or rental_cost = 0.99			# could NOT be an IN()
	;
	select * 
	from rental
	where hour(rental_date) = 20
	or hour(return_date) < 12
	;
*/

# DISTINCT
/* Intro

	Distinct is a modifying keyword in the SELECT clause.  
    
    It tells mysql to:
    1) select the columns as indicated
    2) loop through all the rows, discarding any rows that are identical in ALL fields to another row
    
    To find a list of all the unique actor's first_names:
    
    select distinct first_name 
    from actor 
    # order by first_name
    ;
*/
/* 
	Make a list of the distinct set of film ratings

	Find the distinct set of film release_years in our store
    
    Find the distinct set of actor_ids (via film_actor) in the movies 'ACADEMY DINOSAUR' and 'ANGELS LIFE'
*/
/*
	select distinct rating
	from film;

	select distinct release_year
	from film;

	select * 
	from film 
	where title in ('ACADEMY DINOSAUR','ANGELS LIFE');
	select actor_id # add distinct
	from film_actor
	where film_id in (1,25)
	;
*/


# Group By / Count
/* Intro

	The distinct function is useful, but sometimes we want to take additional information out of the "distint" groups of data.
    
    The simplest would be: "how many times was that value repeated?"
    
    To do that rather than use "distinct", we use 
    
    select actor_id, COUNT(1) as role_count
	from film_actor
	where film_id in (1,25)
    GROUP BY actor_id
;
	
    As many "Aggregate" functions as you'd like can be added.
    
    Other aggregate functions: 
		min/max/avg/sum
		group_concat
*/
/* 
Find the number of actors with each first_name

In the film table, how many movies have each value of 'rating'
	Find the minimum film length by rating
    Find the maximum film length by rating
    Find the total film length by rating


*/
/*
	select first_name, count(1) as count
	from actor
	group by first_name
	;
    
	select rating, count(1) as count
	from film
	group by rating
	;

	select rating, count(1) as count
    , min(length), max(length), sum(length)
	from film
	group by rating
	;
    
*/
    
	
    
# Debug Aggregate Functions
/* Show how to remove agg functions, group by to show the input data */


# Count, group_concat
/* Intro

	group_concat is a mysql specific aggregate function that takes the values from all the rows, and returns them in one row.
    
    It's very useful to digging into data, though there's a limit on the field size.  So past a few thousand values you'll start to lose your data
*/
/*
	Find the NUMBER of actors with each first_name, and include a list of their last_names 
*/
/* 
	select first_name, count(1) as count, group_concat(last_name) as last_names		# show  `order by last_name`
	from actor  
	group by first_name
	order by first_name
	;
*/
	

# GROUP BY, HAVING 
/* Intro

	The WHERE clause lets us apply filters to the source table before we apply aggregations, but what if we want to apply a filter to the output of an aggregate function?
    
    The HAVING clause allows filtering on aggregate values, including those that aren't SELECTed

	To show all the actors who had been in fewer than 20 films:

	select actor_id
		from film_actor
		group by actor_id
		HAVING count(1) < 20
	;
    
	select *
	from actor 
	where actor_id in (
		select actor_id
		from film_actor
		group by actor_id
		HAVING count(1) < 20
	)
	;
    
    However, I personally don't use the HAVING clause very often.  There's another way to structure your query that makes more sense to me: using derived tables:
*/



# Derived Tables
/* Intro

	Derived tables are just a normal query, surrounded by () and given a name.  An outer query can use all the columns the sub query returns.  
    It's a good way to avoid doing duplicate work.

	select *
	from
	(
		select actor_id, count(1) as count
		from film_actor
		group by actor_id
	) A
	WHERE A.count < 20
	;

*/
/*
	Find the total length of films grouping by rating.
    Use a subquery to filter to only the ratings that can be watched in less than 22000 minutes
*/
/*
	select *
	from
	(
		select rating, sum(length) as sum_length
		from film
		group by rating
	) A
	where A.sum_length < 22000
	;
    
*/
    









select * from film;

# For the films have the word 'one' in the description?
	select f.film_id, f.description
	, position('one' IN description) as position
	, substring(f.description, position('one' IN description)) as start_idx		# but this code is repeated
	from film f
	where description like '%one%'
;