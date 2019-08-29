select * from Orders o

select * from Orders o	-- o is an alias for orders, to keep us from all the typing
	Join OrderLines ol
		on ol.OrderId = o.Id	-- you almost always are going to match up a foreign key and a primary key (in joins, I presume)
	join Products p
		on ol.ProductId = p.Id

	
select format(date, 'MMM dd, yyyy') as 'Order Date', CustomerId, name as 'Product', Quantity, price,  
	(quantity * price) as 'Line SubTotal'     -- adding another field for presentation? That's different!
	from Orders o	-- o is an alias for orders, to keep us from all the typing
	Join OrderLines ol
		on ol.OrderId = o.Id	-- you almost always are going to match up a foreign key and a primary key (in joins, I presume)
	join Products p
		on ol.ProductId = p.Id
	where o.id = 2002	-- added this line so we WOULDN'T have 200 lines anymore
	

-- NEXT:  We want to add customer name (since customers don't care about ID #'s).  We'll need to do another join
-- we cant use from again, we need another join
select format(date, 'MMM dd, yyyy') as 'Order Date', c.name as 'Customer', p.name as 'Product', Quantity, price,  
	(quantity * price) as 'Line SubTotal'     -- adding another field? Just for presentation? That's different!
	from Orders o	-- o is an alias for orders, to keep us from all the typing
	Join OrderLines ol
		on ol.OrderId = o.Id	-- you almost always are going to match up a foreign key and a primary key (in joins, I presume)
	join Products p
		on ol.ProductId = p.Id
	join Customers c
		on c.Id = o.CustomerId       --cust. doesn't have a _foreign_? key, so...
		-- we only have four tables in our Db, so
		-- need to 
	where o.id = 2002	-- added this line so we WOULDN'T have 200 lines anymore

	-- when you alias it, you then HAVE to use the alias
	-- The strategy: find the foreign key, then go find the primary key, those are the two you have to join together
	-- "we can't join the customer to the order lines"
	-- "How do you get these two things to match up.  It's not really 'from' or 'to' anything. It's not directional. I have
	-- two tables.  I look for a common field.  It's joining the orders? and customers? tables together."
	-- The order lines have foreign keys. One goes to order, the other goes to product (see red/green diagram in notebook)
	-- the joins can be listed in any order
	-- remember, you can only have one "from" stmt
	-- can do a join with 2 tables, or 22 tables




