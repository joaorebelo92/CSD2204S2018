MariaDB [(none)]> USE CSD2204S18;
Database changed
MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE Persons (
    ->  ID integer(3),
    ->  LastName varchar(255) NOT NULL,
    ->  FirstName varchar(255) NOT NULL,
    ->  Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
    -> );
Query OK, 0 rows affected (0.13 sec)
MariaDB [CSD2204S18]> DESC Persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(3)       | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   | PRI | NULL    |       |
| FirstName | varchar(255) | NO   |     | NULL    |       |
| Age       | int(3)       | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM Persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE Orders (
    ->  OrderID integer(3) NOT NULL,
    ->  OrderNumber integer(3) NOT NULL,
    ->  PersonID integer(3),
    ->  PRIMARY KEY (OrderID),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(ID));
Query OK, 0 rows affected (0.19 sec)

MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
| orders               |
| persons              |
+----------------------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM orders;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | OrderID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PersonOrder |            1 | PersonID    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC Orders;
+-------------+--------+------+-----+---------+-------+
| Field       | Type   | Null | Key | Default | Extra |
+-------------+--------+------+-----+---------+-------+
| OrderID     | int(3) | NO   | PRI | NULL    |       |
| OrderNumber | int(3) | NO   |     | NULL    |       |
| PersonID    | int(3) | YES  | MUL | NULL    |       |
+-------------+--------+------+-----+---------+-------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> create table c1 as select * from customer; 
Query OK, 10 rows affected (0.20 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> create table c2 as select name, postalCode from customer WHERE city = 'Toronto'; 
Query OK, 3 rows affected (0.17 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalCode |
+--------------+------------+
| Bob Marley   | 100100     |
| Donna Newman | 130120     |
| Eston M.     | 201023     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE c3 LIKE Customer;
Query OK, 0 rows affected (0.16 sec)

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> INSERT INTO c3 SELECT * FROM Customer;
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c3;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 ADD COLUMN Country VARCHAR(100);
Query OK, 0 rows affected (0.39 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| custId     | varchar(5)   | NO   | PRI | NULL    |       |
| name       | varchar(50)  | YES  |     | NULL    |       |
| nickname   | varchar(10)  | YES  |     | NULL    |       |
| city       | varchar(20)  | YES  |     | NULL    |       |
| postalCode | varchar(10)  | YES  |     | NULL    |       |
| age        | int(3)       | YES  |     | NULL    |       |
| Country    | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 MODIFY COLUMN Country VARCHAR(40);
Query OK, 10 rows affected (0.48 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 MODIFY COLUMN country VARCHAR(40);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 CHANGE COLUMN custId customerID VARCHAR(5);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 DROP COLUMN nickname;
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 MODIFY name VARCHAR(50) NOT NULL;
Query OK, 10 rows affected (0.60 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c1 ADD PRIMARY KEY(custId);
Query OK, 0 rows affected (0.48 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c1 DROP INDEX custId;
ERROR 1091 (42000): Can't DROP 'custId'; check that column/key exists
MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> show variables like 'version';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| version       | 10.1.21-MariaDB |
+---------------+-----------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c1 DROP PRIMARY KEY;
Query OK, 10 rows affected (0.73 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC Persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(3)       | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   | PRI | NULL    |       |
| FirstName | varchar(255) | NO   |     | NULL    |       |
| Age       | int(3)       | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM Persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DROP INDEX PK_Person ON Persons;
ERROR 1091 (42000): Can't DROP 'PK_Person'; check that column/key exists
MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| C01        | Ashley          | WDC        | 321200     |   34 | NULL    |
| C02        | Bob Marley      | Toronto    | 100100     |   23 | NULL    |
| C03        | Cherlies Theron | New York   | 120134     |   20 | NULL    |
| C04        | Denial Jack     | Brasil     | 341020     |   25 | NULL    |
| C05        | Donna Newman    | Toronto    | 130120     |   50 | NULL    |
| C06        | Eston M.        | Toronto    | 201023     |   65 | NULL    |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | NULL    |
| C08        | Ashko Charles   | USA        | 421044     |   72 | NULL    |
| C09        | Tony Special    | GTA        | 418921     |   62 | NULL    |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | NULL    |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country = 'USA';
Query OK, 10 rows affected (0.05 sec)
Rows matched: 10  Changed: 10  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| C01        | Ashley          | WDC        | 321200     |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100     |   23 | USA     |
| C03        | Cherlies Theron | New York   | 120134     |   20 | USA     |
| C04        | Denial Jack     | Brasil     | 341020     |   25 | USA     |
| C05        | Donna Newman    | Toronto    | 130120     |   50 | USA     |
| C06        | Eston M.        | Toronto    | 201023     |   65 | USA     |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921     |   62 | USA     |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA     |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country = 'Canada' WHERE city IN ('Toronto', 'GTA');
Query OK, 4 rows affected (0.06 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| C01        | Ashley          | WDC        | 321200     |   34 | USA     |
| C02        | Bob Marley      | Toronto    | 100100     |   23 | Canada  |
| C03        | Cherlies Theron | New York   | 120134     |   20 | USA     |
| C04        | Denial Jack     | Brasil     | 341020     |   25 | USA     |
| C05        | Donna Newman    | Toronto    | 130120     |   50 | Canada  |
| C06        | Eston M.        | Toronto    | 201023     |   65 | Canada  |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921     |   62 | Canada  |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA     |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country = 'South America' WHERE city = 'Brasil';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------------+
| customerID | name            | city       | postalCode | age  | country       |
+------------+-----------------+------------+------------+------+---------------+
| C01        | Ashley          | WDC        | 321200     |   34 | USA           |
| C02        | Bob Marley      | Toronto    | 100100     |   23 | Canada        |
| C03        | Cherlies Theron | New York   | 120134     |   20 | USA           |
| C04        | Denial Jack     | Brasil     | 341020     |   25 | South America |
| C05        | Donna Newman    | Toronto    | 130120     |   50 | Canada        |
| C06        | Eston M.        | Toronto    | 201023     |   65 | Canada        |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA           |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA           |
| C09        | Tony Special    | GTA        | 418921     |   62 | Canada        |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA           |
+------------+-----------------+------------+------------+------+---------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalCode |
+--------------+------------+
| Bob Marley   | 100100     |
| Donna Newman | 130120     |
| Eston M.     | 201023     |
+--------------+------------+
3 rows in set (0.05 sec)

MariaDB [CSD2204S18]> DELETE FROM c2 WHERE name LIKE 'Bob%';
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalCode |
+--------------+------------+
| Donna Newman | 130120     |
| Eston M.     | 201023     |
+--------------+------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DELETE FROM c2;
Query OK, 2 rows affected (0.06 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> DROP TABLE c2;
Query OK, 0 rows affected (0.13 sec)

MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c1 SET custId = 1 WHERE age >=50;
Query OK, 5 rows affected (0.03 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c1;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| 1      | Donna Newman    | New      | Toronto    | 130120     |   50 |
| 1      | Eston M.        | M.       | Toronto    | 201023     |   65 |
| 1      | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| 1      | Ashko Charles   | AK       | USA        | 421044     |   72 |
| 1      | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1 WHERE custId IS NULL;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> DESC C1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| 1      | Donna Newman    | New      | Toronto    | 130120     |   50 |
| 1      | Eston M.        | M.       | Toronto    | 201023     |   65 |
| 1      | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| 1      | Ashko Charles   | AK       | USA        | 421044     |   72 |
| 1      | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> create table client (client_id INT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50),gender VARCHAR(50),birthdate DATE,country VARCHAR(50));insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (1, 'Maxie', 'Bullock', 'mbullock0@jugem.jp', 'Male', '13/11/2017', 'South Africa');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (2, 'Rochester', 'Juszczak', 'rjuszczak1@cisco.com', 'Male', '15/07/2017', 'Indonesia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (3, 'Mavra', 'Bostock', 'mbostock2@cmu.edu', 'Female', '06/09/2017', 'Cameroon');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (4, 'D''arcy', 'Hearons', 'dhearons3@facebook.com', 'Male', '13/01/2018', 'Azerbaijan');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (5, 'Rochell', 'Conradsen', 'rconradsen4@4shared.com', 'Female', '31/03/2018', 'Portugal');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (6, 'Cecile', 'Edmundson', 'cedmundson5@vistaprint.com', 'Female', '15/08/2017', 'Poland');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (7, 'Daveen', 'Gerritzen', 'dgerritzen6@umich.edu', 'Female', '30/10/2017', 'Mongolia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (8, 'Micheal', 'Impleton', 'mimpleton7@vkontakte.ru', 'Male', '04/03/2018', 'Pakistan');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (9, 'Melany', 'Sharpley', 'msharpley8@tripod.com', 'Female', '10/07/2017', 'Netherlands');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (10, 'Durand', 'Guillotin', 'dguillotin9@myspace.com', 'Male', '30/06/2017', 'Russia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (11, 'See', 'Kieff', 'skieffa@rambler.ru', 'Male', '15/12/2017', 'Russia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (12, 'Faunie', 'Edgehill', 'fedgehillb@netscape.com', 'Female', '17/08/2017', 'Armenia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (13, 'Aile', 'Frontczak', 'afrontczakc@pbs.org', 'Female', '28/08/2017', 'Belarus');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (14, 'Doll', 'Jakel', 'djakeld@free.fr', 'Female', '09/04/2018', 'Kuwait');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (15, 'Pepi', 'MacGilpatrick', 'pmacgilpatricke@ucla.edu', 'Female', '28/04/2018', 'Poland');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (16, 'Kippie', 'Tidd', 'ktiddf@hud.gov', 'Male', '25/02/2018', 'Samoa');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (17, 'Lazare', 'Lecointe', 'llecointeg@multiply.com', 'Male', '21/07/2017', 'Croatia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (18, 'Hilario', 'Boich', 'hboichh@cargocollective.com', 'Male', '14/01/2018', 'Bhutan');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (19, 'Clarissa', 'McLaughlan', 'cmclaughlani@upenn.edu', 'Female', '29/05/2017', 'Syria');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (20, 'Dory', 'Gott', 'dgottj@altervista.org', 'Female', '03/05/2018', 'Indonesia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (21, 'Nessa', 'Asplin', 'nasplink@spotify.com', 'Female', '12/09/2017', 'Portugal');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (22, 'Marinna', 'Crosio', 'mcrosiol@apple.com', 'Female', '19/12/2017', 'Russia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (23, 'Katharina', 'Bartolomeotti', 'kbartolomeottim@usa.gov', 'Female', '25/11/2017', 'Philippines');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (24, 'Keefer', 'Alabastar', 'kalabastarn@macromedia.com', 'Male', '06/02/2018', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (25, 'Quentin', 'Gilstoun', 'qgilstouno@washington.edu', 'Female', '28/01/2018', 'Poland');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (26, 'Konstanze', 'Phripp', 'kphrippp@naver.com', 'Female', '01/06/2017', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (27, 'Ulick', 'Brickhill', 'ubrickhillq@dedecms.com', 'Male', '31/08/2017', 'Colombia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (28, 'Dore', 'Leebetter', 'dleebetterr@storify.com', 'Male', '24/04/2018', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (29, 'Andy', 'Jansson', 'ajanssons@time.com', 'Female', '15/09/2017', 'Brazil');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (30, 'Ryan', 'Drabble', 'rdrabblet@ocn.ne.jp', 'Male', '19/03/2018', 'Peru');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (31, 'Milton', 'Sonier', 'msonieru@technorati.com', 'Male', '31/05/2017', 'Cuba');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (32, 'Helen-elizabeth', 'Wasson', 'hwassonv@bravesites.com', 'Female', '29/07/2017', 'Canada');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (33, 'Fabien', 'Probetts', 'fprobettsw@wikispaces.com', 'Male', '21/01/2018', 'Sweden');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (34, 'Fredek', 'Brason', 'fbrasonx@about.me', 'Male', '16/12/2017', 'Brazil');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (35, 'Morey', 'Angrick', 'mangricky@independent.co.uk', 'Male', '05/10/2017', 'Peru');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (36, 'Lolly', 'Melling', 'lmellingz@kickstarter.com', 'Female', '14/02/2018', 'Malaysia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (37, 'Karel', 'Portman', 'kportman10@bigcartel.com', 'Male', '21/03/2018', 'Canada');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (38, 'Charline', 'Khilkov', 'ckhilkov11@wikimedia.org', 'Female', '20/01/2018', 'Poland');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (39, 'Odele', 'Poter', 'opoter12@berkeley.edu', 'Female', '21/10/2017', 'Indonesia');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (40, 'Kienan', 'Poluzzi', 'kpoluzzi13@amazon.co.jp', 'Male', '09/01/2018', 'Mauritius');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (41, 'Ruggiero', 'Djorvic', 'rdjorvic14@tuttocitta.it', 'Male', '05/11/2017', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (42, 'Dina', 'Baroch', 'dbaroch15@prweb.com', 'Female', '14/07/2017', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (43, 'Morris', 'Gayle', 'mgayle16@dailymotion.com', 'Male', '02/12/2017', 'France');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (44, 'Anabella', 'Chastang', 'achastang17@bigcartel.com', 'Female', '14/10/2017', 'Japan');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (45, 'Dillie', 'Egan', 'degan18@boston.com', 'Male', '06/08/2017', 'Brazil');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (46, 'Katti', 'Blaase', 'kblaase19@cnn.com', 'Female', '04/08/2017', 'Canada');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (47, 'Eba', 'Daykin', 'edaykin1a@livejournal.com', 'Female', '31/01/2018', 'Dominican Republic');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (48, 'Correy', 'Vellacott', 'cvellacott1b@yahoo.co.jp', 'Female', '20/02/2018', 'China');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (49, 'Hope', 'Sadat', 'hsadat1c@dyndns.org', 'Female', '07/01/2018', 'Canada');insert into client (client_id, first_name, last_name, email, gender, birthdate, country) values (50, 'Donal', 'Housego', 'dhousego1d@hhs.gov', 'Male', '26/05/2017', 'Thailand');
Query OK, 0 rows affected (0.38 sec)

Query OK, 1 row affected, 1 warning (0.14 sec)

Query OK, 1 row affected, 1 warning (0.08 sec)

Query OK, 1 row affected, 1 warning (0.11 sec)

Query OK, 1 row affected, 1 warning (0.05 sec)

Query OK, 1 row affected, 1 warning (0.08 sec)

Query OK, 1 row affected, 1 warning (0.05 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.08 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.05 sec)

Query OK, 1 row affected, 1 warning (0.05 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.03 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.02 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

Query OK, 1 row affected, 1 warning (0.01 sec)

MariaDB [CSD2204S18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| client               |
| customer             |
| orders               |
| persons              |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM client;
+-----------+-----------------+---------------+-----------------------------+--------+------------+--------------------+
| client_id | first_name      | last_name     | email                       | gender | birthdate  | country            |
+-----------+-----------------+---------------+-----------------------------+--------+------------+--------------------+
|         1 | Maxie           | Bullock       | mbullock0@jugem.jp          | Male   | 0000-00-00 | South Africa       |
|         2 | Rochester       | Juszczak      | rjuszczak1@cisco.com        | Male   | 0000-00-00 | Indonesia          |
|         3 | Mavra           | Bostock       | mbostock2@cmu.edu           | Female | 0000-00-00 | Cameroon           |
|         4 | D'arcy          | Hearons       | dhearons3@facebook.com      | Male   | 0000-00-00 | Azerbaijan         |
|         5 | Rochell         | Conradsen     | rconradsen4@4shared.com     | Female | 0000-00-00 | Portugal           |
|         6 | Cecile          | Edmundson     | cedmundson5@vistaprint.com  | Female | 0000-00-00 | Poland             |
|         7 | Daveen          | Gerritzen     | dgerritzen6@umich.edu       | Female | 0000-00-00 | Mongolia           |
|         8 | Micheal         | Impleton      | mimpleton7@vkontakte.ru     | Male   | 0000-00-00 | Pakistan           |
|         9 | Melany          | Sharpley      | msharpley8@tripod.com       | Female | 0000-00-00 | Netherlands        |
|        10 | Durand          | Guillotin     | dguillotin9@myspace.com     | Male   | 0000-00-00 | Russia             |
|        11 | See             | Kieff         | skieffa@rambler.ru          | Male   | 0000-00-00 | Russia             |
|        12 | Faunie          | Edgehill      | fedgehillb@netscape.com     | Female | 0000-00-00 | Armenia            |
|        13 | Aile            | Frontczak     | afrontczakc@pbs.org         | Female | 0000-00-00 | Belarus            |
|        14 | Doll            | Jakel         | djakeld@free.fr             | Female | 0000-00-00 | Kuwait             |
|        15 | Pepi            | MacGilpatrick | pmacgilpatricke@ucla.edu    | Female | 0000-00-00 | Poland             |
|        16 | Kippie          | Tidd          | ktiddf@hud.gov              | Male   | 0000-00-00 | Samoa              |
|        17 | Lazare          | Lecointe      | llecointeg@multiply.com     | Male   | 0000-00-00 | Croatia            |
|        18 | Hilario         | Boich         | hboichh@cargocollective.com | Male   | 0000-00-00 | Bhutan             |
|        19 | Clarissa        | McLaughlan    | cmclaughlani@upenn.edu      | Female | 0000-00-00 | Syria              |
|        20 | Dory            | Gott          | dgottj@altervista.org       | Female | 0000-00-00 | Indonesia          |
|        21 | Nessa           | Asplin        | nasplink@spotify.com        | Female | 0000-00-00 | Portugal           |
|        22 | Marinna         | Crosio        | mcrosiol@apple.com          | Female | 0000-00-00 | Russia             |
|        23 | Katharina       | Bartolomeotti | kbartolomeottim@usa.gov     | Female | 0000-00-00 | Philippines        |
|        24 | Keefer          | Alabastar     | kalabastarn@macromedia.com  | Male   | 0000-00-00 | China              |
|        25 | Quentin         | Gilstoun      | qgilstouno@washington.edu   | Female | 0000-00-00 | Poland             |
|        26 | Konstanze       | Phripp        | kphrippp@naver.com          | Female | 0000-00-00 | China              |
|        27 | Ulick           | Brickhill     | ubrickhillq@dedecms.com     | Male   | 0000-00-00 | Colombia           |
|        28 | Dore            | Leebetter     | dleebetterr@storify.com     | Male   | 0000-00-00 | China              |
|        29 | Andy            | Jansson       | ajanssons@time.com          | Female | 0000-00-00 | Brazil             |
|        30 | Ryan            | Drabble       | rdrabblet@ocn.ne.jp         | Male   | 0000-00-00 | Peru               |
|        31 | Milton          | Sonier        | msonieru@technorati.com     | Male   | 0000-00-00 | Cuba               |
|        32 | Helen-elizabeth | Wasson        | hwassonv@bravesites.com     | Female | 0000-00-00 | Canada             |
|        33 | Fabien          | Probetts      | fprobettsw@wikispaces.com   | Male   | 0000-00-00 | Sweden             |
|        34 | Fredek          | Brason        | fbrasonx@about.me           | Male   | 0000-00-00 | Brazil             |
|        35 | Morey           | Angrick       | mangricky@independent.co.uk | Male   | 0000-00-00 | Peru               |
|        36 | Lolly           | Melling       | lmellingz@kickstarter.com   | Female | 0000-00-00 | Malaysia           |
|        37 | Karel           | Portman       | kportman10@bigcartel.com    | Male   | 0000-00-00 | Canada             |
|        38 | Charline        | Khilkov       | ckhilkov11@wikimedia.org    | Female | 0000-00-00 | Poland             |
|        39 | Odele           | Poter         | opoter12@berkeley.edu       | Female | 0000-00-00 | Indonesia          |
|        40 | Kienan          | Poluzzi       | kpoluzzi13@amazon.co.jp     | Male   | 0000-00-00 | Mauritius          |
|        41 | Ruggiero        | Djorvic       | rdjorvic14@tuttocitta.it    | Male   | 0000-00-00 | China              |
|        42 | Dina            | Baroch        | dbaroch15@prweb.com         | Female | 0000-00-00 | China              |
|        43 | Morris          | Gayle         | mgayle16@dailymotion.com    | Male   | 0000-00-00 | France             |
|        44 | Anabella        | Chastang      | achastang17@bigcartel.com   | Female | 0000-00-00 | Japan              |
|        45 | Dillie          | Egan          | degan18@boston.com          | Male   | 0000-00-00 | Brazil             |
|        46 | Katti           | Blaase        | kblaase19@cnn.com           | Female | 0000-00-00 | Canada             |
|        47 | Eba             | Daykin        | edaykin1a@livejournal.com   | Female | 0000-00-00 | Dominican Republic |
|        48 | Correy          | Vellacott     | cvellacott1b@yahoo.co.jp    | Female | 0000-00-00 | China              |
|        49 | Hope            | Sadat         | hsadat1c@dyndns.org         | Female | 0000-00-00 | Canada             |
|        50 | Donal           | Housego       | dhousego1d@hhs.gov          | Male   | 0000-00-00 | Thailand           |
+-----------+-----------------+---------------+-----------------------------+--------+------------+--------------------+
50 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE client ADD PRIMARY KEY(client_id);
Query OK, 50 rows affected (0.83 sec)
Records: 50  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC client;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| client_id  | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(50) | YES  |     | NULL    |       |
| last_name  | varchar(50) | YES  |     | NULL    |       |
| email      | varchar(50) | YES  |     | NULL    |       |
| gender     | varchar(50) | YES  |     | NULL    |       |
| birthdate  | date        | YES  |     | NULL    |       |
| country    | varchar(50) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

