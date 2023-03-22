/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6388016
--   Fullname: Thanawath Huayhongthong
--   Section: 1
------------------------------------------------------------- */
DROP DATABASE IF EXISTS tinycompany; 
CREATE DATABASE IF NOT EXISTS tinycompany;
USE tinycompany;

-- Department Table 
CREATE TABLE department(
	dnumber		INT 		 PRIMARY KEY,  -- dnumber is a primary key
	dname		VARCHAR(20)  NOT NULL,
	location	VARCHAR(100), -- location is nullable 
	CONSTRAINT chk_dnumber CHECK (dnumber >= 1 AND dnumber <=20 ) -- dnumber range from 1 to 20
);
CREATE TABLE employee(
	fname		VARCHAR(20)	NOT NULL,
	lname		VARCHAR(20)	NOT NULL,
    ssn			CHAR(9)		PRIMARY KEY,
    bdate		DATE		NOT NULL,
    sex			CHAR(1)		NOT NULL,
    salary		DECIMAL(12,2),
	dept_no		INT,
    CONSTRAINT FK_deptN FOREIGN KEY (dept_no)
    REFERENCES department(dnumber),
    CONSTRAINT chk_sex CHECK (sex='M' or sex='F')
);

CREATE TABLE Project (
	pnumber		int			PRIMARY KEY,
    pname		VARCHAR(50)	NOT NULL,
    dept_no		int	,
    CONSTRAINT FK_deptNN FOREIGN KEY (dept_no)
    REFERENCES department(dnumber)
);
CREATE TABLE Assignment(
	essn		char(9)	unique NOT NULL,
    PROJ_NO		int		unique NOT NULL,
    primary key(essn,PROJ_NO),
    hours		decimal(9,2),
	hourly_rate decimal(12,2),
	CONSTRAINT FK_Essnn foreign key (essn)
    references employee(ssn),
    CONSTRAINT FK_PROJN FOREIGN KEY (PROJ_NO)
    REFERENCES Project(pnumber)  
);

-- Write your DDL the remaining tables here 
-- Hint: Review the CREATE sequence, i.e., which tables should be created first



