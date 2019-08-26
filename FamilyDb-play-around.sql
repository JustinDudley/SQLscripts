



select * from familymembers fm
	join species sp
	on fm.SpeciesId = sp.Id;


select * from species sp
	join familymembers fm
	on sp.Id = fm.speciesId;

