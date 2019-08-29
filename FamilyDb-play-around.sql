
USE [FamilyDb]

select * from species;

select * from species	
	where type = 'HouseCat';

select * from familymembers
	where speciesId = 2;

select Id from species
	where type = 'HouseCat';

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