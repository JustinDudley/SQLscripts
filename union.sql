

select * from student
	where gpa >= 3.0

-- Here is a way to re-group the students.  But it gives TWO reports, and that's not great
select 'Green' as Color, * from student
	where gpa >= 3.0
select 'Blue' as Color, * from student
	where not gpa >= 3.0	-- note the "not" keyword.  One way of doing this


-- So we put "union" statment between them:
select 'Green' as Color, * from student
	where gpa >= 3.0
union
select 'Blue' as Color, * from student
	where not gpa >= 3.0	-- note the "not" keyword.  One way of doing this
order by GPA	-- also, we'll order by GPA


-- example with TWO unions:
-- you can have as many unions as you want
select 'Green' as Color, * from student
	where gpa >= 3.0
union
select 'Blue' as Color, * from student
	where gpa >= 2.5 and gpa < 3.0
union
select 'Orange' as Color, * from student
	where gpa < 2.5	
order by GPA	-- also, we'll order by GPA ["order by" applies to a result set, so it's not calculated until all the unions are done]
