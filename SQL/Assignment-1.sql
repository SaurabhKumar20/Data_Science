
---------------------------------ASSIGNMENT-1------------------------------------------------------------------
CREATE DATABASE DEMO;

USE DEMO;

CREATE TABLE EMP(
EID CHAR(5),
NAME VARCHAR(25),
ADDR VARCHAR(25),
CITY VARCHAR (15),
DOB DATE,
PHONE CHAR(15),
EMAIL VARCHAR(35));

DROP TABLE EMP;

INSERT INTO EMP
VALUES('E0001', 'Ishan Mehla', 'B-25 Sarojni Nagar', 'Delhi', '1988-12-12', '9213077584', 'ishanmehla@gmail.com');


INSERT INTO EMP
VALUES('E0002', 'Nitin Arora', 'B-25 Gandhi Nagar', 'Delhi', '1988-2-1', '9213090822', 'AroraNitin@gmail.com');


INSERT INTO EMP
VALUES('E0003', 'Neha Nandal', 'A-25 Moti Nagar', 'Delhi', '1989-2-22', '9096737584', 'NandalNeha@gmail.com');


INSERT INTO EMP
VALUES('E0004', 'Abhas Rao', 'A-25 Lodhi Road', 'Delhi', '1988-3-10', '9218287584', 'Abhas@gmail.com');


INSERT INTO EMP
VALUES('E0005', 'Aadil Rizvi', 'B-20 Lodhi Road', 'Delhi', '1988-12-12', '8213066584', 'Aadil@gmail.com');


INSERT INTO EMP
VALUES('E0006', 'Varun Gandotra', 'A-25 Greater Kailash', 'Delhi', '1988-3-10', '829007584', 'GandotraVarun@gmail.com');


INSERT INTO EMP
VALUES('E0007', 'Anuj Arora', 'B-20 Shrinivaspuri', 'Delhi', '1988-12-12', '8219834584', 'Anuj@gmail.com');

INSERT INTO EMP
VALUES('E0008', 'Manu Nandal', 'A-25 Pitampura', 'Delhi', '1988-3-10', '9218287584', 'Manu@gmail.com');

INSERT INTO EMP
VALUES('E0009', 'Manas Rao', 'A-25 Rohini', 'Delhi', '1988-3-10', '9981672584', 'Manas@gmail.com');


INSERT INTO EMP
VALUES('E0010', 'Farheen Rizvi', 'C-2 East of Kailash', 'Delhi', '1988-12-12', '8213066584', 'Aadil@gmail.com');


INSERT INTO EMP
VALUES('E0011', 'Anuja Sharma', 'B-20 Greenfield Colony', 'Haryana', '1988-12-12', '8218922584', 'Anuja@yahoo.co.in');


SELECT * FROM EMP;

--------------------------------------Assignment 1 ends-----------------------------------------------------------------


SELECT * FROM EMP
WHERE EMAIL LIKE 'A__r%';



SELECT TOP 4 * FROM EMP;

UPDATE EMP
SET CITY='PUNE'
WHERE NAME LIKE 'V%';


DELETE FROM EMP
WHERE ADDR LIKE 'Z%';

OR

DELETE EMP
WHERE ADDR LIKE 'Z%';


DELETE EMP;
--All records deleted, but the table still exists.


ALTER TABLE EMP
ADD GENDER CHAR(1);

--Update command is used to make changes into the data, Alter is used to make structural change

ALTER TABLE EMP
DROP COLUMN CITY;

--Add, Drop & Alter are fns of alter

ALTER TABLE EMP
ALTER COLUMN PHONE CHAR(10);


DROP DATABASE DEMO;
--will get an error as we are currently inside this database. We need to get out to destroy it.



TRUNCATE TABLE EMP;
--Works similar to Delete table

--diff bw Truncate and Delete is that Truncate doesn't accept where clause, whereas Delete does except 'Where' clause
--Truncate is DDL, as both chairs and people get removed, structural change is there. It releases memory.

COMMIT;--Means Save
ROLLBACK; --means UNDO
--will study these in transactions


-- SQL operators are reserved keyword or characters to help perform some calculations.


--/ and % operators returns quotient and remainder respectively


SELECT 6%4 AS 'HI';

SELECT * FROM EMP 
WHERE NAME <> 'Aadil Rizvi';

SELECT * FROM EMP_SAL
WHERE NOT SALARY > 100000;

--or

SELECT * FROM EMP_SAL
WHERE SALARY !> 100000;

SELECT * FROM EMP_SAL
WHERE SALARY between 100000 AND 200000; --both values inclusive

SELECT * FROM EMP_SAL
WHERE DEPT IN ('ADMIN','MIS','IT');


SELECT * FROM EMP_SAL
WHERE SALARY IS NULL;


--Displays all the Cities. Distinct to get unique values of the field.
SELECT DISTINCT CITY FROM EMP;


--Exists checks for the existence of data




------------------------ASSIGNMENT-2-----------------------------------------

CREATE TABLE EMP_SAL(
EID CHAR(5),
DEPT VARCHAR(20),
DOJ DATE,
SALARY INT
)

INSERT INTO EMP_SAL
VALUES('E0001', 'ADMIN', '2010-12-2', 904584);


INSERT INTO EMP_SAL
VALUES('E0002', 'MIS', '2018-2-6', '1134584');


INSERT INTO EMP_SAL
VALUES('E0003', 'HR', '2011-2-1', '834584');


INSERT INTO EMP_SAL
VALUES('E0004', 'ADMIN', '2012-5-1', '1434584');


INSERT INTO EMP_SAL
VALUES('E0005', 'IT', '2015-12-12', '1934584');

INSERT INTO EMP_SAL
VALUES('E0006', 'MANAGER', '2013-2-1', '1534584');

INSERT INTO EMP_SAL
VALUES('E0007', 'MANAGER', '2012-3-4', '1834584');

SELECT * FROM EMP_SAL;
 


SELECT * FROM EMP WHERE NAME LIKE '%SHARMA%';


UPDATE EMP_SAL
SET SALARY=SALARY*1.1 WHERE DEPT LIKE '%MANAGER%';

------------------------------Assignment-2 ends----------------------------------------------------------


--Normalisation is a set of rules, like traffic rules. Eliminates data redundancy(duplicacy of data),same data shudn be stored at multiple places . So, no repetetion.
--Thanks to normalisation, we can't put salary of non-employee into the emp_sal table. So, these set of rules into the structure is called Normalisation. Parent-child relationship etc. So, ensuring data dependencies make sense.

ALTER TABLE EMP
ALTER COLUMN PHONE VARCHAR(10) NOT NULL;

INSERT INTO EMP
VALUES('E0012', 'Tanuja Shastri', 'B-20 Andheri East', 'Mumbai', '1983-12-27', NULL , 'Anuja@yahoo.co.in');

INSERT INTO EMP
VALUES('E0012', 'Tanuja Shastri', 'B-20 Andheri East', 'Mumbai', '1983-12-27', '9671022584', 'Anuja@yahoo.co.in');

SELECT * FROM EMP;

--In case, null records are present in the data, prior to imposing not null constraint, it shows an error. u must remove such null records.
--try to introduce constraints while creation of the table

INSERT INTO EMP(EID,NAME, ADDR,CITY, DOB,EMAIL)
VALUES('E0012', 'Tanuja Shastri', 'B-20 Andheri East', 'Mumbai', '1983-12-27', 'Anuja@yahoo.co.in');
--Insert operation fails


--DEFAULT constraint can be simply added while creation of the table, with the value to be set as default

ALTER TABLE EMP_SAL
ADD CONSTRAINT DSAL DEFAULT 5000.00 FOR SALARY;
--Except not null, all constraints have similar syntax


ALTER TABLE EMP_SAL
ALTER COLUMN SALARY DECIMAL(18,2);

SELECT * FROM EMP;
 
UPDATE EMP
SET DOB='12-SEP-1988' WHERE NAME LIKE 'Ishan%';

--Default constraint setting while creation of table can also be done. CITY VARCHAR(20) DEFAULT 'DELHI'


--Unique constraint ka format alag hai

ALTER TABLE EMP
ADD CONSTRAINT myuniqueconstraint UNIQUE(EID);
--OR else while creation of tables..PHONE CHAR(15) UNIQUE also works
--duplicate EIDs not allowed

ALTER TABLE EMP
DROP CONSTRAINT myuniqueconstraint;

--SET meaningful constraint names

INSERT INTO EMP(NAME, ADDR,CITY, DOB,PHONE,EMAIL)
VALUES( 'Ravi Shastri', 'C-2 Thane', 'Nagpur', '1983-APR-7', '8678209481' ,'Rohit@rediffmail.com');
--Successfully ran, this means that Unique constraints can be NULL also, but only once.


DELETE FROM EMP
WHERE NAME LIKE 'Ravi%';

ALTER TABLE EMP_SAL
ADD CONSTRAINT CHKSAL CHECK(SALARY<2500000);
--Or while creation of table as CHECK(SALARY<2500000)



--Primary Keys uniquely identify a particular record
--A composite key in SQL can be defined as a combination of multiple columns, and these columns are used to identify all the rows that are involved uniquely. Even though a single column can't identify any row uniquely, a combination of over one column can uniquely identify any record.
--In a table representing students our primary key would now be firstName + lastName. Because students can have the same firstNames or the same lastNames these attributes are not simple keys. The primary key firstName + lastName for students is a composite key.]
--No. You cannot use more than 1 primary key in the table. for that you have composite key which is combination of multiple fields.

ALTER TABLE EMP
DROP myuniqueconstraint;
--had to remove uniqueconstraint, prior to setting EID as primary key

ALTER TABLE EMP
ALTER COLUMN EID CHAR(5) NOT NULL;

--first not null to be specified, prior to setting EID as primary key

ALTER TABLE EMP
ADD CONSTRAINT PKEID PRIMARY KEY(EID); 
--or simply write PRIMARY KEY(EID) in the end while creation of table EMP

SELECT * FROM EMP;

--All keys that may be considered to be the Primary keys, are called Candidate Keys..like EMAIL, EID etc. as these uniqely identify each record.
--In an election only one PM wins, out of multiple candidates.
--Trick to identify Primary key...like a person may not have an EMAIL. Possible, but less probable. 
--Multiple NULLs means duplcates are present. as in duplicate null phone numbers when persons get transferred.

--There can be only one primary key in the table, but multiple unique keys are possible. Unique keys do allow null value.


--FOREIGN KEY is used to link two tables together. This is sometimes called a referencing key.

--ALTER TABLE EMP_SAL
--ADD CONSTRAINT FKID FOREIGN KEY(EID) REFERENCES EMP(EID);
--OR
--EID CHAR(5) REFERENCES EMP(ID),...while creation of table


--giving salary to an employee who doesn't exist...is an example of Powerless structures
--Constraints like Primary Key and Foreign Key gives power to the structure. 
--This resolves Salary wali problem...avoids adding random records into EMP_sal table..allows only those records in Emp_Sal table that has entry in the emp table




------------------------------------------ASSIGNMENT-3----------------------------------------------------------------------------------------

CREATE DATABASE ASSIGNMENT3;

USE ASSIGNMENT3;

CREATE TABLE EMP(
EMPID CHAR(5),
NAME VARCHAR(15) NOT NULL,
ADDR VARCHAR(30) CHECK(ADDR!='UTTAM NAGAR'),
CITY VARCHAR(12) CHECK(CITY IN ('DEL','GGN','FBD','NOIDA')),
PHNO CHAR(12) UNIQUE,
EMAIL VARCHAR(30) CHECK(EMAIL LIKE '%GMAIL%' OR EMAIL LIKE '%YAHOO%'),
DOB DATE,
PRIMARY KEY(EMPID));

ALTER TABLE EMP
ADD CONSTRAINT CHKDOB CHECK(DOB<='01-JAN-1990');

SELECT * FROM EMP;

INSERT INTO EMP
VALUES('E0001', 'Piyush Kapur', 'B-25 Mayur Vihar', 'DEL', '7213005544', 'KapurPiyush@gmail.com', '1988-5-2');



CREATE TABLE EMP_SAL(
EMPID CHAR(5) REFERENCES EMP(EMPID),
DEPT VARCHAR(12) CHECK(DEPT IN ('HR','MIS','OPS','IT ADMIN', 'TEMP')) DEFAULT 'TEMP',
DESI VARCHAR(10) CHECK(DESI IN ('ASSO','MGR','VP','DIR')),
BASIC_ DECIMAL(18,2) CHECK(BASIC_>=20000),
DOJ DATE
);

SELECT * FROM EMP_SAL;

-------------------------------------ASSIGNMENT-3 ENDS----------------------------------------------------


USE DEMO;


--NOTE: CONSTRAINT CHK_PERSON CHECK(AGE>=18 AND CITY='Sandness')....this can be added in the last line while creating table.
--Defines check constraint on multiple columns.

SELECT * FROM EMP_SAL;


--There can be more than 1 Foreign keys in the relation, can have null, duplicate values.
--Foreign key is used to create a link between two relations.


