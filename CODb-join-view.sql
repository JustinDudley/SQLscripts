SELECT * FROM Orders; 

SELECT * FROM Customers;


SELECT * 
	FROM Orders -- we only use FROM once
	join customers --the data we need is coming from two tables, not one
		on orders.CustomerId = Customers.Id 	-- the on clause.  We use this word (on) how to match up two different tables.  What value is in common?
	--when those two things match (are equal =), we print out a row
	

SELECT name, city, state, date 
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
		
		
SELECT name, city, state, date 
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	order by Name

	
SELECT name, city, state, orders.id, date  --NOTE "id" isn't enough.  Must use orders.id, because two _tables_? have an "id" column.  id gets an R-squig 
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	order by Name
	
	
SELECT name, city, state, orders.id as 'Order Id', date  -- "as" keyword:  An alias.  
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	order by Name


SELECT name as 'Customer', city, state, orders.id as 'Order Id', date as 'Order Date'  -- "as" keyword:  An alias.  
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	order by Name

	
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State', orders.id as 'Order Id', date as 'Order Date'  -- CONCAT is a function.  and we added a comma
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 
	order by Name
	
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State', 
	orders.id as 'Order Id', Format(date, 'MMM dd, yyyy') as 'Order Date'  -- capital MM for months, lowercase mm for minutes
	FROM Orders
	join customers --again, the join keyword
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

		--where name = 'kfc'  --could comment out this whole line if we wanted to
	where 2020 <= orders.id and orders.id <= 2040 
	order by Name
	
	
SELECT name as 'Customer', CONCAT(city, ', ', state) as 'City/State', 
	orders.id as 'Order Id', Format(date, 'MMM dd, yyyy') as 'Order Date'  -- capital MM for months, lowercase mm for minutes
	FROM Orders
	join customers --again, the join keyword
		on orders.CustomerId = Customers.Id 

		--where name = 'kfc'  --could comment out this whole line if we wanted to
	where 2020 <= orders.id and orders.id <= 2040 
	order by Name  --or, order by orders.Id
