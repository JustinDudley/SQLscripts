

/*
-- we want to have ONE script that will create a table.  
-- that's how we'll create our capstone tables
CREATE DATABASE Apprenti;  -- message should say "Command completed successfully", unlike getting a Result Set
-- don't forget to hit REFRESH at left, after creating
*/

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



