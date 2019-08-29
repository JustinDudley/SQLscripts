

		  
select r.id as 'RequestId', r.Status, r.Total, u.lastname as 'User',
		v.Name as 'Vendor', p.Name as 'Product', p.Price, l.Quantity, (p.Price * l.Quantity) as 'Subtotal'
	from requests r
	join requestlines l
		on l.requestId = r.Id
	join products p
		on l.productId = p.Id
	-- now this next part is a little new:
	join vendors v
		on p.vendorId = v.Id -- tells us who the vendor is who supplies the product
	join users u
		on u.id = r.userid  --that's ALL the tables in the Db
		  
  
-- We're learning about views now:
CREATE VIEW FullRequests as 

select r.id as 'RequestId', r.Status, r.Total, u.lastname as 'User',
		v.Name as 'Vendor', p.Name as 'Product', p.Price, l.Quantity, (p.Price * l.Quantity) as 'Subtotal'
	from requests r
	join requestlines l
		on l.requestId = r.Id
	join products p
		on l.productId = p.Id
	-- now this next part is a little new:
	join vendors v
		on p.vendorId = v.Id -- tells us who the vendor is who supplies the product
	join users u
		on u.id = r.userid  --that's ALL the tables in the Db

		  