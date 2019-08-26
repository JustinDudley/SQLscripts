

-- create the tables for PRS Database

--  Users default is supposed to be set to 1, yes?
CREATE TABLE Users (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Username nvarchar(30) not null UNIQUE,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(255),
	IsReviewer bit not null default 1,
	IsAdmin bit not null default 1
);

CREATE TABLE Vendors (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Code nvarchar(30) not null UNIQUE,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	Zip char(5) not null,
	Phone char(12),
	Email nvarchar(255)
);

CREATE TABLE Products (
	Id int IDENTITY(1,1) PRIMARY KEY,
	PartNbr nvarchar(30) not null UNIQUE,
	Name nvarchar(30) not null,
	Price decimal(11,2) not null,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255),
	VendorId int not null FOREIGN KEY REFERENCES Vendors(Id)
);

CREATE TABLE Requests (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80),
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





