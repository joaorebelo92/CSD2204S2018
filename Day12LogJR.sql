MariaDB [(none)]> USE csd2204s18;
Database changed
MariaDB [csd2204s18]> CREATE VIEW v1 AS SELECT * FROM products;
Query OK, 0 rows affected (0.15 sec)

MariaDB [csd2204s18]> SHOW VIEWS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'VIEWS' at line 1
MariaDB [csd2204s18]> SHOW VIEW;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'VIEW' at line 1
MariaDB [csd2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| client               |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movies               |
| orders               |
| persons              |
| products             |
| regions              |
| v1                   |
+----------------------+
17 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM v1;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.01 sec)

MariaDB [csd2204s18]> CREATE OR REPLACE VIEW v1 AS SELECT * FROM products WHERE price > 100;
Query OK, 0 rows affected (0.06 sec)

MariaDB [csd2204s18]> SELECT * FROM v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> INSER INTO v1 VALUES(20, 'USB port',89, 2)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'INSER INTO v1 VALUES(20, 'USB port',89, 2)' at line 1
MariaDB [csd2204s18]> INSERT INTO v1 VALUES(20, 'USB port',89, 2);
Query OK, 1 row affected (0.10 sec)

MariaDB [csd2204s18]> SELECT * FROM v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB port        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> DELETE FROM v1 WHERE Code = 20;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB port        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name, price FROM products WHERE name LIKE '%drive';
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name, price FROM v1 WHERE name LIKE '%drive';
+------------+-------+
| Name       | Price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
+------------+-------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE OR REPLACE VIEW v2 SELECT name, price FROM products WHERE name LIKE '%drive';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELECT name, price FROM products WHERE name LIKE '%drive'' at line 1
MariaDB [csd2204s18]> CREATE OR REPLACE VIEW v2 AS SELECT name, price FROM products WHERE name LIKE '%drive';
Query OK, 0 rows affected (0.04 sec)

MariaDB [csd2204s18]> SELECT * FROM v2;
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT p.code, p.name "products", manu.name "manufacturer" FROM manu INNER JOIN products p ON p.manufacturer + manu.manufacturer;
ERROR 1054 (42S22): Unknown column 'manu.manufacturer' in 'on clause'
MariaDB [csd2204s18]> SELECT products.code, products.name "products", manu.name "manufacturer" FROM manu INNER JOIN products ON products.manufacturer + manu.manufacturer;
ERROR 1054 (42S22): Unknown column 'manu.manufacturer' in 'on clause'
MariaDB [csd2204s18]> SELECT * FROM manu;
+------+-------------------+
| Code | Name              |
+------+-------------------+
|    1 | Sony              |
|    2 | Creative Labs     |
|    3 | Hewlett-Packard   |
|    4 | Iomega            |
|    5 | Fujitsu           |
|    6 | Winchester        |
|    7 | moxDroid Labs Inc |
|    8 | Dell              |
|    9 | Bell Labs         |
+------+-------------------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT products.code, products.name "products", manu.name "manufacturer" FROM manu INNER JOIN products ON products.manufacturer = manu.manufacturer;
ERROR 1054 (42S22): Unknown column 'manu.manufacturer' in 'on clause'
MariaDB [csd2204s18]> SELECT products.code, products.name "products", manu.name "manufacturer" FROM manu INNER JOIN products ON products.manufacturer = manu.manufacturer;
ERROR 1054 (42S22): Unknown column 'manu.manufacturer' in 'on clause'
MariaDB [csd2204s18]> CREATE OR REPLACE VIEW v4 AS SELECT first_name, last_name, salary FROM employees WHERE salary > all(Select avg(salary) From employees Group by department_id);
Query OK, 0 rows affected (0.06 sec)

MariaDB [csd2204s18]> SELECT products.code, products.name "products", manu.name "manufacturer" FROM manu INNER JOIN products ON products.manufacturer = manu.code;
+------+-----------------+-------------------+
| code | products        | manufacturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB port        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE OR REPLACE VIEW v3 AS SELECT products.code, products.name "products", manu.name "manufacturer" FROM manu INNER JOIN products ON products.manufacturer = manu.code;
Query OK, 0 rows affected (0.02 sec)

MariaDB [csd2204s18]> DROP VIEW IF EXISTS v5;
Query OK, 0 rows affected, 1 warning (0.00 sec)

MariaDB [csd2204s18]> DROP VIEW IF EXISTS v1;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| client               |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movies               |
| orders               |
| persons              |
| products             |
| regions              |
| v2                   |
| v3                   |
| v4                   |
+----------------------+
19 rows in set (0.00 sec)

