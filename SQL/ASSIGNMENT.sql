create database marketcompany;

use marketcompany;

create table M_company(
companyid  int Primary key not null,
company_name varchar(45) not null,
street varchar(45) not null,
city varchar(45) not null,
state varchar(45) not null,
zip varchar(10) not null);

create table M_contact(
contact_id int  not null,
companyid int not null,
Firstname varchar(45) not null,
Lastname varchar(45),
street varchar(45) not null,
city varchar(45) not null,
state varchar(5) not null,
zip varchar(10) not null,
Ismain boolean,
Email varchar(45),
Phone varchar(12) not null,
PRIMARY KEY (contact_id),
FOREIGN KEY (companyid) REFERENCES M_company(companyid));

create table M_contactemployee(
ContactEmployee_id int not null,
contact_id int not null,
Employee_id int not null,
Contact_date date,
Descriptions varchar(100),
PRIMARY KEY (Employee_id),
FOREIGN KEY (contact_id) REFERENCES M_contact(contact_id));

create table M_employee(
Employee_id int not null,
Firstname varchar(45) not null,
Lastname varchar(45),
salary float ,
Hiredate date,
JobTitle varchar(45),
Email varchar(45),
Phone varchar(12) not null,
FOREIGN KEY (Employee_id) REFERENCES M_contactemployee(Employee_id));

INSERT INTO M_company (companyid, company_name, street, city, state, zip) 
VALUES
(1, 'Urban Outfitters, Inc.', '123 Market St', 'Philadelphia', 'PA', '19103'),
(2, 'Toll Brothers', '250 Gibraltar Rd', 'Horsham', 'PA', '19044'),
(3, 'Acme Corp.', '1000 Industrial Blvd', 'Chicago', 'IL', '60601'),
(4, 'Tech Solutions', '456 Silicon Ave', 'San Francisco', 'CA', '94103'),
(5, 'Global Enterprises', '789 Global Rd', 'New York', 'NY', '10001');

INSERT INTO M_contact (contact_id, companyid, Firstname, Lastname, street, city, state, zip, Ismain, Email, Phone)
VALUES
(1, 1, 'Lesley', 'Bland', '123 Market St', 'Philadelphia', 'PA', '19103', TRUE, 'lesley.bland@urbanoutfitters.com', '215-555-1234'),
(2, 2, 'Dianne', 'Connor', '250 Gibraltar Rd', 'Horsham', 'PA', '19044', TRUE, 'dianne.connor@tollbrothers.com', '215-555-5678'),
(3, 3, 'Jack', 'Lee', '1000 Industrial Blvd', 'Chicago', 'IL', '60601', TRUE, 'jack.lee@acmecorp.com', '312-555-8765'),
(4, 4, 'Sarah', 'Kim', '456 Silicon Ave', 'San Francisco', 'CA', '94103', FALSE, 'sarah.kim@techsolutions.com', '415-555-4321'),
(5, 5, 'John', 'Doe', '789 Global Rd', 'New York', 'NY', '10001', FALSE, 'john.doe@globalent.com', '212-555-9876');

INSERT INTO M_contactemployee (ContactEmployee_id, contact_id, Employee_id, Contact_date, Descriptions)
VALUES
(1, 1, 101, '2025-02-10', 'Initial meeting with Lesley Bland for Urban Outfitters'),
(2, 2, 102, '2025-02-12', 'Follow-up with Dianne Connor from Toll Brothers'),
(3, 3, 103, '2025-02-15', 'Meeting with Jack Lee at Acme Corp.'),
(4, 4, 104, '2025-02-18', 'Conference call with Sarah Kim from Tech Solutions'),
(5, 5, 105, '2025-02-20', 'Contract negotiation with John Doe from Global Enterprises');

INSERT INTO M_employee (Employee_id, Firstname, Lastname, salary, Hiredate, JobTitle, Email, Phone)
VALUES
(101, 'Lesley', 'Bland', 60000, '2020-01-10', 'Sales Manager', 'lesley.bland@urbanoutfitters.com', '215-555-1234'),
(102, 'Dianne', 'Connor', 70000, '2018-03-12', 'Project Manager', 'dianne.connor@tollbrothers.com', '215-555-5678'),
(103, 'Jack', 'Lee', 80000, '2017-05-20', 'Lead Engineer', 'jack.lee@acmecorp.com', '312-555-8765'),
(104, 'Sarah', 'Kim', 65000, '2019-07-15', 'Product Manager', 'sarah.kim@techsolutions.com', '415-555-4321'),
(105, 'John', 'Doe', 75000, '2016-09-05', 'Account Manager', 'john.doe@globalent.com', '212-555-9876');


-- QUESTION : 1 : Statement to create the Contact table 
/*
CREATE TABLE M_contact (
    contact_id INT NOT NULL,
    companyid INT NOT NULL,
    Firstname VARCHAR(45) NOT NULL,
    Lastname VARCHAR(45),
    street VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    state VARCHAR(5) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    Ismain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12) NOT NULL,
    PRIMARY KEY (contact_id),
    FOREIGN KEY (companyid) REFERENCES M_company(companyid)
);
*/
 
-- QUESTION : 2 : Statement to create the Employee table 
/*
CREATE TABLE M_employee (
    Employee_id INT NOT NULL,
    Firstname VARCHAR(45) NOT NULL,
    Lastname VARCHAR(45),
    salary FLOAT,
    Hiredate DATE,
    JobTitle VARCHAR(45),
    Email VARCHAR(45),
    Phone VARCHAR(12) NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES M_contactemployee(Employee_id)
);
/*

-- QUESTION : 3 : Statement to create the ContactEmployee table
/* create table M_contactemployee(
ContactEmployee_id int not null,
contact_id int not null,
Employee_id int not null,
Contact_date date,
Descriptions varchar(100),
PRIMARY KEY (Employee_id),
FOREIGN KEY (contact_id) REFERENCES M_contact(contact_id));
*/

-- QUESTION : 4 : In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 
SET SQL_SAFE_UPDATES = 0;

UPDATE M_contact
SET Phone = '215-555-8800'
WHERE Firstname = 'Lesley' AND Lastname = 'Bland';
 
SET SQL_SAFE_UPDATES = 1;

-- QUESTION : 5 : In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .
UPDATE M_company
SET company_name = "Urban Outfitters"
WHERE companyid = "1";

-- QUESTION : 6 :In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).
SELECT * FROM M_contactemployee;

DELETE FROM M_employee WHERE Employee_id = 102;

DELETE FROM M_contactemployee WHERE ContactEmployee_id = 2 AND Employee_id = 102;

-- QUESTION : 7 :Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. 
SELECT e.Firstname, e.Lastname
FROM M_employee e
JOIN M_contactemployee ce ON e.Employee_id = ce.Employee_id
JOIN M_contact c ON ce.contact_id = c.contact_id
JOIN M_company comp ON c.companyid = comp.companyid
WHERE comp.company_name = 'Toll Brothers';

/*QUESTION : 8 :What is the significance of “%” and “_” operators in the LIKE statement? 
%: Represents zero or more characters. It’s used for pattern matching when you need to match any number of characters.
Example: WHERE column_name LIKE 'A%' will match all values starting with A.
_: Represents exactly one character. It’s used for pattern matching when you need to match exactly one character at that position.
Example: WHERE column_name LIKE 'A_ _ _' will match any value that starts with A and has 3 characters after it.*/

/*QUESTION : 9 :  Normalization in the context of databases:
Normalization is the process of organizing data in a database to minimize redundancy and dependency. The goal is to divide large tables into smaller, related tables and ensure the relationships among the tables are logical and reduce the amount of duplicate data.

There are normal forms (1NF, 2NF, 3NF, etc.) that describe the level of normalization a database has reached. The further you go, the less redundant the data becomes, and it minimizes the risk of update anomalies.*/

/*QUESTIOn : 10 What does a JOIN in MySQL mean?:
A JOIN is used to combine rows from two or more tables based on a related column between them. It allows you to retrieve data from multiple tables in a single query.

Common types of JOINs:

INNER JOIN: Returns only the rows that have matching values in both tables.
LEFT JOIN: Returns all rows from the left table, and the matched rows from the right table (if there’s no match, NULL values are returned).
RIGHT JOIN: Returns all rows from the right table, and the matched rows from the left table.
FULL OUTER JOIN: Returns rows when there’s a match in one of the tables (not supported in MySQL directly but can be simulated).*/

/*QUESTION :11:  DDL, DCL, and DML in MySQL:
DDL (Data Definition Language): Includes SQL statements like CREATE, ALTER, DROP that define or modify the structure of database objects like tables, indexes, etc.
DCL (Data Control Language): Includes SQL statements like GRANT and REVOKE to control access to data.
DML (Data Manipulation Language): Includes SQL statements like SELECT, INSERT, UPDATE, DELETE that manipulate data stored in the database.*/

/*QUESTION : 12: Role of the MySQL JOIN clause and common types of joins:
The JOIN clause is used to combine rows from two or more tables in a database based on a related column between them. It is essential for retrieving data from multiple tables in a single query.

Common types of JOINs:

INNER JOIN: Returns only rows that have matching values in both tables.
LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table and matched rows from the right table.
RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table and matched rows from the left table.
FULL OUTER JOIN: Returns all rows when there’s a match in one of the tables.
*/

