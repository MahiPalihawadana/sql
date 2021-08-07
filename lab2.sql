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
insert into Orders values('70015',3100.6,'2015-04-25','3002','5005');

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

-- Q2  average purchase amount of an order
select avg(purch_amt)
from Orders

-- Q3 number of salesmen currently listing for all of their customers
select count( distinct salesman_id)
from Orders

-- Q4 number of customers who gets at least a gradation of 200 for his/her performance
select count(*) no_of_customers
from Customer
where grade >= 200

-- Q5 get the maximum purchase amount of all the orders
select max(purch_amt) max_purch_amount
from Orders

-- Q6  find out each order number followed by the name of the customers who made the order

select o.ord_no , c.cust_name
from Orders as O inner join Customer as c on o.customer_id= c.c_id
order by o.ord_no

select o.ord_no , c.cust_name
from Orders as O  , Customer as c 
where o.customer_id= c.c_id
order by o.ord_no

-- Q7 find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007
select customer_id, max(purch_amt)
from Orders
where customer_id >= 3002 and customer_id <= 3007
group by customer_id

select customer_id, max(purch_amt)
from Orders
where customer_id between 3002 and 3007
group by customer_id


-- Q8 counts all orders for a date August 17th, 2015

select count(*)
from Orders
where ord_date = '2015-08-17'

-- Q9 counts the number of ... with their order date and ID registering orders for each day

select salesman_id,ord_date,count(*)
from Orders
group by salesman_id,ord_date

-- Q10  find those customers with their name and those salesmen with their name and city who lives in the same city

select distinct c.cust_name, s.FirstName as salesman_name, s.city
from Customer c, salesman s , Orders o
where c.city = s.city and c.c_id=o.customer_id and s.s_id=o.salesman_id

-- Q11 o display all those orders by the customers not located in the same cities where their salesmen lives

select distinct c.cust_name, s.FirstName as salesman_name, s.city,c.city
from Customer c, salesman s , Orders o
where c.city != s.city and c.c_id=o.customer_id and s.s_id=o.salesman_id


select distinct c.cust_name, s.FirstName as salesman_name, s.city,c.city
from Customer c, salesman s , Orders o
where c.city <> s.city and c.c_id=o.customer_id and s.s_id=o.salesman_id

-- Q12 all customers with their name, city, salesman and commission, who served by a salesman and the salesman works at a rate of commission within 12% to 14%

select c.cust_name, c.city, s.FirstName Salesmans_name, s.commission
from Customer c, Salesman s, Orders o
where s.s_id=o.salesman_id and o.customer_id= c.c_id and s.commission between 0.12 and 0.14

-- Q13 all orders with order number, customer name, commission rate and earned commission amount for those customers who carry their grade more than 200

select o.ord_no, c.cust_name,s.commission, (o.purch_amt * s.commission) as  earned_commission_amount
from salesman s,customer c,Orders o
where s.s_id=o.salesman_id and o.customer_id=c.c_id and c.grade>200

-- Q14 o find the highest purchase amount ordered by each customer. With the highest purchased amount, retrieve their ID, and order date
-- with the aggregrate function if we are retreving non aggregrated columns ,all non aggregrated columns should be in group by closure - rule, but there's a issue so nested quaries

select  customer_id, ord_date,purch_amt as Max_purch_amt
from orders
where ( customer_id,purch_amt)
in
(

select customer_id,max(purch_amt)
from orders
group by customer_id  
)


-- Q15 find the highest purchase amount by order date, for only those customers who have highest purchase amount in a day is more than 2000. With the highest purchased amount, retrieve their ID, and order date
-- aggregrate function where closure should in having

select customer_id,ord_date, purch_amt as Max_purch_amt
from orders
where (ord_date,purch_amt)
in
(
select ord_date,max(purch_amt) 
from orders
group by ord_date
having max(purch_amt)>2000
)


-- extra Q , Retrieve the max purch amt from the orders with customer id

select customer_id
from orders
where purch_amt = ( select max(purch_amt) from orders)

-- if need the customer name , join with customer table
select c.cust_name
from orders o, customer c
where o.purch_amt = ( select max(purch_amt) from orders) and o.customer_id=c.c_id



