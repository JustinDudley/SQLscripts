

select * from Major;	--Eexist 7 majors, each with an Id
select * from MajorClassRel;	
select * from Class		--Eexist 36 classes

select Maj.Description as 'Major', Cla.Subject as 'Class', Section
	from Major Maj
	join MajorClassRel Rel
		on Maj.id = Rel.MajorId
	join Class Cla
		on Cla.id = Rel.ClassId

