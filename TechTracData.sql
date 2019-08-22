

/*
Insert into TechTrac (Id, Description, NbrOfWeeks, Available)
	values ('DNET', 'Dot Net', 12, 1);

Insert into TechTrac (Id, Description, NbrOfWeeks, Available)
	values ('JAVA', 'Java', 12, 1);
	
Insert into TechTrac (Id, Description, NbrOfWeeks, Available)
	values ('NWSY', 'Network Security', 8, 1);
	*/

/*
Insert into Developers
	(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, City, State, Phone, TechTracId)
values (8, 'Lidya', 'Tsegay', 'lidya@maxtrain.com', null, 'Cininnati', 'OH', '513-555-2323', 'DNET');


Insert into Developers
	(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, City, State, Phone, TechTracId)
values (12, 'Justin', 'Dudley', 'justin@maxtrain.com', null, 'Cininnati', 'OH', '513-555-2323', 'DNET');


Insert into Developers
	(Id, Firstname, Lastname, PrimaryEmail, SecondaryEmail, City, State, Phone, TechTracId)
values (17, 'Tricia', 'Good', 'tricia@maxtrain.com', null, 'Cininnati', 'OH', '513-555-2323', 'DNET');

select * from developers;

select CONCAT(Firstname, ' ', Lastname) as 'Name', Description from developers 
	join techtrac
		on techtracid = techtrac.id
*/

/*
insert into TechTopix (Description) Values ('Git/Github');
insert into TechTopix (Description) values ('SQL Server');
insert into TechTopix (Description) Values ('C#');
insert into TechTopix (Description) Values ('EntityFramework');
insert into TechTopix (Description) Values ('MVC');
insert into TechTopix (Description) Values ('WebApi');
insert into TechTopix (Description) Values ('HTML');
insert into TechTopix (Description) Values ('CSS');
insert into TechTopix (Description) Values ('JavaScript');
insert into TechTopix (Description) Values ('Bootstrap');
insert into TechTopix (Description) Values ('jQuery');
insert into TechTopix (Description) Values ('Typescript');
insert into TechTopix (Description) Values ('Angular');
--Java
insert into TechTopix (Description) Values ('MySql');
insert into TechTopix (Description) Values ('Java');
insert into TechTopix (Description) Values ('Hibernate');
insert into TechTopix (Description) Values ('Spring');
insert into TechTopix (Description) Values ('JPA');
*/


select * from techtopix



