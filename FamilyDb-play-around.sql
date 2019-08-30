
USE [FamilyDb]

select * from species;
insert into FamilyMembers (Firstname, Lastname, Birthdate, SpeciesId, Occupation, ZipCode, Alive)
	values ('George', 'Orwell', '1930-12-11', 1, 'Writer', 33333, 0);
select * from species	
	where type = 'HouseCat';
insert into FamilyMembers (FirstName, LastName, BirthDate, SpeciesId, Occupation, Alive)
	values ('Michael', 'Jackson', '1960-03-03', 3, 'Musician', 0);
select * from familymembers
	where speciesId = 2;

update FamilyMembers set SpeciesId = 2
	where firstname = 'Michael'
update species set Genus = 'amoeba' where Type = 'housecat' 
update species
	set genus = 'plankton'
	where isDomesticated = 0;
select * from species
select Id from species
	where type = 'HouseCat';

delete from species
	where id = 7
select * from species

create table FaveFood (
	Id int Identity(1,1) PRIMARY KEY,
	Name varchar(25),
	FamilyMembersId nvarchar(30) FOREIGN KEY REFERENCES FamilyMembers
);

select * from FaveFood;
	



update FamilyMembers set lastname = 'Marshmallow'
	where lastname = 'sprigg-dudley'
select * from FamilyMembers;
select FirstName from FamilyMembers FM
	join Species Sp
	on FM.SpeciesId = Sp.Id
where FM.occupation = 'forager';

select * from FamilyMembers FM
	join Species Sp
	on FM.SpeciesId = Sp.Id
	where Sp.IsDomesticated = 0;

select FirstName from Species sp
	join familymembers fm
	on Sp.Id = FM.SpeciesId
	where Sp.Type = 'Human' or Sp.Type = 'Pig'
	order by lastname;

delete from FamilyMembers
where occupation = 'forager';

select * from familymembers;

select * from familymembers fm
	join species sp
	on fm.SpeciesId = sp.Id;


select * from species sp
	join familymembers fm
	on sp.Id = fm.speciesId;

	insert into species (type, genus, IsDomesticated)
	values('dragon', 'imaginary', 0);
	select * from species

	insert into species (type, genus, AvgLifeSpan) 
	values ('apple', 'fruit', (select avg(AvgLifeSpan) from species));
	select * from species;

	delete from species
		where id = 5
	update species set type = 'unicorn' where genus = 'imaginary';
	select * from species

select CONCAT(Type, ' ', genus) from species 
	where isDomesticated = 0

	select max(Id) from species

select * from species sp
where AvgLifeSpan < (select avg(avglifespan) from species);

-- this is not working yet:
select type from species
	group by genus
	having AvgLifeSpan > 5;