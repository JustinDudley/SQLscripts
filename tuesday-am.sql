select * from Customers c
	join Orders o on o.CustomerId = c.id 
	where state = 'oh' or state = 'ky'
	order by name
