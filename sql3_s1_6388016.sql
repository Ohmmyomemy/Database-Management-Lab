select concat(EMP_FNAME," ",EMP_LNAME) as "Name", (year(curdate())-year(EMP_DOB)) as "Age"
from professor
order by Age desc limit 10;

select truncate(avg((STU_GPA)),2) as "Average CIS GPA"
from student
where DEPT_CODE = 'CIS';

select count(*) as "# of Courses"
from course
where CRS_CREDIT = 3 and DEPT_CODE = "CIS"
or CRS_CREDIT = 3 and DEPT_CODE = "MATH"
or CRS_CREDIT = 3 and DEPT_CODE = "BIOL"
or CRS_CREDIT = 3 and DEPT_CODE = "ENG";

select DEPT_CODE as "dept_code", count(*) as "Total # of Student"
from student
where DEPT_CODE = "CIS"
or DEPT_CODE = "MATH"
or DEPT_CODE = "BIOL"
or DEPT_CODE = "ENG"
group by DEPT_CODE;

select DEPT_CODE as "dept_code", truncate(avg((STU_GPA)),2) as "Average GPA"
from student
group by DEPT_CODE
order by truncate(avg((STU_GPA)),2) desc limit 11;

select DEPT_CODE as "dept_code", truncate(avg((STU_GPA)),2) as "Average GPA"
from student
group by DEPT_CODE
having avg(STU_GPA) >= 3.00
order by avg(STU_GPA) desc;

select STU_CLASS as "stu_class",count(STU_GPA) as "Total students with GPA",round(avg((STU_GPA)),2) as "Average class GPA"
from student
group by STU_CLASS
order by STU_CLASS asc ;

select STU_NUM as "stu_num",
concat(STU_FNAME," ",STU_LNAME) as "student", 
concat(EMP_FNAME," ",EMP_LNAME) as "advisor"
from student, professor
where  student.EMP_NUM = professor.EMP_NUM and EMP_FNAME like 'A%' 
or student.EMP_NUM = professor.EMP_NUM and EMP_FNAME like 'P%'
order by EMP_FNAME asc;

select  professor.EMP_NUM as "emp_num",
professor.DEPT_CODE as "dept_code",
concat(professor.EMP_FNAME," ",professor.EMP_LNAME) as "professor",
count(*) as "Total classes"
from  professor,class
where class.EMP_NUM = professor.EMP_NUM 
group by EMP_NUM
having count(*) > 3
order by professor.DEPT_CODE limit 2;

select student.STU_FNAME as "stu_fname",
student.STU_LNAME as "stu_lname",
class.CLASS_CODE as "class_code",
enroll.GRADE as "grade",
class.COURSE_CODE as "course_code"
from student
inner join enroll on student.STU_NUM = enroll.STU_NUM 
inner join class on class.CLASS_CODE = enroll.CLASS_CODE
where COURSE_CODE like "CIS%"
order by COURSE_CODE ,enroll.GRADE asc ;


