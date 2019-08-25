

select * from student stu

select * from Student stu  -- could type "Student as stu", but no one does that
	where stu.SAT >= 1000 and stu.SAT <= 1300
	order by stu.SAT desc


	select CONCAT(firstname, ' ', lastname)as 'Name' from Student stu  -- could type "Student as stu", but no one does that
	where stu.SAT >= 1000 and stu.SAT <= 1300
	order by stu.SAT desc


select * from Student  -- could type "Student as stu", but no one does that
	where SAT < 1000 or SAT > 1400
	
-- USING PARAMETERS.  We want a low SAT score, and a high SAT score
DECLARE @LOWSAT int;  -- first symbol MUST be an @ sign
DECLARE @HIGHSAT int;
-- = does NOT mean equal.  = is an assignment operator, assigns var to a value
--store that value in the thing to the left of the = sign
SET @LOWSAT = 1000;		
SET @HIGHSAT = 1300;
-- now we're ready:
select * from Student 
	where SAT < @LOWSAT or SAT > @HIGHSAT


-- display students where GPA >= 3.00
DECLARE @HIGHGPA decimal(4,2);     --just "decimal" works too.  So does int
SET @HIGHGPA = 2.70;
select * from Student
	WHERE GPA >= @HIGHGPA


select avg(SAT) from student   -- find average SAT score

