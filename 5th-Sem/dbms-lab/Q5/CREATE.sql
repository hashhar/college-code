-- Create Database if it does not exist and then use it
DROP DATABASE `Ashhar13BCS0015 - Q5`;
CREATE DATABASE `Ashhar13BCS0015 - Q5`;
USE `Ashhar13BCS0015 - Q5`;

-- Create Table Employee
CREATE TABLE Employee0015 (
	fname VARCHAR(50),
	minit VARCHAR(50),
	lname VARCHAR(50),
	ssn INT PRIMARY KEY,
	bdate DATE,
	address VARCHAR(500),
	sex VARCHAR(7),
	salary INT,
	super_ssn INT,
	dno INT
);

-- Create Table Department
CREATE TABLE Department0015 (
	dname VARCHAR(100),
	dnumber INT PRIMARY KEY,
	mgr_ssn INT,
	mgr_start_date DATE,
	FOREIGN KEY(mgr_ssn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Table Dept_Locations
CREATE TABLE Dept_Locations0015 (
	dnumber INT,
	dlocation VARCHAR(100),
	FOREIGN KEY(dnumber) REFERENCES Department0015(dnumber) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Table Project
CREATE TABLE Project0015 (
	pname VARCHAR(100),
	pnumber INT PRIMARY KEY,
	plocation VARCHAR(100),
	dnum INT,
	FOREIGN KEY(dnum) REFERENCES Department0015(dnumber) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Table Works_On
CREATE TABLE Works_On0015 (
	essn INT,
	pno INT,
	hours INT,
	FOREIGN KEY(essn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(pno) REFERENCES Project0015(pnumber) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Table Dependent
CREATE TABLE Dependent0015 (
	essn INT,
	dependent_name VARCHAR(50) PRIMARY KEY,
	sex VARCHAR(7),
	bdate DATE,
	relationship VARCHAR(50),
	FOREIGN KEY(essn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE
);

-- ALTER TABLE Employee0015 ADD CONSTRAINT FOREIGN KEY(super_ssn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Employee0015 ADD CONSTRAINT FOREIGN KEY(dno) REFERENCES Department0015(dnumber) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Department0015 add constraint FOREIGN KEY(mgr_ssn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Dept_Locations0015 ADD constraint FOREIGN KEY(dnumber) REFERENCES Department0015(dnumber) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Project0015 ADD CONSTRAINT FOREIGN KEY(dnum) REFERENCES Department0015(dnumber) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Works_On0015 ADD CONSTRAINT FOREIGN KEY(essn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Works_On0015 ADD CONSTRAINT FOREIGN KEY(pno) REFERENCES Project0015(pnumber) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE Dependent0015 ADD CONSTRAINT FOREIGN KEY(essn) REFERENCES Employee0015(ssn) ON UPDATE CASCADE ON DELETE CASCADE;