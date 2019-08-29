
/*
August 28 notes on PRODUCT REQUEST SYSTEM Database
(the Db that will become our capstone project):
----------------------- ----------------------
All or most of the info for this Db exists in the following places:
Justin's sources:
  1. C/repos/SQLscripts/PrsDb-create-database.sql [ACCESSES PrsDb]
  2. C/repos/SQLscripts/PrsDb-insert-data.sql  [unfinished project] [ACCESSES PrsDb]
Greg's sources:
  1. C/repos/bootcamp-class-material/SqlPrsDbScript.sql [ACCESSES SqlPrs]
  2. C/repos/bootcamp-class-material/PrsDb-Specs.md (markdown file, specs for the project)
*/


-- insert data into PRS Database
-- ~6 vendors, ~12 products, ~6 requests

insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
	values ('McZinger', 'IWillMcZingYou', 'Margaret', 'Sprigg-Dudley', '513-555-1212', 'margaret@gmail.com', 1,1);
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values ('AirplaneWatcher', 'plane', 'Max', 'Sprigg-Dudley', '513-555-8888', 'max@gmail.com');
/*
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values (
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values (
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values (
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values (
insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values (
*/
select * from users

INSERT INTO Vendors (Code, Name, Address, City, Zip, Phone, Email)
	VALUES ('TeSu', 'Tennis Supply', '1212 Inferon', 'Louisville', '32323', '555-555-5555', 'ts@gmail.com');

/*
--from class file:
DECLARE @AmazonId int;
SELECT @AmazonId = Id from Vendors where Code = 'AMAZ';
*/
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId) 
	VALUES ('10012', 'Racket', 45.99, 'EACH', 'www.picture.com', 1);




