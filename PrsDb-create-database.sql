
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


--create PRS Database for Capstone Project
USE [Master];
DROP DATABASE IF EXISTS [PrsDb];
CREATE DATABASE [PrsDb];
USE [PrsDb];


--  Users default is supposed to be set to 1?? I have set it to 0 for now.
CREATE TABLE Users (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Username nvarchar(30) not null UNIQUE,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(255),
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
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





