drop database if exists uniDb;
create database uniDb;
use uniDb;

create table Student
(
studentID varchar(5),
regNo char(7),
studentName varchar(20),
age int,
gpa real,
constraint student_pk primary key(studentId)
);

create table Module
(
moduleID varchar(5),
moduleName varchar(15),
credit int,
constraint modulePK primary key(moduleID)
);

create table Register
(
studentID varchar(5),
moduleID varchar(5),
registerDate date,
constraint registerPK primary key(studentID,moduleID),
constraint registerFK1 foreign key(studentID) references Student(studentID),
constraint registerFK2 foreign key(moduleID) references Module(moduleID)
);

insert into Student values('S001','194123K','Saman',21,2.9);
insert into Student values('S002','195023R','Kamal',20,3.3);
insert into Student values('S003','185025J','Aruni',22,3.2);
insert into Student values('S004','194152P','Kosala',25,1.9);
insert into Student values('S005','174193E','Oshadee',21,2.8);

insert into Module values('M001','DBMS',3);
insert into Module values('M002','Hardware',2.5);
insert into Module values('M003','Software',3.5);
insert into Module values('M004','Programming',4);
insert into Module values('M005','Maths for IT',4);

insert into Register values('S001','M001','2021-03-01');
insert into Register values('S001','M002','2021-03-02');
insert into Register values('S001','M004','2021-03-05');
insert into Register values('S002','M001','2021-02-01');
insert into Register values('S002','M003','2021-01-05');
insert into Register values('S002','M004','2021-03-01');
insert into Register values('S002','M002','2021-02-06');
insert into Register values('S004','M001','2021-03-01');
insert into Register values('S004','M002','2021-03-08');
insert into Register values('S004','M003','2021-03-11');

select *
from Student

select *
from Module

select *
from Register

-- Q1 Find the student names who are following “IT and Management” degree

select *
from Student
where regNo like '__5%'

-- Q2 Find the student names who registered for ‘DBMS’ or ‘Software’

select  distinct s.studentName
from Student s, Module m, Register r
where s.studentID = r.studentID and m.moduleID = r.moduleID and ( m.moduleName = 'DBMS' or m.moduleName = 'Software')

-- Q3 Find the student names who registered for both ‘Hardware’ and ‘Software’

select s.studentName
from Student s, Module m, Register r
where s.studentID = r.studentID and m.moduleID = r.moduleID and  m.moduleName = 'Hardware' and s.studentID in 
(
select s.studentID
from Student s, Module m, Register r
where s.studentID = r.studentID and m.moduleID = r.moduleID and  m.moduleName = 'Software' 
)

-- Q4 Find the module names that no one has been registered
select m.moduleName
from Module m left outer join Register r on m.moduleID= r.moduleID
where r.ModuleID is null

-- another method,nested query
select moduleName
from Module
where moduleId not in 
(
select moduleID
from Register 
)

-- Q5 Find the student names whose GPA is less than the average GPA of all the students
select StudentName
from Student 
where gpa < ( select avg(gpa) from Student)


