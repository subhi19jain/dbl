(base) csl4@csl4-HP-280-Pro-G5-MT-Business-PC:~$ sudo su
[sudo] password for csl4: 
Sorry, try again.
[sudo] password for csl4: 
root@csl4-HP-280-Pro-G5-MT-Business-PC:/home/csl4# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE student_tb;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASE 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DBMSPrac           |
| Library            |
| customer           |
| mysql              |
| performance_schema |
| student_tb         |
| sys                |
+--------------------+
8 rows in set (0.03 sec)

mysql> USE student_tb;
Database changed
mysql> CREATE TABLE stud(
    -> snoint,
    -> sname varchar(20),gender char(1),dob date);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '
sname varchar(20),gender char(1),dob date)' at line 2
mysql> CREATE TABLE stud( sno int, sname varchar(20),gender char(1),dob date);
Query OK, 0 rows affected (0.19 sec)

mysql> SELECT*
    -> FROM stud;
Empty set (0.01 sec)

mysql> INSERT INTO stud
    -> VALUES(1,'Ram','m','10-02-05');
Query OK, 1 row affected (0.05 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2025-07-01 11:24:58 |
+---------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO stud
    -> VALUES(2,'Tanush','m','05-01-02'),(3,'Haripriya','f','07-05-09');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> TEE rnd.txt
Logging to file 'rnd.txt'
mysql> SELECT * FROM stud
    -> SELECT * FROM stud;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM stud' at line 2
mysql> SELECT*
    -> FROM stud;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    1 | Ram       | m      | 2010-02-05 |
|    2 | Tanush    | m      | 2005-01-02 |
|    3 | Haripriya | f      | 2007-05-09 |
+------+-----------+--------+------------+
3 rows in set (0.01 sec)

mysql> NO TEE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NO TEE' at line 1
mysql> SELECT*
    -> FROM stud;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    1 | Ram       | m      | 2010-02-05 |
|    2 | Tanush    | m      | 2005-01-02 |
|    3 | Haripriya | f      | 2007-05-09 |
+------+-----------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT sno,sname
    -> FROM stud;
+------+-----------+
| sno  | sname     |
+------+-----------+
|    1 | Ram       |
|    2 | Tanush    |
|    3 | Haripriya |
+------+-----------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE temp( sno int ,sname varchar(20));
int ,sname varchar(20));
^C
mysql> CREATE TABLE s
    -> (sno int ,
    -> sname varchar(20));
Query OK, 0 rows affected (0.22 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_student_tb |
+----------------------+
| s                    |
| stud                 |
+----------------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO s
    -> VALUES 
    -> SELECT sno ,sname FROM stud;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT sno ,sname FROM stud' at line 3
mysql> INSERT INTO s  SELECT sno ,sname FROM stud;
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SHOW * FROM TEMP;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM TEMP' at line 1
mysql> SHOW * FROM s;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM s' at line 1
mysql> SELECT* 
    -> FROM s;
+------+-----------+
| sno  | sname     |
+------+-----------+
|    1 | Ram       |
|    2 | Tanush    |
|    3 | Haripriya |
+------+-----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO stud
    -> VALUES(4,'Geeta');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO stud
    -> (sno , sname ) VALUES (4,'Geeta');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT*
    -> FROM stud;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    1 | Ram       | m      | 2010-02-05 |
|    2 | Tanush    | m      | 2005-01-02 |
|    3 | Haripriya | f      | 2007-05-09 |
|    4 | Geeta     | NULL   | NULL       |
+------+-----------+--------+------------+
4 rows in set (0.00 sec)

mysql> SELECT*
    -> FROM stud 
    -> WHERE sno > 2;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    3 | Haripriya | f      | 2007-05-09 |
|    4 | Geeta     | NULL   | NULL       |
+------+-----------+--------+------------+
2 rows in set (0.00 sec)

mysql> SELECT*
    -> FROM stud
    -> WHERE gender = 'm';
+------+--------+--------+------------+
| sno  | sname  | gender | dob        |
+------+--------+--------+------------+
|    1 | Ram    | m      | 2010-02-05 |
|    2 | Tanush | m      | 2005-01-02 |
+------+--------+--------+------------+
2 rows in set (0.01 sec)

mysql> SELECT* 
    -> FROM stud
    -> WHERE sname = 'ram';
+------+-------+--------+------------+
| sno  | sname | gender | dob        |
+------+-------+--------+------------+
|    1 | Ram   | m      | 2010-02-05 |
+------+-------+--------+------------+
1 row in set (0.00 sec)

mysql> INSERT INTO stud
    -> VALUES 
    -> (1,'Ram','m','10-02-05');
Query OK, 1 row affected (0.04 sec)

mysql> SELECT DISTINCT * FROM stud;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    1 | Ram       | m      | 2010-02-05 |
|    2 | Tanush    | m      | 2005-01-02 |
|    3 | Haripriya | f      | 2007-05-09 |
|    4 | Geeta     | NULL   | NULL       |
+------+-----------+--------+------------+
4 rows in set (0.00 sec)

mysql> SELECT DISTINCT sno FROM stud;
+------+
| sno  |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
+------+
4 rows in set (0.00 sec)

mysql> UPDATE stud
    -> SET dob='12-03-04'
    -> WHERE dob='10-02-05';
Query OK, 2 rows affected (0.04 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT DISTINCT * FROM stud;
+------+-----------+--------+------------+
| sno  | sname     | gender | dob        |
+------+-----------+--------+------------+
|    1 | Ram       | m      | 2012-03-04 |
|    2 | Tanush    | m      | 2005-01-02 |
|    3 | Haripriya | f      | 2007-05-09 |
|    4 | Geeta     | NULL   | NULL       |
+------+-----------+--------+------------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE stud
    -> ADD salary int ;
Query OK, 0 rows affected (0.46 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT * FROM stud;
+------+-----------+--------+------------+--------+
| sno  | sname     | gender | dob        | salary |
+------+-----------+--------+------------+--------+
|    1 | Ram       | m      | 2012-03-04 |   NULL |
|    2 | Tanush    | m      | 2005-01-02 |   NULL |
|    3 | Haripriya | f      | 2007-05-09 |   NULL |
|    4 | Geeta     | NULL   | NULL       |   NULL |
+------+-----------+--------+------------+--------+
4 rows in set (0.00 sec)

mysql> DESCRIBE stud;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| sno    | int(11)     | YES  |     | NULL    |       |
| sname  | varchar(20) | YES  |     | NULL    |       |
| gender | char(1)     | YES  |     | NULL    |       |
| dob    | date        | YES  |     | NULL    |       |
| salary | int(11)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE EMPLOYEE(
    -> employee varchar,
    -> employee varchar(20),
    -> works varchar(20),
    -> company varchar(20),
    -> manages varchar(20));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '
employee varchar(20),
works varchar(20),
company varchar(20),
manages varchar(2' at line 2
mysql> CREATE TABLE EMPLOYEE (
    -> PRIMARY KEY (e_id,name)
    -> employee varchar(20), works varchar(20), company varchar(20), manages varchar(20));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employee varchar(20), works varchar(20), company varchar(20), manages varchar(20' at line 3
mysql> CREATE TABLE EMPLOYEE (
    -> e_id int PRIMARY KEY,
    -> name varchar (20),
    -> street varchar(20),
    -> city varchar(20));
Query OK, 0 rows affected (0.22 sec)

mysql> CREATE TABLE WORKS(
    -> e_id int, company_name varchar(20), salary int );
Query OK, 0 rows affected (0.30 sec)

mysql> CREATE TABLE COMPANY ( 
    -> company_name , city);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ' city)' at line 2
mysql> CREATE TABLE COMPANY (
    -> company_name varchar(20), city varchar(20));
Query OK, 0 rows affected (0.22 sec)

mysql> CREATE TABLE MANAGES (
    -> e_id int , dept_name varchar(20));
Query OK, 0 rows affected (0.24 sec)

mysql> SELECT* 
    -> FROM EMPLOYEE;
Empty set (0.00 sec)

mysql> INSERT INTO EMPLOYEE
    -> VALUES ('s@gmail.com','ram','mg','pune');
ERROR 1366 (HY000): Incorrect integer value: 's@gmail.com' for column 'e_id' at row 1
mysql> INSERT INTO EMPLOYEE VALUES ('1','ram','mg','pune');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO EMPLOYEE VALUES ('2','rishi','fc','pune'),('3','somil','break','mumbai'),('4','tanmay','won','mumbai');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT * FROM EMPLOYEE ;
+------+--------+--------+--------+
| e_id | name   | street | city   |
+------+--------+--------+--------+
|    1 | ram    | mg     | pune   |
|    2 | rishi  | fc     | pune   |
|    3 | somil  | break  | mumbai |
|    4 | tanmay | won    | mumbai |
+------+--------+--------+--------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE EMPLOYEE
    -> ADD E_id varchar(20);
ERROR 1060 (42S21): Duplicate column name 'E_id'
mysql> ALTER TABLE EMPLOYEE ADD email_id  varchar(20);
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE stud SET email_id='r@gmail.com' WHERE email_id ='NULL';
ERROR 1054 (42S22): Unknown column 'email_id' in 'where clause'
mysql> UPDATE stud SET email_id='r@gmail.com' WHERE email_id is NULL;
ERROR 1054 (42S22): Unknown column 'email_id' in 'where clause'
mysql> DESCRIBE EMPLOYEE;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| e_id     | int(11)     | NO   | PRI | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| street   | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | NULL    |       |
| email_id | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET email_id='r@gmail.com' WHERE email_id is NULL;
Query OK, 4 rows affected (0.04 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> SELECT DISTINCT * FROM EMPLOYEE ;
+------+--------+--------+--------+-------------+
| e_id | name   | street | city   | email_id    |
+------+--------+--------+--------+-------------+
|    1 | ram    | mg     | pune   | r@gmail.com |
|    2 | rishi  | fc     | pune   | r@gmail.com |
|    3 | somil  | break  | mumbai | r@gmail.com |
|    4 | tanmay | won    | mumbai | r@gmail.com |
+------+--------+--------+--------+-------------+
4 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET email_id='r@gmail.com' WHERE name is ram;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ram' at line 1
mysql> UPDATE stud SET email_id='s@gmail.com' WHERE name = 'ram';
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> UPDATE stud SET email_id='s@gmail.com' WHERE name ="ram";
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> UPDATE stud SET email_id='s@gmail.com' WHERE city ="pune";
ERROR 1054 (42S22): Unknown column 'city' in 'where clause'
mysql> UPDATE EMPLOYEE SET email_id='s@gmail.com' WHERE city ="pune";
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT DISTINCT * FROM EMPLOYEE;
+------+--------+--------+--------+-------------+
| e_id | name   | street | city   | email_id    |
+------+--------+--------+--------+-------------+
|    1 | ram    | mg     | pune   | s@gmail.com |
|    2 | rishi  | fc     | pune   | s@gmail.com |
|    3 | somil  | break  | mumbai | r@gmail.com |
|    4 | tanmay | won    | mumbai | r@gmail.com |
+------+--------+--------+--------+-------------+
4 rows in set (0.00 sec)

mysql> rd
    -> tee rd
    -> tee rd;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rd
tee rd
tee rd' at line 1
mysql> tee rd
Loggin to file 'rd'
mysql> (base) csl4@csl4-HP-280-Pro-G5-MT-Business-PC:~$ sudo su 
[sudo] password for csl4: 
root@csl4-HP-280-Pro-G5-MT-Business-PC:/home/csl4# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DBMSPrac           |
| Demo               |
| Library            |
| banking            |
| customer           |
| mysql              |
| performance_schema |
| student            |
| student_it         |
| student_tb         |
| sys                |
+--------------------+
12 rows in set (0.05 sec)

mysql> SELECT DISTINCT * FROM EMPLOYEE;
ERROR 1046 (3D000): No database selected
mysql> USE student_tb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT* FROM EMPLOYEE;
+------+--------+--------+----------+------------------+
| e_id | name   | street | city     | email_id         |
+------+--------+--------+----------+------------------+
|    1 | ram    | mg     | pune     | ram@gmail.com    |
|    2 | rishi  | fc     | pune     | rishi@gmail.com  |
|    3 | somil  | break  | mumbai   | somil@gmail.com  |
|    4 | tanmay | won    | mumbai   | tanmay@gmail.com |
|    5 | ramesh | bakshi | jamnagar | ramesh@gmail.com |
|    6 | sunita | tano   | jaipur   | sunita@gmail.com |
+------+--------+--------+----------+------------------+
6 rows in set (0.00 sec)

mysql> SELECT* FROM WORKS;
Empty set (0.00 sec)

mysql> INSERT INTO WORKS VALUES ('rishi@gmail.com','oracle',100);
ERROR 1366 (HY000): Incorrect integer value: 'rishi@gmail.com' for column 'e_id' at row 1
mysql> INSERT INTO WORKS VALUES (1,'oracle',100);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT* FROM WORKS;
+------+--------------+--------+
| e_id | company_name | salary |
+------+--------------+--------+
|    1 | oracle       |    100 |
+------+--------------+--------+
1 row in set (0.00 sec)

mysql> ALTER TABLE EMPLOYEE ADD email_id varchar(20);
ERROR 1060 (42S21): Duplicate column name 'email_id'
mysql> ALTER TABLE WORKS ADD email_id varchar(20);
Query OK, 0 rows affected (0.51 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE WORKS SET email_id ='rishi@gmail.com' WHERE email_id='NULL';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT* FROM WORKS;
+------+--------------+--------+----------+
| e_id | company_name | salary | email_id |
+------+--------------+--------+----------+
|    1 | oracle       |    100 | NULL     |
+------+--------------+--------+----------+
1 row in set (0.00 sec)

mysql> UPDATE WORKS SET email_id ='rishi@gmail.com' WHERE email_id is NULL
    -> ;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT DISTINCT* FROM WORKS;
+------+--------------+--------+-----------------+
| e_id | company_name | salary | email_id        |
+------+--------------+--------+-----------------+
|    1 | oracle       |    100 | rishi@gmail.com |
+------+--------------+--------+-----------------+
1 row in set (0.00 sec)

mysql> INSERT INTO WORKS VALUES (2,'Mastercard',200000,'tanmay@gmail.com')(3,'ZS',500000,'sunita@gmail.com');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(3,'ZS',500000,'sunita@gmail.com')' at line 1
mysql> INSERT INTO WORKS VALUES (2,'Mastercard',200000,'tanmay@gmail.com'),(3,'ZS',500000,'sunita@gmail.com');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM WORKS;                                                +------+--------------+--------+------------------+
| e_id | company_name | salary | email_id         |
+------+--------------+--------+------------------+
|    1 | oracle       |    100 | rishi@gmail.com  |
|    2 | Mastercard   | 200000 | tanmay@gmail.com |
|    3 | ZS           | 500000 | sunita@gmail.com |
+------+--------------+--------+------------------+
3 rows in set (0.00 sec)

mysql> UPDATE WORKS SET salary = 1000000  WHERE salary is 100 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '100' at line 1
mysql> UPDATE WORKS SET salary = 1000000  WHERE salary = 100 ;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT DISTINCT* FROM WORKS;                                                +------+--------------+---------+------------------+
| e_id | company_name | salary  | email_id         |
+------+--------------+---------+------------------+
|    1 | oracle       | 1000000 | rishi@gmail.com  |
|    2 | Mastercard   |  200000 | tanmay@gmail.com |
|    3 | ZS           |  500000 | sunita@gmail.com |
+------+--------------+---------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT* FROM COMPANY ;
Empty set (0.00 sec)

mysql> ALTER TABLE MANAGES ADD email_id varchar(20);
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO COMPANY VALUES ('oracle','pune');
Query OK, 1 row affected (0.04 sec)

mysql> SELECT DISTINCT* FROM COMPANY ;
+--------------+------+
| company_name | city |
+--------------+------+
| oracle       | pune |
+--------------+------+
1 row in set (0.00 sec)

mysql> INSERT INTO MANAGES VALUES (1,'rishi@gmail.com','HR');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT DISTINCT* FROM MANAGES  ;
+------+-----------------+----------+
| e_id | dept_name       | email_id |
+------+-----------------+----------+
|    1 | rishi@gmail.com | HR       |
+------+-----------------+----------+
1 row in set (0.00 sec)

mysql> UPDATE WORKS SET salary = 20000  WHERE salary is 500000 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '500000' at line 1
mysql> UPDATE WORKS SET salary = 20000  WHERE salary = 500000 ;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT DISTINCT* FROM WORKS;
+------+--------------+---------+------------------+
| e_id | company_name | salary  | email_id         |
+------+--------------+---------+------------------+
|    1 | oracle       | 1000000 | rishi@gmail.com  |
|    2 | Mastercard   |  200000 | tanmay@gmail.com |
|    3 | ZS           |   20000 | sunita@gmail.com |
+------+--------------+---------+------------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE MANAGES 
    -> ADD PRIMARY KEY email_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> ALTER TABLE MANAGES  ADD PRIMARY KEY( email_id);
Query OK, 0 rows affected (0.48 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE WORKS  ADD PRIMARY KEY( email_id);
Query OK, 0 rows affected (0.94 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE COMPANY  ADD PRIMARY KEY( company_name, city);
Query OK, 0 rows affected (0.44 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE DROP e_id;
Query OK, 6 rows affected (0.69 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM EMPLOYEE;
+--------+--------+----------+------------------+
| name   | street | city     | email_id         |
+--------+--------+----------+------------------+
| ram    | mg     | pune     | ram@gmail.com    |
| rishi  | fc     | pune     | rishi@gmail.com  |
| somil  | break  | mumbai   | somil@gmail.com  |
| tanmay | won    | mumbai   | tanmay@gmail.com |
| ramesh | bakshi | jamnagar | ramesh@gmail.com |
| sunita | tano   | jaipur   | sunita@gmail.com |
+--------+--------+----------+------------------+
6 rows in set (0.00 sec)

mysql> ALTER TABLE WORKS DROP e_id;
Query OK, 0 rows affected (0.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE MANAGES DROP e_id;
Query OK, 0 rows affected (0.83 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM WORKS;
+--------------+---------+------------------+
| company_name | salary  | email_id         |
+--------------+---------+------------------+
| oracle       | 1000000 | rishi@gmail.com  |
| ZS           |   20000 | sunita@gmail.com |
| Mastercard   |  200000 | tanmay@gmail.com |
+--------------+---------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT* FROM MANAGES;
+-----------------+----------+
| dept_name       | email_id |
+-----------------+----------+
| rishi@gmail.com | HR       |
+-----------------+----------+
1 row in set (0.00 sec)

mysql> ALTER TABLE MANAGES MODIFY COLUMN dept_name varchar(20);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM MANAGES;
+-----------------+----------+
| dept_name       | email_id |
+-----------------+----------+
| rishi@gmail.com | HR       |
+-----------------+----------+
1 row in set (0.00 sec)

mysql> UPDATE MANAGES SET dept_name ='HR'  WHERE dept_name is rishi@gmail.com ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rishi@gmail.com' at line 1
mysql> UPDATE MANAGES SET dept_name ='HR'  WHERE dept_name is" rishi@gmail.com" ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '" rishi@gmail.com"' at line 1
mysql> UPDATE MANAGES SET dept_name ='HR'  WHERE dept_name =" rishi@gmail.com" ;
Query OK, 0 rows affected (0.02 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM MANAGES;
+-----------------+----------+
| dept_name       | email_id |
+-----------------+----------+
| rishi@gmail.com | HR       |
+-----------------+----------+
1 row in set (0.00 sec)

mysql> ALTER TABLE MANAGES CHANGE dept_name email_id varchar(20);
ERROR 1060 (42S21): Duplicate column name 'email_id'
mysql> ALTER TABLE MANAGES CHANGE dept_name e_id varchar(20);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM MANAGES;
+-----------------+----------+
| e_id            | email_id |
+-----------------+----------+
| rishi@gmail.com | HR       |
+-----------------+----------+
1 row in set (0.00 sec)

mysql> ALTER TABLE MANAGES CHANGE email_id  dept_name varchar(20);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE MANAGES CHANGE e_id  email_id  varchar(20);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT* FROM MANAGES;
+-----------------+-----------+
| email_id        | dept_name |
+-----------------+-----------+
| rishi@gmail.com | HR        |
+-----------------+-----------+
1 row in set (0.00 sec)

mysql> INSERT INTO WORK VALUES ('ZS', 30000);
ERROR 1146 (42S02): Table 'student_tb.WORK' doesn't exist
mysql> SELECT DISTINCT* FROM COMPANY ;
+--------------+------+
| company_name | city |
+--------------+------+
| oracle       | pune |
+--------------+------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT* FROM WORKS ;
+--------------+---------+------------------+
| company_name | salary  | email_id         |
+--------------+---------+------------------+
| oracle       | 1000000 | rishi@gmail.com  |
| ZS           |   20000 | sunita@gmail.com |
| Mastercard   |  200000 | tanmay@gmail.com |
+--------------+---------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT* FROM COMPANY ;
+--------------+------+
| company_name | city |
+--------------+------+
| oracle       | pune |
+--------------+------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT* FROM MANAGES ;
+-----------------+-----------+
| email_id        | dept_name |
+-----------------+-----------+
| rishi@gmail.com | HR        |
+-----------------+-----------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT* FROM EMPLOYEE ;
+--------+--------+----------+------------------+
| name   | street | city     | email_id         |
+--------+--------+----------+------------------+
| ram    | mg     | pune     | ram@gmail.com    |
| rishi  | fc     | pune     | rishi@gmail.com  |
| somil  | break  | mumbai   | somil@gmail.com  |
| tanmay | won    | mumbai   | tanmay@gmail.com |
| ramesh | bakshi | jamnagar | ramesh@gmail.com |
| sunita | tano   | jaipur   | sunita@gmail.com |
+--------+--------+----------+------------------+
6 rows in set (0.00 sec)

mysql> INSERT INTO WORK VALUES ('ZS', 30000, 'somil@gmail.com);
    '> 
    '> ;
    '> )
    '> INSERT INTO WORK VALUES ('ZS', 30000, 'somil@gmail.com');
    '> ;
    '> exit
    '> SELECT DISTINCT* FROM EMPLOYEE ;
    '> 
    '> end
end
^C
mysql> INSERT INTO WORK VALUES ('ZS', 30000, 'somil@gmail.com');
ERROR 1146 (42S02): Table 'student_tb.WORK' doesn't exist
mysql> CREATE VIEW ZS_EMPLOYEES AS
    -> SELECT* 
    -> FROM EMPLOYEES
    -> WHERE COMPANY='ZS';
ERROR 1146 (42S02): Table 'student_tb.EMPLOYEES' doesn't exist
mysql> CREATE VIEW ZS_EMPLOYEES AS SELECT*  FROM EMPLOYEES WHERE COMPANY='ZS';
ERROR 1146 (42S02): Table 'student_tb.EMPLOYEES' doesn't exist
mysql> SHOW TABLES FROM student_tb;
+----------------------+
| Tables_in_student_tb |
+----------------------+
| BRANCH               |
| COMPANY              |
| EMPLOYEE             |
| MANAGES              |
| WORKS                |
| s                    |
| stud                 |
+----------------------+
7 rows in set (0.00 sec)

mysql> USE student_tb;
Database changed
mysql> CREATE VIEW ZS_EMPLOYEES AS SELECT*  FROM EMPLOYEES WHERE COMPANY='ZS';
ERROR 1146 (42S02): Table 'student_tb.EMPLOYEES' doesn't exist
mysql> CREATE VIEW ZS_EMPLOYEES AS SELECT*  FROM EMPLOYEE WHERE COMPANY='ZS';
ERROR 1054 (42S22): Unknown column 'COMPANY' in 'where clause'
mysql> CREATE VIEW ZS_EMPLOYEES AS SELECT*  FROM WORKS WHERE company_name='ZS';
Query OK, 0 rows affected (0.03 sec)

mysql> ALTER VIEW ZS_EMPLOYEES AS 
    -> SELECT * 
    -> FROM WORKS 
    -> WHERE company_name = 'ZS' AND salary >50000;
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO ZS_EMPLOYEES (EmployeeID , Name, Company ,Salary)
    -> VALUES (123, 'John', 'ZS', 60000);
ERROR 1054 (42S22): Unknown column 'EmployeeID' in 'field list'
mysql> INSERT INTO ZS_EMPLOYEES ( , Name, Company ,Salary) VALUES ( 'John', 'ZS', 60000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ' Name, Company ,Salary) VALUES ( 'John', 'ZS', 60000)' at line 1
mysql> INSERT INTO ZS_EMPLOYEES (  Name, Company ,Salary) VALUES ( 'John', 'ZS', 60000);
ERROR 1054 (42S22): Unknown column 'Name' in 'field list'
mysql> INSERT INTO ZS_EMPLOYEES ( email_id, company ,salary) VALUES ( 'John@gmail.com', 'ZS', 60000);
ERROR 1054 (42S22): Unknown column 'company' in 'field list'
mysql> INSERT INTO ZS_EMPLOYEES ( email_id, company_name ,salary) VALUES ( 'John@gmail.com', 'ZS', 60000);
Query OK, 1 row affected (0.03 sec)

mysql> SHOW TABLES FROM ZS_EMPLOYEE;
ERROR 1049 (42000): Unknown database 'ZS_EMPLOYEE'
mysql> SHOW VIEW  FROM ZS_EMPLOYEE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VIEW  FROM ZS_EMPLOYEE' at line 1
mysql> CREATE INDEX idx_lastname
    -> ON EMPLOYEE(lastname);
ERROR 1072 (42000): Key column 'lastname' doesn't exist in table
mysql> CREATE INDEX idx_lastname ON EMPLOYEE (lastname);
ERROR 1072 (42000): Key column 'lastname' doesn't exist in table
mysql> CREATE INDEX idx_lastname ON EMPLOYEE (name);
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEE
    -> WHERE type = 'index' AND tbl_name = 'EMPLOYEE';
ERROR 1054 (42S22): Unknown column 'type' in 'where clause'
mysql> SELECT * FROM EMPLOYEE;
+--------+--------+----------+------------------+
| name   | street | city     | email_id         |
+--------+--------+----------+------------------+
| ram    | mg     | pune     | ram@gmail.com    |
| rishi  | fc     | pune     | rishi@gmail.com  |
| somil  | break  | mumbai   | somil@gmail.com  |
| tanmay | won    | mumbai   | tanmay@gmail.com |
| ramesh | bakshi | jamnagar | ramesh@gmail.com |
| sunita | tano   | jaipur   | sunita@gmail.com |
+--------+--------+----------+------------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE name = 'rishi' AND street = 'fc';
+-------+--------+------+-----------------+
| name  | street | city | email_id        |
+-------+--------+------+-----------------+
| rishi | fc     | pune | rishi@gmail.com |
+-------+--------+------+-----------------+
1 row in set (0.00 sec)

mysql> SHOW VIEW  FROM ZS_EMPLOYEE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VIEW  FROM ZS_EMPLOYEE' at line 1
mysql> EXEC sp_rename 'ZS_EMPLOYEE' ,'ZS_EMPLOYEES';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'EXEC sp_rename 'ZS_EMPLOYEE' ,'ZS_EMPLOYEES'' at line 1
mysql> SHOW VIEW  FROM ZS_EMPLOYEE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VIEW  FROM ZS_EMPLOYEE' at line 1
mysql> SELECT * FROM EMPLOYEE;
+--------+--------+----------+------------------+
| name   | street | city     | email_id         |
+--------+--------+----------+------------------+
| ram    | mg     | pune     | ram@gmail.com    |
| rishi  | fc     | pune     | rishi@gmail.com  |
| somil  | break  | mumbai   | somil@gmail.com  |
| tanmay | won    | mumbai   | tanmay@gmail.com |
| ramesh | bakshi | jamnagar | ramesh@gmail.com |
| sunita | tano   | jaipur   | sunita@gmail.com |
+--------+--------+----------+------------------+
6 rows in set (0.00 sec)

mysql> CREATE INDEX idx_name ON COMPANY (company_name);
Query OK, 0 rows affected (0.35 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE
    -> ADD INDEX (emp_id);
ERROR 1072 (42000): Key column 'emp_id' doesn't exist in table
mysql> ALTER TABLE EMPLOYEE ADD INDEX (name);
Query OK, 0 rows affected, 1 warning (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> ALTER TABLE EMPLOYEE
    -> DROP INDEX idx_ladtname;
ERROR 1091 (42000): Can't DROP 'idx_ladtname'; check that column/key exists
mysql> tee rd;
Logging to file 'rd'
mysql> 




















(base) csl4@csl4-HP-280-Pro-G5-MT-Business-PC:~$ sudo su 
[sudo] password for csl4: 
root@csl4-HP-280-Pro-G5-MT-Business-PC:/home/csl4# mysql 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DBMSPrac           |
| Demo               |
| Library            |
| MOVIE              |
| banking            |
| customer           |
| mysql              |
| performance_schema |
| student            |
| student_it         |
| student_tb         |
| sys                |
+--------------------+
13 rows in set (0.08 sec)

mysql> USE student_tb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * FROM EMPLOYEE;
+--------+---------+----------+------------------+
| name   | street  | city     | email_id         |
+--------+---------+----------+------------------+
| harry  | vc      | chicago  | harry@gmail.com  |
| NULL   | oldtown | ottawa   | john@gmail.com   |
| ram    | mg      | pune     | ram@gmail.com    |
| ramesh | bakshi  | jamnagar | ramesh@gmail.com |
| rishi  | fc      | pune     | rishi@gmail.com  |
| somil  | break   | mumbai   | somil@gmail.com  |
| sunita | tano    | jaipur   | sunita@gmail.com |
| tanmay | won     | mumbai   | tanmay@gmail.com |
+--------+---------+----------+------------------+
8 rows in set (0.01 sec)

mysql> SELECT * FROM WORKS;
+--------------+--------+------------------+
| company_name | salary | email_id         |
+--------------+--------+------------------+
| Amazon       |  10000 | harry@gmail.com  |
| ZS           |  60000 | John@gmail.com   |
| oracle       | 100000 | rishi@gmail.com  |
| oracle       |  70000 | shruti@gmail.com |
| Amazon       |  10000 | tanmay@gmail.com |
| oracle       |  90000 | tanvi@gmail.com  |
+--------------+--------+------------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM MANAGES;
+------------------+-------------------+
| email_id         | dept_name         |
+------------------+-------------------+
| sunita@gmai.com  | data analyst      |
| rishi@gmail.com  | data architect    |
| somil@gmail.com  | financial analyst |
| tanvi@gmail.com  | HR Manager        |
| shruti@gmail.com | Manager           |
+------------------+-------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM COMPANY ;
+--------------+---------+
| company_name | city    |
+--------------+---------+
| Amazon       | chicago |
| oracle       | mumbai  |
| oracle       | noida   |
| oracle       | pune    |
| ZS           | mumbai  |
+--------------+---------+
5 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE 
    -> SET name = 'john' WHERE name is NULL;
Query OK, 1 row affected (0.13 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+--------+---------+----------+------------------+
| name   | street  | city     | email_id         |
+--------+---------+----------+------------------+
| harry  | vc      | chicago  | harry@gmail.com  |
| john   | oldtown | ottawa   | john@gmail.com   |
| ram    | mg      | pune     | ram@gmail.com    |
| ramesh | bakshi  | jamnagar | ramesh@gmail.com |
| rishi  | fc      | pune     | rishi@gmail.com  |
| somil  | break   | mumbai   | somil@gmail.com  |
| sunita | tano    | jaipur   | sunita@gmail.com |
| tanmay | won     | mumbai   | tanmay@gmail.com |
+--------+---------+----------+------------------+
8 rows in set (0.00 sec)


mysql> SELECT * FROM EMPLOYEE;               +--------+---------+----------+------------------+
| name   | street  | city     | email_id         |
+--------+---------+----------+------------------+
| harry  | vc      | delhi    | harry@gmail.com  |
| john   | oldtown | ottawa   | john@gmail.com   |
| ram    | mg      | pune     | ram@gmail.com    |
| ramesh | bakshi  | jamnagar | ramesh@gmail.com |
| rishi  | fc      | pune     | rishi@gmail.com  |
| somil  | break   | mumbai   | somil@gmail.com  |
| sunita | tano    | jaipur   | sunita@gmail.com |
| tanmay | won     | mumbai   | tanmay@gmail.com |
+--------+---------+----------+------------------+
8 rows in set (0.00 sec)

mysql> UPDATE COMPANY  SET  city = 'delhi'  WHERE company_name = 'Amazon';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> INSERT INTO COMPANY 
    -> (city, company_name)
    -> VALUES ('mumbai', 'Amazon');
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM COMPANY ;
+--------------+---------+
| company_name | city    |
+--------------+---------+
| Amazon       | delhi   |
| Amazon       | mumbai  |
| oracle       | mumbai  |
| oracle       | noida   |
| oracle       | pune    |
| ZS           | mumbai  |
+--------------+---------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE;               +--------+---------+----------+------------------+
+--------+---------+----------+------------------+
| name   | street  | city     | email_id         |
+--------+---------+----------+------------------+
| harry  | vc      | delhi    | harry@gmail.com  |
| john   | oldtown | ottawa   | john@gmail.com   |
| ram    | mg      | pune     | ram@gmail.com    |
| ramesh | bakshi  | jamnagar | ramesh@gmail.com |
| rishi  | fc      | pune     | rishi@gmail.com  |
| somil  | break   | mumbai   | somil@gmail.com  |
| sunita | tano    | jaipur   | sunita@gmail.com |
| tanmay | won     | mumbai   | tanmay@gmail.com |
+--------+---------+----------+------------------+
8 rows in set (0.00 sec)

    -> | name   | street  | city     | email_id         |
    -> +--------+---------+----------+------------------+
    -> | harry  | vc      | delhi    | harry@gmail.com  |
    -> | john   | oldtown | ottawa   | john@gmail.com   |
    -> | ram    | mg      | pune     | ram@gmail.com    |
    -> | ramesh | bakshi  | jamnagar | ramesh@gmail.com |
    -> | rishi  | fc      | pune     | rishi@gmail.com  |
    -> | somil  | break   | mumbai   | somil@gmail.com  |
    -> | sunita | tano    | jaipur   | sunita@gmail.com |
    -> | tanmay | won     | mumbai   | tanmay@gmail.com |
    -> +--------+---------+----------+------------------+
    -> 

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DBMSPrac           |
| Demo               |
| Library            |
| MOVIE              |
| banking            |
| customer           |
| mysql              |
| performance_schema |
| student            |
| student_it         |
| student_tb         |
| sys                |
+--------------------+
13 rows in set (0.00 sec)

mysql> USE student_tb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_student_tb  |
+-----------------------+
| BRANCH                |
| COMPANY               |
| EMPLOYEE              |
| MANAGES               |
| ORACLE                |
| ORACLE_HIGH_SALARY    |
| SALARY_employees      |
| WORKS                 |
| ZS_EMPLOYEES          |
| high_employees        |
| high_salary_employees |
| s                     |
| sequence              |
| stud                  |
+-----------------------+
14 rows in set (0.00 sec)

mysql> SELECT* FROM EMPLOYEE;
+--------+---------+----------+------------------+
| name   | street  | city     | email_id         |
+--------+---------+----------+------------------+
| harry  | vc      | delhi    | harry@gmail.com  |
| john   | oldtown | ottawa   | john@gmail.com   |
| ram    | mg      | pune     | ram@gmail.com    |
| ramesh | bakshi  | jamnagar | ramesh@gmail.com |
| rishi  | fc      | pune     | rishi@gmail.com  |
| somil  | break   | mumbai   | somil@gmail.com  |
| sunita | tano    | jaipur   | sunita@gmail.com |
| tanmay | won     | mumbai   | tanmay@gmail.com |
+--------+---------+----------+------------------+
8 rows in set (0.00 sec)

mysql> SELECT* FROM COMPANY;
+--------------+---------+
| company_name | city    |
+--------------+---------+
| Amazon       | delhi   |
| Amazon       | mumbai  |
| oracle       | mumbai  |
| oracle       | noida   |
| oracle       | pune    |
| ZS           | mumbai  |
+--------------+---------+
6 rows in set (0.00 sec)

mysql> SELECT* FROM WORKS;
+--------------+--------+------------------+
| company_name | salary | email_id         |
+--------------+--------+------------------+
| Amazon       |  10000 | harry@gmail.com  |
| ZS           |  60000 | John@gmail.com   |
| oracle       | 100000 | rishi@gmail.com  |
| oracle       |  70000 | shruti@gmail.com |
| Amazon       |  10000 | tanmay@gmail.com |
| oracle       |  90000 | tanvi@gmail.com  |
+--------------+--------+------------------+
6 rows in set (0.00 sec)

mysql> SELECT* FROM MANAGES;
+------------------+-------------------+
| email_id         | dept_name         |
+------------------+-------------------+
| sunita@gmai.com  | data analyst      |
| rishi@gmail.com  | data architect    |
| somil@gmail.com  | financial analyst |
| tanvi@gmail.com  | HR Manager        |
| shruti@gmail.com | Manager           |
+------------------+-------------------+
5 rows in set (0.01 sec)



mysql> SELECT 
    ->     EMPLOYEE.name AS employee_name,
    ->     EMPLOYEE.street,
    ->     EMPLOYEE.city AS employee_city,
    ->     EMPLOYEE.email_id,
    ->     COMPANY.company_name,
    ->     COMPANY.city AS company_city
    -> FROM EMPLOYEE
    -> LEFT JOIN COMPANY ON EMPLOYEE.city = COMPANY.city
    -> WHERE COMPANY.city IN ('delhi', 'mumbai') OR COMPANY.city IS NULL
    -> 
    -> UNION
    -> 
    -> -- RIGHT JOIN: All companies in 'delhi' or 'mumbai' and their employees
    -> SELECT 
    ->     EMPLOYEE.name AS employee_name,
    ->     EMPLOYEE.street,
    ->     EMPLOYEE.city AS employee_city,
    ->     EMPLOYEE.email_id,
    ->     COMPANY.company_name,
    ->     COMPANY.city AS company_city
    -> FROM EMPLOYEE
    -> RIGHT JOIN COMPANY ON EMPLOYEE.city = COMPANY.city
    -> WHERE COMPANY.city IN ('delhi', 'mumbai') OR EMPLOYEE.city IS NULL;
+---------------+---------+---------------+------------------+--------------+--------------+
| employee_name | street  | employee_city | email_id         | company_name | company_city |
+---------------+---------+---------------+------------------+--------------+--------------+
| harry         | vc      | delhi         | harry@gmail.com  | Amazon       | delhi        |
| john          | oldtown | ottawa        | john@gmail.com   | NULL         | NULL         |
| ramesh        | bakshi  | jamnagar      | ramesh@gmail.com | NULL         | NULL         |
| somil         | break   | mumbai        | somil@gmail.com  | Amazon       | mumbai       |
| somil         | break   | mumbai        | somil@gmail.com  | oracle       | mumbai       |
| somil         | break   | mumbai        | somil@gmail.com  | ZS           | mumbai       |
| sunita        | tano    | jaipur        | sunita@gmail.com | NULL         | NULL         |
| tanmay        | won     | mumbai        | tanmay@gmail.com | Amazon       | mumbai       |
| tanmay        | won     | mumbai        | tanmay@gmail.com | oracle       | mumbai       |
| tanmay        | won     | mumbai        | tanmay@gmail.com | ZS           | mumbai       |
| NULL          | NULL    | NULL          | NULL             | oracle       | noida        |
+---------------+---------+---------------+------------------+--------------+--------------+
11 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM (
    ->     -- Emulate FULL OUTER JOIN using UNION
    ->     SELECT 
    ->         EMPLOYEE.name AS employee_name,
    ->         EMPLOYEE.street,
    ->         EMPLOYEE.city AS employee_city,
    ->         EMPLOYEE.email_id,
    ->         COMPANY.company_name,
    ->         COMPANY.city AS company_city
    ->     FROM EMPLOYEE
    ->     LEFT JOIN COMPANY ON EMPLOYEE.city = COMPANY.city
    -> 
    ->     UNION
    -> 
    ->     SELECT 
    ->         EMPLOYEE.name AS employee_name,
    ->         EMPLOYEE.street,
    ->         EMPLOYEE.city AS employee_city,
    ->         EMPLOYEE.email_id,
    ->         COMPANY.company_name,
    ->         COMPANY.city AS company_city
    ->     FROM EMPLOYEE
    ->     RIGHT JOIN COMPANY ON EMPLOYEE.city = COMPANY.city
    -> ) AS full_outer_result
    -> WHERE employee_city IN ('delhi', 'mumbai');
+---------------+--------+---------------+------------------+--------------+--------------+
| employee_name | street | employee_city | email_id         | company_name | company_city |
+---------------+--------+---------------+------------------+--------------+--------------+
| harry         | vc     | delhi         | harry@gmail.com  | Amazon       | delhi        |
| somil         | break  | mumbai        | somil@gmail.com  | Amazon       | mumbai       |
| somil         | break  | mumbai        | somil@gmail.com  | oracle       | mumbai       |
| somil         | break  | mumbai        | somil@gmail.com  | ZS           | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | Amazon       | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | oracle       | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | ZS           | mumbai       |
+---------------+--------+---------------+------------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT 
    ->     EMPLOYEE.name AS employee_name,
    ->     EMPLOYEE.street,
    ->     EMPLOYEE.city AS employee_city,
    ->     EMPLOYEE.email_id,
    ->     COMPANY.company_name,
    ->     COMPANY.city AS company_city
    -> FROM EMPLOYEE
    -> RIGHT JOIN COMPANY ON EMPLOYEE.city = COMPANY.city;
+---------------+--------+---------------+------------------+--------------+--------------+
| employee_name | street | employee_city | email_id         | company_name | company_city |
+---------------+--------+---------------+------------------+--------------+--------------+
| harry         | vc     | delhi         | harry@gmail.com  | Amazon       | delhi        |
| somil         | break  | mumbai        | somil@gmail.com  | Amazon       | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | Amazon       | mumbai       |
| somil         | break  | mumbai        | somil@gmail.com  | oracle       | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | oracle       | mumbai       |
| NULL          | NULL   | NULL          | NULL             | oracle       | noida        |
| ram           | mg     | pune          | ram@gmail.com    | oracle       | pune         |
| rishi         | fc     | pune          | rishi@gmail.com  | oracle       | pune         |
| somil         | break  | mumbai        | somil@gmail.com  | ZS           | mumbai       |
| tanmay        | won    | mumbai        | tanmay@gmail.com | ZS           | mumbai       |
+---------------+--------+---------------+------------------+--------------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT DISTINCT E.name
    -> FROM EMPLOYEE E
    -> JOIN COMPANY C ON E.city = C.city
    -> WHERE C.city = 'Mumbai';
+--------+
| name   |
+--------+
| somil  |
| tanmay |
+--------+
2 rows in set (0.00 sec)































assignment 4
(base) csl4@csl4-HP-280-Pro-G5-MT-Business-PC:~$ sudo su 
[sudo] password for csl4: 
root@csl4-HP-280-Pro-G5-MT-Business-PC:/home/csl4# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 5
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DBMSPrac           |
| Demo               |
| Library            |
| MOVIE              |
| banking            |
| customer           |
| fines              |
| mysql              |
| performance_schema |
| student            |
| student_it         |
| student_tb         |
| sys                |
+--------------------+
14 rows in set (0.01 sec)

mysql> USE fines;
Database changed
mysql> CREATE TABLE FINE(
    -> roll_no INT ,
    -> date DATE,
    -> amt NUMBER (10,2),
    -> CONSTRAINT fk_roll_no FOREIGN KEY (roll_no) REFERENCES BORROWER (roll_no );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NUMBER (10,2),
CONSTRAINT fk_roll_no FOREIGN KEY (roll_no) REFERENCES BORROWER (' at line 4
mysql> CREATE TABLE Fine (
    ->     Roll_no INT,
    ->     Date DATE,
    ->     Amt DECIMAL(10, 2),
    ->     CONSTRAINT fk_roll_no FOREIGN KEY (Roll_no) REFERENCES Borrower(Roll_no)
    -> );
ERROR 1215 (HY000): Cannot add foreign key constraint
mysql> CREATE TABLE BORROWER (
    -> rollin INT ,
    -> date DATE,
    -> Amt DECIMAL(10,2),
    -> //
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '//' at line 5
mysql> CREATE TABLE BORROWER (;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> CREATE TABLE BORROWER (
    -> Rollin INT PRIMARY KEY ,
    -> Name VARCHAR(50),
    -> DateofIssue DATE ,
    -> Name_of_book VARCHAR (100),
    -> Status CHAR(1));
Query OK, 0 rows affected (0.21 sec)

mysql> CREATE TABLE FINE(
    -> Rollno INT ,
    -> Date DATE,
    -> Amt DECIMAL(10,2),
    -> CONSTRAINT fk_borrower_rollno FOREIGN KEY (Roll_no) REFERENCES BORROWER (Rollin));
ERROR 1072 (42000): Key column 'Roll_no' doesn't exist in table
mysql> mysql> CREATE TABLE FINE( Rollno INT , Date DATE, Amt DECIMAL(10,2TRAINT fk_borrower_rollno FOREIGN KEY (Rollno) REFERENCES BORROWER (Rollin));
Query OK, 0 rows affected (0.23 sec)

mysql> INSERT INTO BORROWER 
    -> VALUES (101, 'Alice', TO_DATE('2025-06-01','YYYY-MM-DD'), 'Oracle Basics' , 'I');
ERROR 1305 (42000): FUNCTION fines.TO_DATE does not exist
mysql> INSERT INTO Borrower VALUES (101, 'Alice', '2025-06-01', 'Oracle Basics', 'I');
ERROR 1146 (42S02): Table 'fines.Borrower' doesn't exist
mysql> INSERT INTO BORROWER  VALUES (101, 'Alice', '2025-06-01', 'Oracle Basics', 'I');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM BORROWER;
+--------+-------+-------------+---------------+--------+
| Rollin | Name  | DateofIssue | Name_of_book  | Status |
+--------+-------+-------------+---------------+--------+
|    101 | Alice | 2025-06-01  | Oracle Basics | I      |
+--------+-------+-------------+---------------+--------+
1 row in set (0.00 sec)

mysql> INSERT INTO BORROWER VALUES (102, 'Bob', '2025-06-10', 'PL/SQL Guide', 'I'),(103,'Charlie','2025-07-01','Data Structures','I');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM BORROWER;                +--------+---------+-------------+-----------------+--------+
| Rollin | Name    | DateofIssue | Name_of_book    | Status |
+--------+---------+-------------+-----------------+--------+
|    101 | Alice   | 2025-06-01  | Oracle Basics   | I      |
|    102 | Bob     | 2025-06-10  | PL/SQL Guide    | I      |
|    103 | Charlie | 2025-07-01  | Data Structures | I      |
+--------+---------+-------------+-----------------+--------+
3 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE ReturnBook(IN p_roll_no INT, IN p_book_name VARCHAR(100))
    -> BEGIN
    ->   DECLARE v_issue_date DATE;
    ->   DECLARE v_status CHAR(1);
    ->   DECLARE v_days INT;
    ->   DECLARE v_fine INT DEFAULT 0;
    ->   
    ->   -- Declare handler for not found
    ->   DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->   BEGIN
    ->     SELECT 'No matching issued book found for the given roll number and book name.' AS message;
    ->     LEAVE ReturnBook;
    ->   END;
    ->   
    ->   -- Fetch issue date and status
    ->   SELECT DateofIssue, Status INTO v_issue_date, v_status
    ->   FROM Borrower
    ->   WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   IF v_status != 'I' THEN
    ->     SELECT 'The book is not currently issued or already returned.' AS message;
    ->     LEAVE ReturnBook;
    ->   END IF;
    ->   
    ->   SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    ->   
    ->   IF v_days < 15 THEN
    ->     SET v_fine = 0;
    ->   ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->     SET v_fine = 5 * v_days;
    ->   ELSE
    ->     SET v_fine = 50 * v_days;
    ->   END IF;
    ->   
    ->   -- Update status
    ->   UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   -- Insert fine if applicable
    ->   IF v_fine > 0 THEN
    ->     INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->   END IF;
    ->   
    ->   SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    ->   
    -> END$$
ERROR 1308 (42000): LEAVE with no matching label: ReturnBook
mysql> 
mysql> DELIMITER ;
mysql> CREATE PROCEDURE Return_book(IN p_roll_no INT, IN p_book_name VARCHAR(100))
    -> BEGIN
    -> DECLARE v_issue_date DATE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> DELIMITER //
mysql> CREATE PROCEDURE Return_book(IN p_roll_no INT , INp_book_name VARCHAR(100))
    -> BEGIN
    -> DECLARE v_issue_date DATE;                            -> DECLARE v_status CHAR(1);
    -> DECLARE v_days INT;
    -> DECLARE v_fine INT DEFAULT 0 ;
    -> 
    -> DECLARE CONTINUE HANDLER FOR NOT FOUND
    -> BEGIN
    -> SELECT 'No matching issued book found for the given roll number and book name. ' AS message;
    -> LEAVE proc_block 
    -> END IF ;
    -> SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    -> IF v_days < 15 THEN 
    -> SET v_fine = 0 ;
    -> ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->       SET v_fine = 5 * v_days;
    ->     ELSE
    ->       SET v_fine = 50 * v_days;
    ->     END IF;
    ->     UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->     
    ->     -- Insert fine if applicable
    ->     IF v_fine > 0 THEN
    ->       INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->     END IF;
    ->     
    ->     SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    -> 
    ->   END proc_block;
    -> END//
ERROR 1308 (42000): LEAVE with no matching label: proc_block
mysql> DELIMITER//
ERROR: 
DELIMITER must be followed by a 'delimiter' character or string
mysql> DELIMITER //
mysql> CREATE PROCEDURE Return_book(IN p_roll_no INT , INp_book_name VARCHAR(100))
    ->     -> BEGIN
    ->     -> DECLARE v_issue_date DATE;                            -> DECLARE v_status CHAR(1);
    ->     -> DECLARE v_days INT;
    ->     -> DECLARE v_fine INT DEFAULT 0 ;
    ->     -> 
    ->     -> DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->     -> BEGIN
    ->     -> SELECT 'No matching issued book found for the given roll number and book name. ' AS message;
    ->     -> LEAVE proc_block 
    ->     -> END IF ;
    ->     -> SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    ->     -> IF v_days < 15 THEN 
    ->     -> SET v_fine = 0 ;
    ->     -> ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->     ->       SET v_fine = 5 * v_days;
    ->     ->     ELSE
    ->     ->       SET v_fine = 50 * v_days;
    ->     ->     END IF;
    ->     ->     UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->     ->     
    ->     ->     -- Insert fine if applicable
    ->     ->     IF v_fine > 0 THEN
    ->     ->       INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->     ->     END IF;
    ->     ->     
    ->     ->     SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    ->     -> 
    ->     ->   END proc_block;
    ->     -> END//
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> BEGIN
    -> DECLARE v_issue_date DATE;                            -> DECLARE' at line 2
mysql> DELIMITER //
mysql> CREATE PROCEDURE ReturnBook(IN p_roll_no INT, IN p_book_name VARCHAR(100))
    -> BEGIN
    ->   DECLARE v_issue_date DATE;
    ->   DECLARE v_status CHAR(1);
    ->   DECLARE v_days INT;
    ->   DECLARE v_fine INT DEFAULT 0;
    ->  DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->   BEGIN
    ->     SELECT 'No matching issued book found for the given roll number and book name.' AS message;
    ->     LEAVE proc_block; 
    -> END;
    -> proc_block: BEGIN
    -> SELECT DateofIssue, Status INTO v_issue_date, v_status
    ->     FROM Borrower
    ->     WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->     
    ->     IF v_status != 'I' THEN
    ->       SELECT 'The book is not currently issued or already returned.' AS message;
    ->       LEAVE proc_block;
    ->     END IF;
    ->     
    ->     SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    ->     
    ->     IF v_days < 15 THEN
    ->       SET v_fine = 0;
    ->     ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->       SET v_fine = 5 * v_days;
    ->     ELSE
    ->       SET v_fine = 50 * v_days;
    ->     END IF;
    ->      UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->  IF v_fine > 0 THEN
    ->       INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->     END IF;
    ->     SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    -> 
    ->   END proc_block;
    -> END;//
ERROR 1308 (42000): LEAVE with no matching label: proc_block
mysql> DELIMITER //
mysql> CREATE PROCEDURE ReturnBook(IN p_roll_no INT, IN p_book_name VARCHAR(100))
    -> proc_block: BEGIN  -- Label the entire procedure block
    -> 
    ->   DECLARE v_issue_date DATE;
    ->   DECLARE v_status CHAR(1);
    ->   DECLARE v_days INT;
    ->   DECLARE v_fine INT DEFAULT 0;
    ->   
    ->   -- Handler for NOT FOUND (no matching record)
    ->   DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->   BEGIN
    ->     SELECT 'No matching issued book found for the given roll number and book name.' AS message;
    ->     LEAVE proc_block;  -- Leave the labeled block on no data found
    ->   END;
    ->   
    ->   -- Main code starts here
    ->   SELECT DateofIssue, Status INTO v_issue_date, v_status
    ->   FROM Borrower
    ->   WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   IF v_status != 'I' THEN
    ->     SELECT 'The book is not currently issued or already returned.' AS message;
    ->     LEAVE proc_block;
    ->   END IF;
    ->   
    ->   SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    ->   
    ->   IF v_days < 15 THEN
    ->     SET v_fine = 0;
    ->   ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->     SET v_fine = 5 * v_days;
    ->   ELSE
    ->     SET v_fine = 50 * v_days;
    ->   END IF;
    ->   
    ->   UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   IF v_fine > 0 THEN
    ->     INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->   END IF;
    ->   
    ->   SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    -> 
    -> END proc_block //
ERROR 1308 (42000): LEAVE with no matching label: proc_block
mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE ReturnBook(IN p_roll_no INT, IN p_book_name VARCHAR(100))
    -> BEGIN
    ->   DECLARE v_issue_date DATE;
    ->   DECLARE v_status CHAR(1);
    ->   DECLARE v_days INT;
    ->   DECLARE v_fine INT DEFAULT 0;
    ->   DECLARE v_not_found INT DEFAULT 0;
    ->   
    ->   -- Handler to set flag if no data found
    ->   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_not_found = 1;
    ->   
    ->   -- Attempt to fetch data
    ->   SELECT DateofIssue, Status INTO v_issue_date, v_status
    ->   FROM Borrower
    ->   WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   -- Check if data was not found
    ->   IF v_not_found = 1 THEN
    ->     SELECT 'No matching issued book found for the given roll number and book name.' AS message;
    ->     LEAVE proc_end;  -- this LEAVE will fail because no label yet
    ->   END IF;
    ->   
    ->   -- Check if book is currently issued
    ->   IF v_status != 'I' THEN
    ->     SELECT 'The book is not currently issued or already returned.' AS message;
    ->     LEAVE proc_end;  -- same problem here, no label
    ->   END IF;
    ->   
    ->   SET v_days = DATEDIFF(CURDATE(), v_issue_date);
    ->   
    ->   IF v_days < 15 THEN
    ->     SET v_fine = 0;
    ->   ELSEIF v_days BETWEEN 15 AND 30 THEN
    ->     SET v_fine = 5 * v_days;
    ->   ELSE
    ->     SET v_fine = 50 * v_days;
    ->   END IF;
    ->   
    ->   -- Update status
    ->   UPDATE Borrower SET Status = 'R' WHERE Rollin = p_roll_no AND NameofBook = p_book_name;
    ->   
    ->   -- Insert fine if applicable
    ->   IF v_fine > 0 THEN
    ->     INSERT INTO Fine (Roll_no, Date, Amt) VALUES (p_roll_no, CURDATE(), v_fine);
    ->   END IF;
    ->   
    ->   SELECT CONCAT('Book returned successfully. Days since issue: ', v_days, ', Fine amount: Rs ', v_fine) AS message;
    ->   
    ->   proc_end: BEGIN END;  -- dummy labeled block just to fix LEAVE calls
    -> 
    -> END$$
ERROR 1308 (42000): LEAVE with no matching label: proc_end
mysql> 
mysql> DELIMITER ;
mysql> //
    -> EXIT ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '//
EXIT' at line 1
mysql> tee rt ;
Logging to file 'rt'
mysql> 


