/*
SELECT * FROM Customers;
SELECT Name, City, State FROM Customers;  --this is a comment
*/
--below, I have arbitrarily split a single command into multiple lines, and manually indented
SELECT Name, City, State FROM Customers 
	WHERE (State = 'OH') OR (State = 'KY'); --note single quote.   parenthesise optional in this case.  state can be lowercase
SELECT Name, City, State FROM Customers 
	WHERE (State = 'OH') OR (State = 'KY') ORDER BY State desc, City;
SELECT Name FROM Customers WHERE City = 'Jersey City';
select * from Customers;

