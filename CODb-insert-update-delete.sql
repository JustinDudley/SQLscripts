

select * from customers

-- insert a new customer
-- skip id, it's the PK, it's generated for us
Insert into Customers (Name, City, State, Sales, Active)
	values ('MAX Technical Training', 'Mason', 'OH', 75000, 1);       -- note "values" is plural


select *
	from orders o
	join customers c
		on c.Id = o.CustomerId
	where o.id = (select max(id) from orders);


select * from Customers
	where name = 'Max Technical Training';  --uppercase consistency not important

-- insert into orders
insert into Orders (CustomerId, Date, Description)
	values (
		(select id from customers where name = 'Verizon'),
		'2019-08-21', 
		'My first manual insert into orders');
	-- if leave out time component of datetime, it inserts 000 000 00 000 (or whataever) for time.  That's fine


-- this deletes BOTH records, fyi
delete from customers
	where city = 'mason';


-- Let's use PARAMETERS instead, to make this easier.  We won't have to worry about messing up
-- our insert statement
-- parameters are good within one script.  


--UPDATE the order we just added
UPDATE Orders Set
	Description = 'My first updated order'
	where id = 28;

select * from orders where id = 28;


UPDATE Orders Set
	Description = 'My first updated order for Kroger',
	CustomerId = (select id from customers where name = 'Kroger') 
	where id = 28;

select * from orders o 
	join customers c 
		on c.id = o.customerId 
	where o.id = 28;

delete from orders 
	where id = 28;  -- if you can delete by id, that is the safest way.

