MariaDB [(none)]> USE CSD2204s18;
Database changed
MariaDB [CSD2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer;
Empty set (0.00 sec)

MariaDB [CSD2204s18]> DESC Customer;
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

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C01', 'Ashley', 'Ash', 'WDC', '321200', 34);
Query OK, 1 row affected (0.10 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer;
+--------+--------+----------+------+------------+------+
| custId | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| C01    | Ashley | ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C02', 'Bob marley', 'Bm', 'Toronto', '100100', 23);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C03', 'Cherlies Theron', 'Cher', 'New York', '120134', 20);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C04', 'Denial Jack', 'DJ', 'Brasil', '341020', 25);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C05', 'Donna Newman', 'New', 'Toronto', '130120', 50);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C06', 'Eston M.', 'M.', 'Toronto', '201023', 65);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C07', 'Bobby Chacko', 'Chac', 'New York', '320300', 70);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C08', 'Ashko Charles', 'AK', 'USA', '421044', 72);,
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C09', 'Tony Special', 'Specie', 'GTA', '418921', 62);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204s18]> INSERT INTO Customer VALUES('C10', 'Jack Sp', 'Sparrow', 'New Jersey', '102301', 35);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer;
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

MariaDB [CSD2204s18]> SELECT name, nickname FROM customer;
+-----------------+----------+
| name            | nickname |
+-----------------+----------+
| Ashley          | Ash      |
| Bob Marley      | Bm       |
| Cherlies Theron | Cher     |
| Denial Jack     | DJ       |
| Donna Newman    | New      |
| Eston M.        | M.       |
| Bobby Chacko    | Chac     |
| Ashko Charles   | AK       |
| Tony Special    | Specie   |
| Jack Sp         | Sparrow  |
+-----------------+----------+
10 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT city, postalcode FROM customer;
+------------+------------+
| city       | postalcode |
+------------+------------+
| WDC        | 321200     |
| Toronto    | 100100     |
| New York   | 120134     |
| Brasil     | 341020     |
| Toronto    | 130120     |
| Toronto    | 201023     |
| New York   | 320300     |
| USA        | 421044     |
| GTA        | 418921     |
| New Jersey | 102301     |
+------------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name = 'Ashley';
+--------+--------+----------+------+------------+------+
| custId | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| C01    | Ashley | Ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE nickname = 'AK';
+--------+---------------+----------+------+------------+------+
| custId | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT city FROM customer WHERE name = 'Eston M.';
+---------+
| city    |
+---------+
| Toronto |
+---------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE name = 'Eston M.';
+----------+---------+
| name     | city    |
+----------+---------+
| Eston M. | Toronto |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name FROM customer WHERE city = 'Toronto';
+--------------+
| name         |
+--------------+
| Bob Marley   |
| Donna Newman |
| Eston M.     |
+--------------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE city = 'Toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Bob Marley   | Toronto |
| Donna Newman | Toronto |
| Eston M.     | Toronto |
+--------------+---------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE city != 'Toronto';
+-----------------+------------+
| name            | city       |
+-----------------+------------+
| Ashley          | WDC        |
| Cherlies Theron | New York   |
| Denial Jack     | Brasil     |
| Bobby Chacko    | New York   |
| Ashko Charles   | USA        |
| Tony Special    | GTA        |
| Jack Sp         | New Jersey |
+-----------------+------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age = 50;
+--------+--------------+----------+---------+------------+------+
| custId | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C05    | Donna Newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age < 50;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age > 50;
+--------+---------------+----------+----------+------------+------+
| custId | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| C06    | Eston M.      | M.       | Toronto  | 201023     |   65 |
| C07    | Bobby Chacko  | Chac     | New York | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA      | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
+--------+---------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name > 'Ashley';
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name < 'Donna';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil   | 341020     |   25 |
| C07    | Bobby Chacko    | Chac     | New York | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE name = 'Ashley' OR city = 'toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Ashley       | WDC     |
| Bob Marley   | Toronto |
| Donna Newman | Toronto |
| Eston M.     | Toronto |
+--------------+---------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE city = 'New York' OR city = 'toronto';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| Bob Marley      | Toronto  |
| Cherlies Theron | New York |
| Donna Newman    | Toronto  |
| Eston M.        | Toronto  |
| Bobby Chacko    | New York |
+-----------------+----------+
5 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city FROM customer WHERE city = 'toronto' AND age > 50;
+----------+---------+
| name     | city    |
+----------+---------+
| Eston M. | Toronto |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, city, age FROM customer WHERE city = 'toronto' AND age > 50;
+----------+---------+------+
| name     | city    | age  |
+----------+---------+------+
| Eston M. | Toronto |   65 |
+----------+---------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city = 'toronto';
+--------+--------------+----------+---------+------------+------+
| custId | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C02    | Bob Marley   | Bm       | Toronto | 100100     |   23 |
| C05    | Donna Newman | New      | Toronto | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto | 201023     |   65 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT COUNT(*) FROM customer WHERE city = 'toronto';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT COUNT(*) "No of customers in Toronto" FROM customer WHERE city = 'toronto';
+----------------------------+
| No of customers in Toronto |
+----------------------------+
|                          3 |
+----------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT COUNT(*) "No of Customers with age more than 50" FROM customer WHERE age = 50;
+---------------------------------------+
| No of Customers with age more than 50 |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT COUNT(*) "No of Customers with age more than 50" FROM customer WHERE age > 50;
+---------------------------------------+
| No of Customers with age more than 50 |
+---------------------------------------+
|                                     4 |
+---------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age > 30 AND age <70;
+--------+--------------+----------+------------+------------+------+
| custId | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna Newman | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age BETWEEN 30 AND 70;
+--------+--------------+----------+------------+------------+------+
| custId | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna Newman | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.     | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko | Chac     | New York   | 320300     |   70 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE NOT age BETWEEN 30 AND 70;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | Bob Marley      | Bm       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil   | 341020     |   25 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age NOT BETWEEN 30 AND 70;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | Bob Marley      | Bm       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil   | 341020     |   25 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT name, MAX(age) FROM customer;
+--------+----------+
| name   | MAX(age) |
+--------+----------+
| Ashley |       72 |
+--------+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT MAX(age) FROM customer;
+----------+
| MAX(age) |
+----------+
|       72 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT MIN(age) FROM customer;
+----------+
| MIN(age) |
+----------+
|       20 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT AVG(age) FROM customer;
+----------+
| AVG(age) |
+----------+
|  45.6000 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name LIKE 'b%';
+--------+--------------+----------+----------+------------+------+
| custId | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C02    | Bob Marley   | Bm       | Toronto  | 100100     |   23 |
| C07    | Bobby Chacko | Chac     | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name NOT LIKE 'b%';
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name NOT LIKE '%n';
+--------+---------------+----------+------------+------------+------+
| custId | name          | nickname | city       | postalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C01    | Ashley        | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley    | Bm       | Toronto    | 100100     |   23 |
| C04    | Denial Jack   | DJ       | Brasil     | 341020     |   25 |
| C06    | Eston M.      | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko  | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp       | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name LIKE '%n';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C05    | Donna Newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city LIKE 'n%';
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city LIKE 'New%';
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name LIKE '__n%';
+--------+--------------+----------+---------+------------+------+
| custId | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brasil  | 341020     |   25 |
| C05    | Donna Newman | New      | Toronto | 130120     |   50 |
| C09    | Tony Special | Specie   | GTA     | 418921     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE name LIKE '__n_a%';
+--------+--------------+----------+---------+------------+------+
| custId | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brasil  | 341020     |   25 |
| C05    | Donna Newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer LIMIT 4;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age IN (20, 25, 65, 72);
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brasil   | 341020     |   25 |
| C06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age NOT IN (20, 25, 65, 72);
+--------+--------------+----------+------------+------------+------+
| custId | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley   | Bm       | Toronto    | 100100     |   23 |
| C05    | Donna Newman | New      | Toronto    | 130120     |   50 |
| C07    | Bobby Chacko | Chac     | New York   | 320300     |   70 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city NOT IN ('Toronto', 'GTA', 'New York', 'WDC', 'USA');
+--------+-------------+----------+------------+------------+------+
| custId | name        | nickname | city       | postalCode | age  |
+--------+-------------+----------+------------+------------+------+
| C04    | Denial Jack | DJ       | Brasil     | 341020     |   25 |
| C10    | Jack Sp     | Sparrow  | New Jersey | 102301     |   35 |
+--------+-------------+----------+------------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city IN ('Toronto', 'GTA', 'New York', 'WDC', 'USA');
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto  | 100100     |   23 |
| C03    | Cherlies Theron | Cher     | New York | 120134     |   20 |
| C05    | Donna Newman    | New      | Toronto  | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE city IN ('Toronto', 'GTA', 'WDC', 'USA');
+--------+---------------+----------+---------+------------+------+
| custId | name          | nickname | city    | postalCode | age  |
+--------+---------------+----------+---------+------------+------+
| C01    | Ashley        | Ash      | WDC     | 321200     |   34 |
| C02    | Bob Marley    | Bm       | Toronto | 100100     |   23 |
| C05    | Donna Newman  | New      | Toronto | 130120     |   50 |
| C06    | Eston M.      | M.       | Toronto | 201023     |   65 |
| C08    | Ashko Charles | AK       | USA     | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA     | 418921     |   62 |
+--------+---------------+----------+---------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT DISTINCT(city) 'Unique Cities' FROM customer;
+---------------+
| Unique Cities |
+---------------+
| WDC           |
| Toronto       |
| New York      |
| Brasil        |
| USA           |
| GTA           |
| New Jersey    |
+---------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT COUNT(DISTINCT(city)) 'Unique Cities' FROM customer;
+---------------+
| Unique Cities |
+---------------+
|             7 |
+---------------+
1 row in set (0.01 sec)

MariaDB [CSD2204s18]> SELECT name FROM customer ORDER BY name ASC;
+-----------------+
| name            |
+-----------------+
| Ashko Charles   |
| Ashley          |
| Bob Marley      |
| Bobby Chacko    |
| Cherlies Theron |
| Denial Jack     |
| Donna Newman    |
| Eston M.        |
| Jack Sp         |
| Tony Special    |
+-----------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer ORDER BY name DESC;
+--------+-----------------+----------+------------+------------+------+
| custId | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C04    | Denial Jack     | DJ       | Brasil     | 341020     |   25 |
| C03    | Cherlies Theron | Cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.01 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer ORDER BY age DESC LIMIT 1;
+--------+---------------+----------+------+------------+------+
| custId | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM customer WHERE age != (select age from customer order by age DESC limit 1) order by age DESC Limit 1;
+--------+--------------+----------+----------+------------+------+
| custId | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | Chac     | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age DESC limit 2) AS t ORDER BY age ASC Limit 1;
+--------+--------------+----------+----------+------------+------+
| custId | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | Chac     | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age ASC limit 2) AS t ORDER BY age DESC Limit 1;
+--------+------------+----------+---------+------------+------+
| custId | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| C02    | Bob Marley | Bm       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.00 sec)

