-- Q1
select EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_DOB, DEPT_CODE, PROF_EXTENSION
from professor;
-- Q2
select *
from department;
-- Q3
select distinct concat(STU_FNAME," ",STU_LNAME) as "Student Name"
from student;
-- Q4
select distinct STU_FNAME,STU_LNAME
from student;
-- Q5
select distinct COURSE_CODE
from class;
-- Q6
select distinct COURSE_CODE,CLASS_ROOM
from class;
-- Q7
select COURSE_CODE, CRS_CREDIT
from course;
-- Q8
select CLASS_CODE, COURSE_CODE, CLASS_TIME, CLASS_ROOM
from class;
-- Q9
select distinct CLASS_ROOM, COURSE_CODE
from class
Limit 5;
-- Q10
select distinct EMP_NUM, COURSE_CODE
from class;
-- Q11
select EMP_FNAME,EMP_LNAME,EMP_DOB
from professor
order by EMP_FNAME limit 10;
-- Q12
select EMP_FNAME as "Firstname",EMP_LNAME as "Lastname",Year(EMP_DOB) as "Birthyear"
from professor limit 10;
-- Q13
select EMP_FNAME as "Firstname",EMP_LNAME as "Lastname",Year(curdate())-Year(EMP_DOB) as "DoB"
from professor limit 10;
-- Q14
select *
from course
order by CRS_CREDIT asc;
-- Q15
select STU_FNAME,STU_LNAME,STU_GPA
from student 
order by STU_GPA desc limit 3;
-- Q16
select STU_FNAME,STU_LNAME,STU_GPA
from student 
where STU_GPA >= 3.50;
-- Q17
select STU_FNAME,STU_LNAME,STU_GPA
from student 
where STU_GPA < 3.50 and STU_GPA > 3.25;
-- Q18
select STU_FNAME,STU_LNAME,STU_GPA
from student 
where STU_GPA < 1.80 and STU_GPA > 1.5;
-- Q19
select STU_FNAME,STU_LNAME,STU_GPA
from student 
where STU_GPA >=1.80 and STU_GPA < 2.00;
-- Q20
select STU_FNAME,STU_LNAME
from student
where STU_GPA is null;
-- Q21
select STU_FNAME,STU_LNAME
from student
where Year(STU_DOB) between 1970 and 1979;
-- Q22
select DEPT_CODE
from department
where EMP_NUM is not null 
order by DEPT_CODE asc;
-- Q23
select *
from student
where EMP_NUM = 209;
-- Q24
select EMP_FNAME,EMP_LNAME,DEPT_CODE
from professor
where DEPT_CODE like "%MATH" or DEPT_CODE like "%CIS"
order by DEPT_CODE asc;
-- Q25
select * 
from student 
where DEPT_CODE like "%CIS" and STU_FNAME like "A%";
-- Q26
select * 
from student 
where STU_LNAME like "%son";
-- Q27
select *
from course
where COURSE_NAME like "Intro%";
-- Q28
select *
from course
where COURSE_NAME not like "Intro%";
-- Q29
select *
from course
where DEPT_CODE = "ACCT" or DEPT_CODE = "ECON/FIN" or DEPT_CODE = "MKT/MGT";
-- Q30
select *
from course
where COURSE_CODE like "%3%"
order by DEPT_CODE asc;
-- Q31
select CLASS_CODE, COURSE_CODE, CLASS_TIME
from class
where CLASS_TIME like "MWF%" and CLASS_SECTION = 2;
-- Q32
select CLASS_CODE, COURSE_CODE, CLASS_TIME
from class
where CLASS_TIME like "%10:00-10:50 a.m." and CLASS_SECTION = 1;
-- Q33
select CLASS_CODE, COURSE_CODE, CLASS_TIME
from class
where CLASS_TIME like "%p.m." and CLASS_SECTION = 3;
-- Q34
select *
from class
where EMP_NUM like"1%5"
order by EMP_NUM asc;
-- Q35
select COURSE_CODE, COURSE_NAME, DEPT_CODE
from course
where DEPT_CODE like "CIS" or DEPT_CODE like "ENG" or DEPT_CODE like "MATH"
order by DEPT_CODE asc;
-- Q36
select COURSE_CODE, COURSE_NAME, DEPT_CODE
from course
where COURSE_NAME like "% Applications";
-- Q37
select DEPT_NAME , DEPT_ADDRESS
from department
where DEPT_ADDRESS like "BBG%";
-- Q38
select DEPT_NAME , DEPT_ADDRESS
from department
where DEPT_ADDRESS like "BBG%";
-- Q39
select CLASS_CODE,COURSE_CODE,EMP_NUM
from class
where EMP_NUM = 104 or EMP_NUM = 105 or EMP_NUM = 106 or EMP_NUM = 155
order by EMP_NUM asc;
-- Q40
select EMP_NUM,COURSE_CODE,CLASS_TIME
from class
where CLASS_TIME like "MWF%" and CLASS_ROOM like "KLR%" and COURSE_CODE like "%3%";