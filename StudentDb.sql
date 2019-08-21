select * from Major;
select * from student;

select firstname, lastname, description 
	from student
	join major on student.majorid = major.id
	-- this only yields ONE result, because of what "join" means.
	-- a NULL FK will never yield results in a join, because the corresponding PK is never allowed to be NULL


select s.firstname, s.lastname, m.description 
	from student s
	join major m on s.majorid = m.id   	-- a normal join is an "inner join".  


-- BUT:  We want students without majors to be listed as "undeclared".  How do we do that?  A JOIN view isn't going to work
-- An OUTER JOIN handles this problem: Hmmm, outer join not working, reasons unknown, we'll use a left join today
select stu.firstname, stu.lastname, stu.GPA as 'Weighted SAT', stu.SAT, isnull(m.description, 'Undeclared') as 'Major' --isNull is a function (boolean?)
	from student stu
	left join major m	-- LEFT join (sim. to outer join??)
	on stu.majorid = m.id

--display count of students.  Use Count function
SELECT count(Id) as 'SS count', count(MajorId)
	from Student;

	
--display count of students.  Use Count function
-- count is an "aggregate function."  We don't get a result until all rows have been looked at.
SELECT count(*)   -- using *  , a common method, meaning "all the columns" [not counting columns:  Still counting rows!!]
	from Student;

-- min, max are other aggregate functions
SELECT count(*), count(MajorId), max(SAT)  , min(SAT), avg(GPA)
	from Student;

