

select * from Customers
select * from OrderLines
select * from Orders

select sum(sales) from customers;	--yields a very large number

--what if we want the sum of all sales from just Cincinnati?
select sum(sales) from customers where city = 'Cincinnati'
select * from customers
--SQL can take the entire set of input records, and break them up or group them by some criteria.
--   - put them into groups
SELECT city,  count(*) as 'Count', sum(sales) as 'Sum of Sales'
	FROM customers
	GROUP BY city		-- can't use keyword "desc"
	-- WHERE sales > 600000 --this won't work. 'WHERE' clause applies to INDIV. rows
	HAVING sum(sales) > 0
	--ORDER BY sum(sales) desc

	select concat(name, city) as 'mash' from Customers

	--preview:
update Customers set sales = sales + 100000 where name = 'Kroger';

-- ABC Analysis, done by salespeople
-- A:  top 20% -->  80% of sales
-- B:  middle 60% -->  15% of sales
-- C:  low 20% -->  5% of sales
--	SO, who are the A customers?  We will give them more attention
--NESTED QUERIES!!   INNER SELECT STMT, OUTER SELECT STMT
-- called SUB-QUERY, or SUB-SELECT
-- this type of query is used a lot when an abnormal circumstance occurs. 
-- this nested query is done without doing anything programmatically with C#
select * from Customers
	where Sales > (select avg(sales) from Customers);

-- Here's another SQL clause:  Top 3, or top 4, whatever
select top 3 * from customers order by sales desc

-- MORE SHORTCUTS:  Clunky syntax:
select * from customers 
	where id = 1 or id = 27 or id = 34	--this is a mess, it's silly
-- Better syntax:
select * from customers
	where id in (1, 27, 34) -- this is simpler, better
select id from customers	
	where name in ('Kroger', 'Nationwide', 'Abercrombie Fitch');
--Combining the ideas above, and doing a sub-query:
select * from customers
	where id in (select id from customers	
	where name in ('Kroger', 'Nationwide', 'Abercrombie Fitch'));
-- When using an inner select, it can only return one column.  There might be multiple values, but they're in one column.  
-- It's an array I suppose







