create database company

use company

create table Customer
(
c_id int primary key,
cust_name varchar(20),
city varchar(30),
grade int
)

drop table Customer

create table Customer
(
c_id varchar(4) primary key,
cust_name varchar(20),
city varchar(30),
grade int
)


create table Salesman
(
s_id varchar(4), 
FirstName varchar(10),
LastName varchar(15),
City varchar(10),
commission real,
constraint salesman_PK primary key(s_id)
)

alter table Customer add age int
alter table Customer add salary real after city

create table orderTable
(
ord_no varchar(5),
purch_amt real,
ord_date date,
customer_id varchar(4) default 3005,
salesman_id varchar(4) default 5001,
constraint orderTable_PK primary key(ord_no),
constraint orderTable_fk1 foreign key(customer_id) references Customer(c_id) on delete restrict on update cascade,
constraint orderTable_fk2 foreign key(salesman_id) references Salesman(s_id) on delete set null on update set default
)



