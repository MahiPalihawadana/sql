drop database if exists company;
create database company;
use company;

create table Salesman
(
s_id varchar(4),
FirstName varchar(10),
LastName varchar(10),
City varchar(10),
commission real,
constraint Salesman_pk primary key(s_id)
);

create table Customer
(
c_id varchar(4),
cust_name varchar(20),
city varchar(10),
grade int,
constraint customer_pk primary key(c_id)
);


create table Orders
(
ord_no varchar(5),
purch_amt real, 
ord_date date,
customer_id varchar(4) DEFAULT 3001,
salesman_id varchar(4),
constraint Orders_pk primary key(ord_no),
constraint Orders_fk1 foreign key (customer_id) references Customer(c_id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint Orders_fk2 foreign key (salesman_id) references Salesman(s_id) ON DELETE SET NULL ON UPDATE CASCADE
);

insert into Salesman values ('5001','Thilak','Perera','Kandy',0.15);
insert into Salesman values ('5002','Jagath','Goonapala','Colombo',0.13);
insert into Salesman values ('5005','Sarath','Perera','Kandy',0.11);
insert into Salesman values ('5006','Sandun','Peris','Jaffna',0.14);
insert into Salesman values ('5003','Pasan','Moragaha','Galle',0.12);
insert into Salesman values ('5007','Nadun','Weerasiri','Colombo',0.13);

insert into Customer values ('3002','Wijitha Silva','Kandy',100);
insert into Customer values ('3005','Ramani Dias','Galle',200);
insert into Customer values ('3001','Walter Dip','Kandy',100);
insert into Customer values ('3004','John Palitha','Gampola',300);
insert into Customer values ('3007','WCP Senerath','Colombo',200);
insert into Customer values ('3009','Damani Zoysa','Colombo',100);
insert into Customer values ('3008','Radha John','Gampha',300);
insert into Customer values ('3003','Udaya Bandara','Colombo',200);

insert into Orders values ('70001',150.5,'2015-10-05','3005','5002');
insert into Orders values ('70009',270.65,'2015-09-10','3001','5005');
insert into Orders values ('70002',65.26,'2015-10-05','3002','5001');
insert into Orders values ('70004',110.5,'2015-08-17','3009','5003');
insert into Orders values ('70007',948.5,'2015-09-10','3005','5002');
insert into Orders values ('70005',2400.6,'2015-07-27','3007','5001');
insert into Orders values ('70008',5760,'2015-09-10','3002','5001');
insert into Orders values ('70010',1983.43,'2015-10-10','3004','5006');
insert into Orders values ('70003', 2480.4,'2015-10-10','3009', '5003');
insert into Orders values('70012',250.45,'2015-06-27','3008','5002');
insert into Orders values('70011',75.29,'2015-08-17','3003','5007');
insert into Orders values('70013',3045.6,'2015-04-25','3002','5001');

-- question 2

SELECT *
FROM salesman

-- question 3

SELECT FirstName, commission
FROM salesman

-- Q4 ASC | DESC

SELECT FirstName, LastName,commission
FROM salesman
ORDER BY commission ASC

-- Q5 city of salesmen whose last name is Perera

SELECT City
FROM salesman
WHERE LastName='Perera'

-- Q6 first name of salesmen whose first name has "sa"

SELECT FirstName
FROM salesman
WHERE FirstName LIKE '%sa%' 

-- Q7  first name of salesmen from Kandy or getting a commission of 0.13

SELECT FirstName
FROM salesman
WHERE City = 'Kandy' or commission = 0.13

-- Q8  get the count of salesman who are getting a commission above 0.13

SELECT count(*) as noOfSalesman
FROM salesman
WHERE commission > 0.13

-- Average
SELECT  avg(commission)
FROM salesman
WHERE commission > 0.13

-- summation
SELECT  sum(commission)
FROM salesman
WHERE commission > 0.13

-- Max
SELECT  max(commission)
FROM salesman
WHERE commission > 0.13

-- min
SELECT  min(commission)
FROM salesman
WHERE commission > 0.13


-- Q9  total earning of each salesman if the total value of sales made by each salesman is Rs.1000

SELECT s_id, commission * 1000 as total_earning
FROM salesman

-- joins..............................................................................................













