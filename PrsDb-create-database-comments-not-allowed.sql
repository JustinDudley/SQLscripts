
USE [Master]; 
DROP DATABASE IF EXISTS [PrsDb]; 
CREATE DATABASE [PrsDb]; 
USE [PrsDb]; 


CREATE TABLE Users ( 
	Id int IDENTITY(1,1) PRIMARY KEY, 
	Username nvarchar(30) not null UNIQUE, 
	Password nvarchar(30) not null, 
	Firstname nvarchar(30) not null, 
	Lastname nvarchar(30) not null, 
	Phone nvarchar(12) null, 
	Email nvarchar(255) null, 
	IsReviewer bit not null default 0, 
	IsAdmin bit not null default 0 
); 

CREATE TABLE Vendors ( 
	Id int IDENTITY(1,1) PRIMARY KEY, 
	Code nvarchar(30) not null UNIQUE, 
	Name nvarchar(30) not null, 
	Address nvarchar(30) not null, 
	City nvarchar(30) not null, 
	State char(2) not null, 
	Zip char(5) not null, 
	Phone char(12) null, 
	Email nvarchar(255) null 
); 

CREATE TABLE Products ( 
	Id int IDENTITY(1,1) PRIMARY KEY, 
	PartNbr nvarchar(30) not null UNIQUE, 
	Name nvarchar(30) not null, 
	Price decimal(11,2) not null, 
	Unit nvarchar(30) not null, 
	PhotoPath nvarchar(255) null, 
	VendorId int not null FOREIGN KEY REFERENCES Vendors(Id) 
); 

CREATE TABLE Requests ( 
	Id int IDENTITY(1,1) PRIMARY KEY, 
	Description nvarchar(80) not null, 
	Justification nvarchar(80) not null, 
	RejectionReason nvarchar(80) null, 
	DeliveryMode nvarchar(20) not null DEFAULT 'Pickup', 
	Status nvarchar(10) not null DEFAULT 'NEW', 
	Total decimal(11,2) not null DEFAULT 0, 
	UserId int not null FOREIGN KEY REFERENCES Users(Id) 
); 

CREATE TABLE RequestLines ( 
	Id int IDENTITY (1,1) PRIMARY KEY, 
	RequestId int not null FOREIGN KEY REFERENCES Requests(Id), 
	ProductId int not null FOREIGN KEY REFERENCES Products(Id), 
	Quantity int not null DEFAULT 1 
); 



INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('McZingerONESINIGLECOMMENTS', 'IWillMcZingYou', 'Margaret', 'Sprigg-Dudley', '513-555-1212', 'margaret@gmail.com', 1,1); 
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)   
	VALUES ('airplaneWatcher', 'plane', 'Max', 'Sprigg-Dudley', '513-555-8888', 'max@gmail.com', 1,0); 
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('dudder', 'DoNotWant!', 'Justin', 'Dudley', '513-555-9998', 'jdudley.aol.com', 0,0); 


INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('PSFXNEW', 'Pustefix', '134 Freedom Ave.', 'Powells Point', 'NC', '27966', '888-318-3600', 'sales@hq-kites-usa.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('KING', 'King''s Volkswagen', '9570 Kings Auto Mall Rd.', 'Cincinnati', 'OH', '45249', '513-518-5585', 'kingsVW@outlook.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('MSMS', 'Misdirections Magic Shop', '1236 9th Ave.', 'San Francisco', 'CA', '94122', '415-566-2180', 'joe@misdirections.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('WOOF', 'Woofta','620 19th St. W.', 'Dickinson', 'ND', '58601', '701-483-8899', 'woofta2016@outlook.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('NYCC', 'NYC Clown Studio', '427 S. 4th Ave.', 'Mount Vernon', 'NY', '10550', '914-371-1883', 'info@studioeventstaffing.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('HMDP', 'The Home Depot', '200 Eubank Blvd SE', 'Albuquerque', 'NM', '87123', '505-271-1900', 'homedepot@outlook.com'); 
INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('JGGL', 'Seattle Juggling Shop', '9460 Rainier Ave. S.', 'Seattle', 'WA', '98118', '206-321-1291', 'wearekaput@nw-juggle.com'); 



INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('STEPLADDNEW', 'Step Ladder', 45.00, 'EACH', 'https://www.google.com/search?q=stepladder+photo&sxsrf', 1); 
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('UNICYC', 'Unicycle', 120.00, 'EACH', 'https://www.gettyimages.com/search/2/image?license=rf&family', 2); 
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('STILT', 'Stilts', 19.99, 'PAIR', 'https://www.bellalunatoys.com/products/kid-s-wooden-stilts', 1); 




INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Quebec City busking', 'Old ones have holes', null, 'Pickup', 'NEW', 0, 2); 
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Reach Trapeze', 'Too high', 'Not tall enough', 'Dropoff', 'NEW', 1, 1); 
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Vehicle for Clowns', 'Need big entrance', null, 'DriveAway', 'NEW', 1, 3); 


INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (1,2,3); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (2,2,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (1,3,2); 

