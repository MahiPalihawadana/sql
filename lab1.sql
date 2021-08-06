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

insert into Salesman values ('5001','Thilak','Perera','Kandy',0.15);

select *
from Salesman

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

insert into Customer( c_id,cust_name,grade) values ('3015','Saman Perera', 500);
insert into Customer( grade,cust_name,c_id) values (500 ,'Saman Perera','3015');
insert into Customer values('3015', 'Arun',null,100);

insert into Customer values
('3007','WCP Senerath','Colombo',200),
('3009','Damani Zoysa','Colombo',100),
('3008','Radha John','Gampha',300)


insert into orderTable values ('70001',150.5,'2015-10-05','3005','5002');
insert into orderTable values ('70009',270.65,'2015-09-10','3001','5005');
insert into orderTable values ('70002',65.26,'2015-10-05','3002','5001');
insert into orderTable values ('70004',110.5,'2015-08-17','3009','5003');
insert into orderTable values ('70007',948.5,'2015-09-10','3005','5002');
insert into orderTable values ('70005',2400.6,'2015-07-27','3007','5001');
insert into orderTable values ('70008',5760,'2015-09-10','3002','5001');
insert into orderTable values ('70010',1983.43,'2015-10-10','3004','5006');
insert into orderTable values ('70003', 2480.4,'2015-10-10','3009', '5003');
insert into orderTable values('70012',250.45,'2015-06-27','3008','5002');
insert into orderTable values('70011',75.29,'2015-08-17','3003','5007');
insert into orderTable values('70013',3045.6,'2015-04-25','3002','5001');

delete from orderTable where ord_no='70004'

select *
from OrderTable

delete from Customer where city='Kandy'
delete from orderTable where ord_no='70009' or ord_no='70002'

update Customer set city='Matara' where c_id='3005'
update Customer set city='Colombo' , grade =400 where c_id= '3005'

alter table Customer drop column age

