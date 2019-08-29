SELECT * FROM Orders; 
SELECT * FROM Customers;
SELECT * from products;


SELECT * 
	FROM Orders -- we only use FROM once
	join customers --the data we need is coming from two tables, not one
		on orders.CustomerId = Customers.Id 	-- the on clause.  We use this word (on) how to match up two 
	-- different tables.  What value is in common? When those two things match (are equal =), we print row.
	

SELECT name, city, state, date, orders.id --Sev. tables have "id", so Id by itself would get an R-squig.
	FROM Orders
	join customers 
		on orders.CustomerId = Customers.Id 
		order by name;
		-- excludes:  Customers who haven't ordered anything
		-- excludes:  Orders made informally, by customers without an Id (but this Db doesn't have any.)
		
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State',	-- "as" keyword = an alias
	orders.id as 'Order Id', date as 'Order Date'  -- CONCAT is a function.  and we added a comma
	FROM Orders
	join customers 
		on orders.CustomerId = Customers.Id 
	order by Name
	
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State', 
	orders.id as 'Order Id', Format(date, 'MMM dd, yyyy') as 'Order Date'  -- capital MM for months, lowercase mm for minutes
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
		where name = 'kfc' 
	order by Name
	
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State', 
	orders.id as 'Order Id', Format(date, 'MMM dd, yyyy') as 'Order Date'  -- capital MM for months, lowercase mm for minutes
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	where 2020 <= orders.id and orders.id <= 2040 
	order by Name  --or, order by orders.Id
