-- Q65 
select professor.EMP_FNAME,professor.EMP_LNAME,professor.DEPT_CODE,department.DEPT_NAME
from professor
join department on department.DEPT_CODE = professor.DEPT_CODE
where department.dept_code = (select d2.dept_code
from department d2
where d2.dept_code = "CIS") and professor.emp_num != 209;
-- Q66 
select STU_FNAME,count(STU_FNAME) as num_used
from(
select stu_fname from student
union all
select emp_fname from professor) a
group by STU_FNAME
having count(stu_fname) > 1
order by STU_FNAME asc;
-- Q67 
select course.COURSE_CODE,COURSE_NAME,count(class_code) as num_class
from course
left outer join class on course.COURSE_CODE = class.COURSE_CODE
group by COURSE_CODE
HAVING count(class_code) = 0;
-- Q68
SELECT EMP_FNAME,EMP_LNAME,year(curdate())-year(EMP_DOB) as "AGE"
FROM professor
WHERE year(curdate())-year(EMP_DOB) < (SELECT AVG(year(curdate())-year(EMP_DOB)) FROM professor)
order by year(curdate())-year(EMP_DOB) asc;
-- Q69
select s.stu_num, stu_fname, stu_lname
from student s
left outer join enroll e on e.stu_num = s.stu_num
group by s.stu_num
having count(e.stu_num) = 0;
-- Q70 
select course_name
from course co
left outer join class on class.course_code = co.course_code 
group by course_name
having count(class.COURSE_CODE) = 0;
-- Q71
select concat(emp_fname," ",emp_lname) As "Fullname", count(c.emp_num) As "num_class"
from class c 
right outer join professor p on p.emp_num = c.emp_num
group by concat(emp_fname,"",emp_lname)
having count(c.emp_num) < 2
order by p.emp_num asc;
-- Q72 
select emp_fname, emp_lname, dept_name
from student s
right outer join professor p on p.emp_num = s.emp_num 
left outer join department d on d.dept_code = p.dept_code
group by p.emp_num
having count(s.emp_num) = 0 ;
-- Q73
select stu_fname As "First name", stu_lname AS " Last name"
from student
where dept_code = "CIS" 
union all
select emp_fname As "First name", emp_lname AS " Last name"
from professor
where DEPT_CODE = "CIS";
-- Q74
select c.COURSE_CODE, course_name
from class c
inner join course co on c.COURSE_CODE = co.COURSE_CODE
where CLASS_SECTION = 1 and c.COURSE_CODE  not in
(select c.COURSE_CODE
from class c
where CLASS_SECTION = 2) 
order by course_code asc;
-- Q75
select c.emp_num, emp_fname, emp_lname, count(class_code)
from class c
inner join professor p on p.emp_num = c.emp_num
group by emp_num
having count(class_code) >
(select avg(count_avg) from (select count(class_code) As count_avg from class group by emp_num) a);
-- Q76
select distinct stu_fname,stu_lname
from student 
where length(stu_lname) <
(select avg(length(stu_lname))
from student)
order by stu_fname asc;
-- Q77
select a.stu_fname, a.stu_lname
from student a
where length(stu_fname) > length(stu_lname)
order by stu_fname asc;
-- Q78
select d.dept_code, dept_name
from department d
join professor p on d.dept_code = p.dept_code
join student s on s.dept_code = d.dept_code
group by dept_code
having count(distinct p.emp_num) = count(distinct s.stu_num)
order by dept_code asc;
-- Q79
select  distinct s.stu_num, s.stu_fname, s.stu_lname, s.stu_gpa, s.dept_code, dept_name
from student s
join department d on s.dept_code = d.dept_code
join (select distinct dept_code, avg(stu_gpa) as gpa -- avg per dept_code
	from student 
	group by dept_code) a on s.dept_code = a.dept_code
where s.stu_gpa > a.gpa
order by s.dept_code asc;
-- Q80
select a.stu_num, a.stu_fname, a.stu_lname, a.stu_gpa, a.dept_code, d.dept_name
from student a
join department d on a.dept_code = d.dept_code
left outer join student b on (a.dept_code) = b.dept_code AND (a.stu_gpa < b.stu_gpa)
where (b.stu_gpa is null) AND (a.stu_gpa is not null)
order by a.dept_code asc; 