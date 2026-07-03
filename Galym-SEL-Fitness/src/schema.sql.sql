create database GalymSEL_GYM;

show databases;
use GalymSEL_GYM;


create table Staff (
    staff_ID int PRIMARY KEY auto_increment,
    Fname varchar(50) not null,
    Lname varchar(50) not null,
    phone varchar(10) not null,
    mail varchar(100) UNIQUE,
    salary double CHECK (salary > 0)
);


alter table Staff auto_increment = 800;
describe Staff;
select * from Staff;



create table membership (
membership_ID int primary key auto_increment,
staff_ID int not null,
type enum ('trial', 'monthly', 'yearly')  DEFAULT 'monthly',
duration enum ('2 weeks', '4 weeks', '12 months') not null,
start_date datetime,
expiration_date datetime NOT NULL,
foreign key (staff_ID) references
Staff(staff_ID),
constraint check_dates CHECK (expiration_date > start_date)
);

alter table membership auto_increment = 1;
describe membership;
select * from membership;



create table trainee (
trainee_ID int primary key auto_increment,
membership_ID int not null,
Fname varchar(60) not null,
Lname varchar(60) not null,
phone varchar(10) UNIQUE,
date_of_birth datetime not null,
height double CHECK (height > 0),
weight double CHECK (weight > 0),
foreign key (membership_ID) references
membership(membership_ID)
);
describe trainee;

alter table trainee auto_increment = 5000;

select * from trainee;




create table interacts(
staff_ID int NOT NULL,
trainee_ID int NOT NULL,
foreign key (staff_ID) references
Staff(staff_ID),
foreign key (trainee_ID) references
trainee(trainee_ID)
);

describe interacts;

show tables;



insert into Staff (Fname, Lname, phone, mail, salary) values 
('Laila', 'Malak', '0501111111', 'Malak@gmail.com', 12000),
('Lama', 'Sama', '0552222222', 'sama@gmail.com', 13000),
('Noura', 'Shumuk', '0564444444', 'Shumuk@gmail.com', 14000),
('Fahda', 'Ahmed', '0543333333', 'f.ahmed@gmail.com', 12500),
('Sara', 'Salem', '0595555555', 's.salem@gmail.com', 13500);
describe staff;
select * from staff;



insert into  membership (staff_ID ,type, duration, start_date, expiration_date) values 
(800,'trial', '2 weeks', '2025-09-25 13:30:00','2025-10-9 13:30:00'),
(801,'yearly', '12 months', '2025-03-12 09:30:00','2026-03-12 09:30:00'),
(802,'monthly', '4 weeks', '2025-01-01 15:39:33','2025-02-01 15:39:33'),
(803,'yearly', '12 months', '2025-12-9 10:43:00','2026-12-9 10:43:00'),
(804,'monthly', '4 weeks', '2026-02-08 20:50:33','2026-03-08 20:50:33');
describe membership;
select * from membership;




INSERT INTO trainee (membership_ID, Fname, Lname, phone, date_of_birth, height, weight) VALUES  
(1, 'Safaa', 'Sobh', '0508815213', '2006-07-10', 166, 72.3),
(2, 'Sahar', 'Hawsawi', '0559876543', '1992-07-25', 162.0, 58.5),
(3, 'Elham', 'Alzahrani', '0561112233', '1988-11-02', 188.2, 90.1),
(4, 'Layan', 'Alshreef', '0544455667', '2001-01-15', 168.4, 64.0),
(5, 'Ruba', 'Al-Jamal', '0533322110', '1998-05-30', 180.0, 81.7);

select * from trainee;




INSERT INTO interacts (staff_ID, trainee_ID) VALUES
(800, 5000),
(800, 5001),
(802, 5002),
(803, 5003),
(804, 5004);


select * from interacts;



SELECT Fname, Lname, weight
FROM trainee
WHERE weight > 70;                                                                                      

SELECT Fname, Lname, salary
FROM Staff
WHERE salary > 13000;



SELECT Staff_ID, COUNT(Trainee_ID) AS total_trainees
FROM INTERACTS
GROUP BY Staff_ID;

SELECT  AVG(salary) AS avg_salary
FROM STAFF;

SELECT SUM(salary) AS total_salary
FROM STAFF;


SELECT t.Fname, t.Lname, m.type, m.duration, m.expiration_date
FROM trainee t LEFT JOIN membership m ON t.membership_ID = m.membership_ID;

SELECT s.staff_ID, s.Fname AS Staff_Fname, t.trainee_ID AS Trainee_ID, t.Fname AS Trainee_Fname, t.Lname AS Trainee_Lname
FROM interacts i JOIN trainee t ON i.trainee_ID = t.trainee_ID RIGHT JOIN Staff s ON i.staff_ID = s.staff_ID;


SELECT Fname, Lname, weight
FROM trainee
WHERE weight > (
    SELECT AVG(weight)
    FROM trainee
);

CREATE VIEW trainee_membership_view AS
SELECT 
    t.trainee_ID,
    t.Fname AS trainee_first_name,
    t.Lname AS trainee_last_name,
    m.type AS membership_type,
    m.duration,
    s.Fname AS staff_first_name
FROM trainee t
JOIN membership m ON t.membership_ID = m.membership_ID
JOIN Staff s ON m.staff_ID = s.staff_ID;


SELECT * FROM trainee_membership_view;


