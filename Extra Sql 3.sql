-- Q41
select EMP_NUM,concat(lower(EMP_FNAME),".",SUBSTRING(lower(EMP_LNAME),1,3),"@tinycollege.edu") as email 
from professor 
where DEPT_CODE = "ACCT";
-- Q42
select *
from student
where STU_DOB like "%11%";
-- Q43
select *
from student
where DAYOFWEEK(STU_DOB) = 5
order by DEPT_CODE;
-- Q44
select EMP_FNAME,EMP_LNAME,year(curdate())-year(EMP_DOB) as AGE
from professor
where year(curdate())-year(EMP_DOB) > 75;
-- Q45
select max(year(curdate())-year(STU_DOB)) as age
from student;
-- Q46
select round(avg(STU_GPA),2) as AvgGPA
from student
where STU_CLASS = 2;
-- Q47
select STU_CLASS, round(avg(STU_GPA),2) as avgGPA
from student
group by STU_CLASS
order by STU_CLASS asc;
-- Q48
select DEPT_CODE, round(avg(STU_GPA),2) as avgGPA
from student
group by DEPT_CODE ;
-- Q49
select STU_CLASS,count(*) as num_stu
from student
group by STU_CLASS ;
-- Q50
 select STU_CLASS,concat("[",min(STU_GPA),",",max(STU_GPA),"]") as gpa_range
 from student
 group by STU_CLASS;
 -- Q51
select DEPT_CODE,count(*) as num_stu
from student
group by DEPT_CODE 
order by DEPT_CODE asc;
-- Q52
select DEPT_CODE,count(*) as num_prof
from professor
group by DEPT_CODE
HAVING count(*) >= 2
order by count(*) asc;
-- Q53
select DEPT_CODE,count(*) as num_stu
from student
where STU_GPA > 3.00
group by DEPT_CODE
HAVING count(*) > 1
order by count(*) DESC;
-- Q54
select COURSE_CODE,count(*) as num_class
from class
group by COURSE_CODE
HAVING count(*) > 2
order by count(*) desc;
-- Q55
select DEPT_CODE,count(*) as num_course
from course
group by DEPT_CODE
HAVING count(*) = 1
order by count(*) desc;
-- Q56
select professor.EMP_FNAME,professor.EMP_LNAME,professor.DEPT_CODE,department.DEPT_NAME,department.DEPT_ADDRESS
from professor 
inner join department on professor.DEPT_CODE = department.DEPT_CODE
limit 8;
-- Q57 
select student.STU_FNAME,student.STU_LNAME,enroll.CLASS_CODE
from student
inner join enroll on enroll.stu_num = student.stu_num
where enroll.GRADE = "A" and DEPT_CODE = "CIS"
order by STU_FNAME asc;
-- Q58
select student.STU_FNAME,student.STU_LNAME,count(*) as num_gradeA
from student
inner join enroll on student.STU_NUM = enroll.STU_NUM
where DEPT_CODE like "CIS" and GRADE = "A"
group by STU_FNAME
order by STU_FNAME asc;
-- Q59 
select professor.EMP_FNAME, professor.EMP_LNAME,count(stu_num) as num_advisee
from professor
inner join student on professor.EMP_NUM = student.EMP_NUM
group by EMP_FNAME
HAVING count(stu_num) > 3 
order by emp_fname desc;
-- Q60
select professor.EMP_FNAME, professor.EMP_LNAME,count(*) as num_class
from professor
inner join class on professor.emp_num = class.emp_num
inner join course on class.course_CODE = course.course_CODE
where CRS_CREDIT = 3
group by EMP_FNAME
HAVING count(*) > 3;
-- Q61
select class.CLASS_CODE,class.COURSE_CODE,course.COURSE_NAME,class.CLASS_TIME
from class
inner join course on class.COURSE_CODE = course.COURSE_CODE
inner join department on department.dept_code = course.dept_code
where CLASS_SECTION = "1" and COURSE_NAME like "Intro%" and department.DEPT_CODE like "CIS";
-- Q62
select de.dept_code, dept_name, count(distinct p.emp_num) As num_prof , count(distinct s.stu_num) AS num_stu , round((count(distinct s.stu_num) / count(distinct p.emp_num) ),2) AS "ratio"
from department de 
inner join professor p on de.dept_code = p.dept_code
inner join student s on s.dept_code = de.dept_code
group by de.dept_code
order by de.dept_code asc;
-- Q63
select d.dept_code, dept_name, concat(emp_fname," ",emp_lname) As "head_dept"
from department d
inner join professor p on p.emp_num = d.emp_num;

 -- Q64
select s.stu_num, stu_fname, stu_lname, count(c.class_code) As "total_class", sum(e.credit) AS "total_credit"
from student s
inner join enroll e on e.stu_num = s.stu_num
inner join class c on c.class_code = e.class_code
group by stu_num
having count(c.class_code)>5 and sum(e.credit)>17 
order by stu_num;
