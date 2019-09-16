
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
	VALUES ('McZinger', 'IWillMcZingYou', 'Margaret', 'Sprigg-Dudley', '513-555-1212', 'margaret@gmail.com', 1,1); 
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)   
	VALUES ('airplaneWatcher', 'plane', 'Max', 'Sprigg-Dudley', '513-555-8888', 'max@gmail.com', 0,0); 
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('dudder', 'DoNotWant!', 'Justin', 'Dudley', '513-555-9998', 'jdudley.aol.com', 0,0); 
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('sprague', 'nevergiveup', 'Susan', 'Sprigg', '510-434-9999', 'smsprigg99@gmail.com', 1,0);   
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('threelegs', 'mySonIsAnActorToo', 'Geoff', 'Hoyle', '415-666-1111', 'funguy@gmail.com', 0,1);   
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('clownfounder', 'onceamime', 'Larry', 'Pisoni', '415-777-9090', 'clown@aol.com', 0,0);   
INSERT INTO Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)  
	VALUES ('cointrick', 'nowyouseeit', 'Jaffo', 'Noname', '510-000-0000', 'findme@gmail.com',0,0);   


INSERT INTO Vendors (Code, Name, Address, City, State, Zip, Phone, Email) 
	VALUES ('PSFX', 'Pustefix', '134 Freedom Ave.', 'Powells Point', 'NC', '27966', '888-318-3600', 'sales@hq-kites-usa.com'); 
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
	VALUES ('STEPLADD', 'Step Ladder', 45.00, 'EACH', 'https://www.google.com/search?q=stepladder+photo&sxsrf', 6); 
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('UNICYC', 'Unicycle', 120.00, 'EACH', 'https://www.gettyimages.com/search/2/image?license=rf&family', 7); 
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('STILT', 'Stilts', 19.99, 'PAIR', 'https://www.bellalunatoys.com/products/kid-s-wooden-stilts', 6);   
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('VOLK', 'Volkswagen', 22000.00, 'EACH', 'http://picofbug', 2);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('TRICYC', 'Tricycle', 75.00, 'EACH', 'http://www.trikepic.com/products', 6);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('FUEL', 'Refueling Bottle', 19.00, 'EACH', 'https://www.fuelyourcampingtrip-fuel', 6);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('CONTACT', 'Contact Ball', 34.00, 'EACH', 'https://www.jugglecontact', 7);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('BUBB', 'Bubble Wand', 6.00, 'PAIR', 'http://www.pustefixbubbleCo-Germanbubble', 1);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('CARD', 'Deck Of Cards', 1.99, 'EACH', 'http://www.caardsRus', 3);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('RABB', 'Rabbit', 22.00, 'DOZEN', 'https://www.picOfManyRabbits', 4);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('NOSE', 'Clown Nose', 2.50, 'DOZEN', 'https://www.NoseItNovel', 5);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('TIGHT', 'Tightrope', 145.00, 'EACH', 'http://watchropewalking', 5);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('CLUB', 'Juggling Clubs', 27.00, 'THREE', 'http://clubjugglepic', 7);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('SCARV', 'Scarves', 9.99, 'THREE', 'https://picScarves-lighterthanair', 3);  
INSERT INTO Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)  
	VALUES ('NET', 'Net', 2500.00, 'EACH', 'https://netpics', 5);  



 
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Tightrope Act supplies', 'Can''t reach tightrope, don''t have tightrope', null, 'Dropoff', 'NEW', 0, 5); 
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Vehicle and props for Clowns', 'Broke windows of Last car, adding new act', null, 'DriveAway', 'NEW', 0, 6);  
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('New Show in Quebec City', 'They love jugglers in Quebec', null, 'Pickup', 'NEW', 0, 7);  
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Magic supplies', 'Starting new career as magician', null, 'Pickup', 'NEW', 0, 1);  
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Two cars', 'Need transportation for me and friend', null, 'Pickup', 'NEW', 0, 1);       
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Children''s circus gig supplies', 'Moving into childrens'' shows', null, 'Pickup', 'NEW', 0, 7);   
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Unicycle for self', 'Need to blow off steam', null, 'Pickup', 'NEW', 0, 7);   
INSERT INTO Requests (Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserId)  
	VALUES ('Commuter car', 'My other car is a gas guzzler', null, 'Pickup', 'NEW', 0, 4);  


 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (4,8,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (5,4,2); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (4,9,3); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (8,4,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (2,4,1);   
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (4,10,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (1,12,1);  
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (1,1,2);  
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (2,1,3); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (6,3,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (6,5,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (7,2,1); 
INSERT INTO RequestLines (RequestId, ProductId, Quantity)  
	VALUES (3,13,1); 
