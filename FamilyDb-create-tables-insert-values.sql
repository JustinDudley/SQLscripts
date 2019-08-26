

-- -- -- FamilyDb:  Create Tables, then populate them  -- -- -- 

-- STEP ONE:  CREATE TWO TABLES

-- must drop FamilyMembers first. Otherwise, SSMS won't allow me to drop Species, because Species
-- is referenced by FamilyMembers
DROP TABLE if exists FamilyMembers;  --must drop FamilyMembers first. Otherwise, SSMS won't allow me to drop

-- now I can drop Species;  Then add them both back in.
DROP TABLE if exists Species;
CREATE TABLE Species (
	Id int PRIMARY KEY IDENTITY(1,1) not null,
	Type nvarchar(30) not null,
	Genus nvarchar(30) not null,
	IsDomesticated bit,
	AvgLifeSpan int
);

CREATE TABLE FamilyMembers (
	FirstName nvarchar(30) not null PRIMARY KEY,
	LastName nvarchar(30) not null,
	BirthDate datetime not null,
	SpeciesId int not null FOREIGN KEY references Species(Id),
	Occupation nvarchar(30) not null,
	Address nvarchar(40),
	City nvarchar(25),
	State char(2),
	ZipCode char(5),
	Alive bit not null default 1
);

-- STEP TWO:  INSERT VALUES INTO THE TABLES
insert into Species 
	(Type, Genus, IsDomesticated, AvgLifeSpan)
	values ('Human', 'Primate', 1, 80);
insert into Species 
	(Type, Genus, IsDomesticated, AvgLifeSpan)
	values ('HouseCat', 'Feline', 1, 15);
insert into Species 
	(Type, Genus, IsDomesticated, AvgLifeSpan)
	values ('Dog', 'Canine', 1, 16);
insert into Species 
	(Type, Genus, IsDomesticated, AvgLifeSpan)
	values ('GuineaPig', 'Rodent', 1, 6);
insert into Species 
	(Type, Genus, IsDomesticated, AvgLifeSpan)
	values ('Squirrel', 'Rodent', 0, 5);


insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Justin', 'Dudley', '1970-12-01', 1, 'Developer', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Susan', 'Sprigg', '1971-06-21', 1, 'Public Health', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Max', 'Sprigg-Dudley', '2000-08-25', 1, 'Student', 'P.O. Box 777', 'Pittsburgh', 'PA', '55555', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Margaret', 'Sprigg-Dudley', '2003-12-13', 1, 'Student', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Bastet', 'Sprigg-Dudley', '2006-02-14', 2, 'Hunter', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Artemis', 'Sprigg-Dudley', '2012-11-01', 2, 'Hunter', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Nawin', 'Sprigg-Dudley', '2013-05-01', 4, 'Forager', '502 Park Ave.', 'Loveland', 'OH', '45140', 1);
insert into FamilyMembers
	(FirstName, LastName, Birthdate, SpeciesId, Occupation, Address, City, State, ZipCode, Alive)
values ('Guiddea', 'Sprigg-Dudley', '2013-05-01', 4, 'Forager', '502 Park Ave.', 'Loveland', 'OH', '45140', 0);

