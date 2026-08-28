/* DATA DEFINITION LANGUAGE >>>>DDL>>>(Create - Alter - Drop) */
/* DATA Manipulation LANGUAGE >>>> DML >>> (Insert - update - Delete) */
/* DATA Query LANGUAGE >>> (Select) */


Create database Training;
use Training;
Create Table Students(
Student_Id int Identity(1,1) primary key,
First_name varchar(30) Not null,
Mid_name varchar(30) Not null,
Last_name varchar(30) Not null,
Date_of_birth DATE,
SSN varchar(20),
Major varchar(50) Not null,
Email varchar(50) Not null,
Gender varchar(7) check(Gender in ('M','F')),
Enrollment_date DATE,
City varchar(70),
Street varchar(70),
);


Create Table Department(
Department_id int identity(1,1) primary key,
Department_name varchar(100),
Department_head varchar(100),
Building varchar(100),
);

Create Table Instructors(
Instructor_id int identity(1,1) primary key ,
First_name varchar(30) Not null,
Mid_name varchar(30) Not null,
Last_name varchar(30) Not null,
Date_of_birth DATE,
SSN varchar(20),
Email varchar(50) unique,
Sex varchar(7) check(sex in ('M','F')),
City varchar(70),
Street varchar(70),
Department_id int ,
constraint departmen_instructor_Fk foreign key (Department_id)
references Department(Department_id),

);




Create Table Courses (
Course_id int identity(1,1) primary key,
Course_code varchar(50) not null ,
Course_name varchar(100) not null ,
Course_description varchar(100),
Credit_hours int not null check(Credit_hours > 0),
Department_id int not null ,
constraint departmen_course_Fk foreign key (Department_id)
references Department(Department_id),
);


Create Table Enrollment(
Enrollment_id int identity(1,1) primary key,
Grade varchar(2),
Enrollment_date Date,
Student_id int not null,
Course_id int not null,

constraint Enrollment_student_Fk foreign key (Student_id)
references Students(Student_id),

constraint Enrollment_course_Fk foreign key (Course_id)
references Courses(Course_id),

);



Create Table Attendance(
Attendance_id int identity(1,1) primary key,
Attendance_date DATE,
Attendance_Status varchar(50) not null,
Student_id int,
Course_id int,

constraint Attendance_Student_Fk foreign key (Student_id)
references Students(Student_id),

constraint Attendance_course_Fk foreign key (Course_id)
references Courses(Course_id),

);



Create Table Assignment(
Assignment_id int identity(1,1) primary key,
Assignment_Title varchar(100) not null,
Assignment_Description varchar(100) not null,
Due_date DATE,
Max_score decimal(3,2) check(Max_score > 0),
Course_id int,

constraint Assignment_course_Fk foreign key (Course_id)
references Courses(Course_id),

);

Create Table Submission(
Submission_id int identity(1,1),
Submission_Date DATE,
Score decimal(5,2),
Feedback varchar(MAX),
Assignment_id int ,
Student_id int,

constraint Submission_Assignment_Fk foreign key (Assignment_id)
references Assignment(Assignment_id),

constraint Submission_Student_Fk foreign key (Student_id)
references Students(Student_id),

);




Create Table Student_Phones(
StudentPhone_id int identity(1,1) primary key,
Student_id int,
Phone varchar(20),

constraint StudentPhone_Student_Fk foreign key (Student_id)
references Students(Student_id),

);



Create Table Instructor_Phones(
InstructorPhones_id int identity(1,1) primary key,
Instructor_id int,
Phone varchar(20),

constraint InstructorPhones_Student_Fk foreign key (Instructor_id)
references Instructors(Instructor_id),

);




/* DATA DEFINITION LANGUAGE >>>>DDL>>>(Create - Alter - Drop) */

Create Table XYZ(
XYZ_ID int primary key,
);


Alter table xyz 
Add age int;

Alter table xyz
Alter column age varchar(50);

exec sp_rename 'Xyz.age' , 'xyz_age', 'column';

Alter table xyz
drop column age;

Truncate table XYZ;

DROP Table xyz;


/* DATA Manipulation LANGUAGE >>>> DML >>> (Insert - update - Delete) */

insert into students
values('Mohamed','khaled','Gamal','2003-4-14',1252578987,'Testing','mohamedkhaled.e404@gmail.com','M','2025-11-22','Giza','Haram');

insert into students(first_name,mid_name,last_name,Date_of_birth,ssn,major,email,Gender,Enrollment_date,city,street)
Values('Ali','yehya','Mohamed','2002-5-15',12548728,'devops','aliyehya12@gmail.com','M','2025-11-14','Cairo','ALseuze');

insert into students
values('Sara','hussen','ahmed','2002',1247852412,'web developer','sarahuseen45@gmail.com','f','2025-11-1','Giza','fesal');

insert into students(first_name,mid_name,last_name,Date_of_birth,ssn,major,email,Gender,Enrollment_date,city,street)
Values('hussen','mohamed','yehya','2001-2-15',458712184,'testing','hussenmoh547@gmail.com','m','2025-11-7','Cairo','heliopless');

insert into students
values('Reham','emad','hussen','2004-5-18',12545875,'android','rehamemad@gmail.com','f','2025-11-8','Mansora','emad');



INSERT INTO Department (Department_name, Department_head, Building)
VALUES 
('Computer Science', 'Dr. Ahmed Hassan', 'Building A'),
('Business Administration', 'Dr. Mona El-Sharkawy', 'Building B'),
('Information Systems', 'Eng. Youssef Adel', 'Building C'),
('Human Resources', 'Ms. Sara Mahmoud', 'Building D'),
('Electrical Engineering', 'Dr. Karim Abdallah', 'Building E');



INSERT INTO Instructors 
(First_name, Mid_name, Last_name, Date_of_birth, SSN, Email, Gender, City, Street, Department_id)
VALUES
('Omar', 'Ali', 'Hassan', '1985-06-14', '123456789', 'omar.hassan@example.com', 'M', 'Cairo', 'Tahrir St', 1),

('Mona', 'Said', 'Khalil', '1990-03-22', '987654321', 'mona.khalil@example.com', 'F', 'Giza', 'Faisal St', 2),

('Youssef', 'Mahmoud', 'Adel', '1988-11-09', '456123789', 'youssef.adel@example.com', 'M', 'Alexandria', 'Stanley St', 3),

('Sara', 'Ibrahim', 'Mahmoud', '1992-01-30', '147258369', 'sara.mahmoud@example.com', 'F', 'Cairo', 'Nasr City', 4),

('Karim', 'Tarek', 'Abdallah', '1983-09-18', '369258147', 'karim.abdallah@example.com', 'M', 'Mansoura', 'El Gomhoria St', 5);



INSERT INTO Courses (Course_code, Course_name, Course_description, Credit_hours, Department_id)
VALUES
('TST101', 'Software Testing Fundamentals', 'Introduction to manual and automation testing', 3, 1),

('DEV201', 'DevOps Essentials', 'CICD pipelines, Docker, Kubernetes basics', 4, 1),

('WEB150', 'Web Development Basics', 'HTML, CSS, JavaScript for beginners', 3, 3),

('TST205', 'Automation Testing with Selenium', 'UI automation framework with Selenium', 4, 1),

('AND110', 'Android Development', 'Building mobile apps with Java/Kotlin', 3, 1);



INSERT INTO Enrollment (Grade, Enrollment_date, Student_id, Course_id)
VALUES 
('A', '2025-11-22', 2, 1),
('B+', '2025-11-14', 3, 2),
('A-', '2025-11-1', 4, 3),
('B', '2025-11-7', 5, 4),
('A', '2025-11-8' ,6, 5);


INSERT INTO Attendance (Attendance_date, Attendance_Status, Student_id, Course_id)
VALUES
('2025-11-20', 'Present', 2, 1),
('2025-11-20', 'Absent', 3, 2),
('2025-11-20', 'Present', 4, 3),
('2025-11-20', 'Late', 5, 4),
('2025-11-20', 'Present', 6, 5);



INSERT INTO Assignment (Assignment_Title, Assignment_Description, Due_date, Max_score, Course_id)
VALUES
('Database Project', 'Design a relational database', '2025-12-05', 9.50, 1),
('Business Plan', 'Prepare a complete business plan', '2025-12-10', 9.00, 2),
('Web Development', 'Build a responsive website', '2025-12-08', 8.75, 3),
('HR Case Study', 'Analyze HR case scenarios', '2025-12-12', 8.50, 4),
('Circuit Design', 'Design an electrical circuit', '2025-12-15', 9.25, 5);



INSERT INTO Submission (Submission_Date, Score, Feedback, Assignment_id, Student_id)
VALUES
('2025-12-01', 9.50, 'Excellent work', 2, 2),
('2025-12-02', 8.75, 'Good effort', 3, 3),
('2025-12-03', 9.00, 'Well done', 4, 4),
('2025-12-04', 8.50, 'Needs improvement', 5, 5),
('2025-12-05', 9.25, 'Great job', 6, 6);


INSERT INTO Student_Phones (Student_id, Phone)
VALUES
(2, '01012345678'),
(3, '01198765432'),
(4, '01234567890'),
(5, '01055544321'),
(6, '01111222333');


INSERT INTO Instructor_Phones (Instructor_id, Phone)
VALUES
(6, '01011112222'),
(7, '01133334444'),
(8, '01255556666'),
(9, '01077778888'),
(10, '01199990000');




insert into XYZ (XYZ_ID)
VALUES(20);

update XYZ
set XYZ_ID = 5
where XYZ_ID =20;

delete from XYZ
where XYZ_ID = 5;


update students
set Date_of_birth = '2002-1-12'
where student_id = 4;





/* DATA Query LANGUAGE >>> (Select) */

select * from Students;

select Student_Id , First_name from Students;

select email from students 
where student_id =4;

select date_of_birth, Major from students 
order by date_of_birth asc;

select date_of_birth , Major from students 
order by date_of_birth desc;

select date_of_birth , Major ,First_name from students 
order by date_of_birth , First_name;

select  Student_id , avg(score) from Submission
group by Student_id;

select  Student_id , avg(score) as Avg_score from Submission
group by Student_id;


select  Assignment_id , avg(score) as Avg_score from Submission
group by Assignment_id
Having avg(score) > 8.75;

select top 3 score from Submission;

select distinct first_name from students;

select distinct top 1 major , sum(student_id) as Sum_Student_id from students 
where city = 'Giza'
group by major
having sum(student_id) > 3
order by  major asc ;

SELECT * FROM Students
WHERE First_name LIKE 'Mo%';

SELECT * FROM Students
WHERE First_name LIKE 'M%';

SELECT * FROM Students
WHERE First_name LIKE '%o%';

SELECT * FROM Students
WHERE First_name LIKE '%ed';

/* Combining Data */


create table customerss(
id int primary key ,
first_name varchar(50),
country varchar(50),
score int,
);

create table orderss(
order_id int ,
order_date date ,
sales int ,
customerss_id int,
constraint fk_customerss_orderss foreign key (customerss_id)
references customerss(id),
);





INSERT INTO customerss (id, first_name, country, score)
VALUES
(1, 'maria', 'germany', 350),
(2, 'jhon', 'usa', 900),
(3, 'george', 'uk', 750),
(4, 'martin', 'germany', NULL),
(5, 'peter', 'usa', NULL);

INSERT INTO orderss (order_id, order_date, sales, customerss_id)
VALUES
(1001, '2021-04-14', 35,1),
(1002, '2021-04-15', 15,2),
(1003, '2021-04-16', 20,3),
(null, null, NULL,null),
(null, null, NULL,null);



/*1-joins*/

/*inner join*/
select C.id, C.first_name , o.order_id ,o.sales
from customerss AS C
inner join orderss AS o
on C.id = o.customerss_id;

/*LEFT JOIN*/
select C.id, C.first_name , o.order_id ,o.sales
from customerss as C 
left join orderss as o 
on C.id = o.customerss_id;

/*RIGHT Join*/
select C.id, C.first_name , o.order_id ,o.sales
from customerss as C 
right join orderss as o 
on C.id = o.customerss_id;

/*full join*/
select C.id, C.first_name , o.order_id ,o.sales
from customerss as C 
full join orderss as o 
on C.id = o.customerss_id;


/*Left anti join*/
select * 
from customerss as c
left join orderss as o
on c.id = o.customerss_id 
where o.customerss_id is null ;

/*right anti join*/
SELECT *
FROM customerss AS c
RIGHT JOIN orderss AS o
ON c.id = o.customerss_id
WHERE c.id IS NULL;

/*full anti join*/
SELECT *
FROM orderss AS o
full JOIN customerss AS c
ON c.id = o.customerss_id
WHERE c.id IS NULL;


/**/


delete from orderss 
where order_id is null;

insert into orderss (customerss_id) 
values (4),
(5);

select * from orderss;

/*Cross join*/
select *
from customerss 
cross join orderss;





/*2-Set operator*/

select first_name ,id
from customerss
union
select first_name, Student_Id 
from students;



select first_name ,student_id
from students
union all
select first_name, instructor_Id 
from Instructors;

select first_name ,student_id
from students
except   /*different only*/
select first_name, instructor_Id 
from Instructors;


select first_name ,student_id
from students
intersect   /*matched only*/
select first_name, instructor_Id 
from Instructors;


