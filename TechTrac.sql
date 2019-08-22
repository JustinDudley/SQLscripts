

/*
-- we want to have ONE script that will create a table.  
-- that's how we'll create our capstone tables
CREATE DATABASE Apprenti;  -- message should say "Command completed successfully", unlike getting a Result Set
-- don't forget to hit REFRESH at left, after creating
*/

--Create table for personal contacts.
--just put it into the Apprenti Db
-- go  is a sql keyword.  It is an implied transaction
DROP TABLE if exists Contacts;
go
CREATE TABLE Contacts (
	FirstName nvarchar(30) not null,
	LastName nvarchar(30),
	Phone nvarchar(12) not null,
	email nvarchar(100),
	Position nvarchar(40),
	StreetAddress nvarchar(40),
	City nvarchar(30) not null,
	State char(2) not null,
	Birthday datetime,
	Starred bit not null default 0,
	MostRecentContact datetime
);
go
--insert 3-5 contacts
insert into Contacts (FirstName, LastName, Phone, email, Position, StreetAddress, City, State, Birthday)
	values ('Peter', 'Sauer', '323-444-5555', 'peter@gmail.com', 'Family Friend', '333 Vincente', 'Berkeley', 'CA', '1966-12-15'); 

insert into Contacts (FirstName, LastName, Phone, email, Position, StreetAddress, City, State, Birthday, Starred, MostRecentContact) 
	values ('Susan', 'Sprigg', '323-706-5555', 'sms@gmail.com', 'Spouse', '502 Park Ave.', 'Loveland', 'OH', '1971-06-21', 1, '2019-08-22'); 

insert into Contacts (FirstName, LastName, Phone, email, Position, StreetAddress, City, State, Birthday)
	values ('Doug', 'Jones', '323-666-5555', 'doug@gmail.com', 'Neighbor', '415 Park Ave.', 'Loveland', 'OH', '1964-12-11'); 
go
select * from contacts
-- now, some tricks.  ALTER statement.  It adds a column to an existing table:
go
Alter table Contacts
	add BFF bit default 0;   -- add a column
go
Alter table Contacts
	alter column Address nvarchar(50);   -- it used to be nvarchar(40).
go
Alter table Contacts
-- this crazy number below is generated by microsoft.  Probably only good for greg's script, not mine
-- we're trying to drop "Starred"
	DROP CONSTRAINT [DF_Contacts_Starred_66603565]  
go
Alter table Contacts
	drop column Favorite;
go


-- and now, back to our regularly scheduled program...
/*
CREATE TABLE TechTrac (
	Id nchar(4) not null primary key,      --the n in nchar is for unicode.  Note:  we didn't use var (variable), must be 4
	Description nvarchar(30) not null,
	NbrOfWeeks int not null,
	Available bit not null
);

-- tables typically represent things.  Developers are objects/nouns, not 
-- actions. They exist for a period of time. So can pluralize 
CREATE TABLE Developers (
	-- must now have a NAME and TYPE, everything else is optional
	-- it is recommended that each table have a primary key
	Id int not null primary key,		-- the PK.  the "not null" is not necess., it's implied, but we'll type it in.
									-- COULD use, but we're not going to: identity(x,y), ex. identity (1,1).  Start with 1 (x), increment by 1 (y)
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	PrimaryEmail nvarchar(100) not null,      -- Greg makes his 255
	SecondaryEmail nvarchar(100),
	City nvarchar(40) not null default 'Cincinnati',
	State nchar(2) not null default 'OH',
	Active bit not null default 1,   -- allows you to "logically delete" something
	Phone nvarchar(20) not null,    -- string or int?  Ask the Q.:  Am I ever going to need to do math with this?  If no: use string
	TechTracId nchar(4) not null foreign key references TechTrac(Id)  -- Id because that's the one column in that table
);

-- we had to run the create techtrac table statement BEFORE we ran the create developer table
-- also, we'll have to put data into techtrac BEFORE we can do stuff with developer table


CREATE TABLE TechTopix (   -- this is the list of topics:  Javascript, html, CSS, git,...
	Id int not null primary key identity(1,1),  -- "identity" means, it will by generated by SQL
	Description nvarchar(80) not null
);

CREATE TABLE TechTracTopix (		-- this is the RELATIONSHIP table, the one that joins many-to-many
	Id int not null primary key identity(1,1),
	TechTracId nchar(4) not null foreign key references TechTrac(Id),
	TechTopixId int not null foreign key references TechTopix(Id)
);
*/








