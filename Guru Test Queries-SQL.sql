CREATE DATABASE Guru_Sample;
USE Guru_Sample;

CREATE TABLE Student
(
	Roll	VARCHAR(6),
	Name	VARCHAR(20),
	Gender	CHAR(1),
	CGPA	FLOAT(4)
);

SELECT * FROM Student;

INSERT INTO Student
VALUES ( 100 , 'Guru Bala Vignesh', 'M'	, 80.12);

DELETE Student;

INSERT INTO Student
VALUES 
( 100 , 'Guru Bala Vignesh', 'M'	, 80.12),
( 101 ,	'Santhoshiya' , 'F' , 83);

CREATE TABLE College_Student
(
	Roll_number	VARCHAR(6),
	Name		VARCHAR(20),
	City		VARCHAR(20),
	Age			CHAR(6),
	CGPA		FLOAT(4),
);

INSERT INTO College_Student
VALUES
(101, 'Ram' , 'Bhuvaneshwar' , 19 , 9.0),
(102, 'Hari' , 'Bhuvaneshwar' , NULL , 6.7),
(103, 'Uday' , 'Jharkhand' , 20 , 8.97),
(104, 'Vikas' , 'Uttar Pradesh' , 19 , 8.5),
(105, 'Sweta' , 'Ranchi' , 19 , 9.2),
(106, 'Yogesh' , 'Rajasthan' , 18 , 7.9),
(210, 'Smriti' , 'Delhi' , 20 , 8.99),
(211, 'Sudam' , 'Cuttack' , 21 , 8.6),
(212, 'Vikas' , 'Kolkata' , 23 , 5.98),
(165, 'Manish' , NULL , 19 , 9.15);


SELECT * FROM College_Student;

SELECT Name , CGPA AS New_CGPA FROM College_Student;

SELECT CONCAT(Name , ' & ', City) FROM College_Student;

SELECT CONCAT(Name , ' From City- ', City) FROM College_Student;



SELECT * FROM College_Student WHERE City= 'Bhuvaneshwar';

SELECT * FROM College_Student WHERE CGPA>8;


SELECT * FROM College_Student WHERE CGPA>8 AND Age>19;

SELECT * FROM College_Student WHERE CGPA>8 AND Age>=19;

SELECT * FROM College_Student WHERE CGPA>8 OR Age>19;

SELECT * FROM College_Student WHERE CGPA>8 AND Age !=19;

SELECT * FROM College_Student WHERE Name LIKE 'S%'; /* Returns with starting letter as 's' and one or more characters */


SELECT * FROM College_Student WHERE Name LIKE '%S'; /* Returns ending letter as 's' with one or more characters at the beginning */




INSERT INTO College_Student
VALUES
(306, 'S' , 'Bhuvaneshwar' , 19 , 9.0);

SELECT * FROM College_Student;

INSERT INTO College_Student
VALUES
(307, 'SA' , 'Bhuvaneshwar' , 20 , 8.0);

SELECT * FROM College_Student WHERE Name LIKE 'S_'; /* Returns with starting letter as 's' and followed by only one character */

SELECT * FROM College_Student WHERE Name LIKE '%_S_'; /* Returns one or more characters with last before character as letter 's' */

SELECT * FROM College_Student WHERE City IN ('Rajasthan', 'Bhuvaneshwar');

SELECT * FROM College_Student WHERE AGE BETWEEN 19 AND 21 ; /* returns age from 19 to 21 */


SELECT * FROM College_Student WHERE AGE BETWEEN 19 OR 21 ; /* returns error since in between only and operator works*/

SELECT * FROM College_Student WHERE AGE is NULL ;



SELECT * FROM College_Student ORDER BY Age ;

SELECT * FROM College_Student ORDER BY Age ,CGPA DESC;

SELECT * FROM College_Student ORDER BY Age DESC ,CGPA DESC; /* returns 1st age in desc and CGPA DESC */



ALTER TABLE College_Student ADD Remarks TEXT; /* returns adding a column with name as Remarks and with datatype */

SELECT * FROM College_Student;

ALTER TABLE College_Student ALTER Column Remarks varchar(20); 

ALTER TABLE College_Student DROP Column Remarks;

EXEC sp_rename 'College_Student.Roll_number' , 'Roll_No' ;

EXEC sp_rename 'College_Student' , 'CollegeStudent_Detail' ;

EXEC sp_rename 'CollegeStudent_Detail' , 'College_Student';

UPDATE College_Student SET Age=24 WHERE AGE IS NULL;

DROP TABLE dbo.Student;  /* Delete the entire table including schema */

TRUNCATE TABLE dbo.Student; /* Delete entire values of the table without disturbing schema and table wont be deleted */

DELETE FROM dbo.Student WHERE Roll=100;

DELETE FROM dbo.Student;


/* CONSTRAINTS*/

CREATE TABLE ITEM_MASTER
(
	Item_no			INT,
	Name			VARCHAR(20),
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT,
	Reorder_qty		INT,
	Rate			INT,
)

DROP TABLE ITEM_MASTER;

USE Guru_Sample;

SELECT * FROM ITEM_MASTER;

DROP TABLE ITEM_MASTER;

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Name			VARCHAR(20),
	Qty_on_hand		INT,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
)

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Name			VARCHAR(20) CONSTRAINT c2 UNIQUE,
	Qty_on_hand		INT NOT NULL,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,
);

ALTER TABLE ITEM_MASTER 
ALTER COLUMN Qty_on_hand INT;    /* NOT NULL Constraint can't be dropped rather can be alter the column type from NOT NULL to NULL */

INSERT INTO ITEM_MASTER
VALUES
(100, 'AMUL' , 23, 'M' , 'KG' , 33, 21, 250 );

INSERT INTO ITEM_MASTER
VALUES
(101, 'CHOCOLATE', 13, 'F', 'qty', 60, 10, 50);

INSERT INTO ITEM_MASTER
VALUES
(103, 'CHOCOLATE', 15, 'F', 'qty', 60, 10, 50); /* Returns error since violation of Unique key constraint */

SELECT * FROM ITEM_MASTER;

ALTER TABLE ITEM_MASTER 
DROP CONSTRAINT c2 ;

CREATE TABLE ITEM_MASTER
(
	Item_no			INT NOT NULL,
	Item_Name			VARCHAR(20) ,
	Qty_on_hand		INT NOT NULL,
	Category		CHAR(1),
	Unit_measure	CHAR(4),
	Reorder_Lvl		INT NOT NULL,
	Reorder_qty		INT NOT NULL,
	Rate			INT NOT NULL,

);

ALTER TABLE ITEM_MASTER 
ADD CONSTRAINT ce2 UNIQUE(Item_Name,Item_no);

ALTER TABLE ITEM_MASTER
DROP CONSTRAINT ce2;

