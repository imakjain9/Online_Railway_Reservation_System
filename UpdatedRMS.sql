create database RMS;
Use RMS;
select * from Reservation;
DELETE FROM Reservation;
use rms;

CREATE TABLE UserRegistration(
email varchar(30) primary key,
username varchar(20),
password varchar(30),
name varchar(30),
gender varchar(20),
dob datetime,
mobile long,
pin long,
city varchar(40),
state varchar(40),
feedback varchar(250)
)ENGINE=InnoDB;

CREATE TABLE trainrecord(
train_id int primary key,
train_name varchar(50),
train_type varchar(20)
)ENGINE=InnoDB;

create table Reservation(
PNR varchar(10) primary key,
userEmail varchar(50),
passengername varchar(50),
age int,
adhaarcard long,
bookingdate datetime,
train_id int,
sourceStation varchar(50),
destinationStation varchar(50),
seatType varchar(40),
fare int,
seatnumber int,
bookingstatus varchar(30),
paymentstatus varchar(20),
FOREIGN KEY (userEmail) REFERENCES UserRegistration(email)
ON DELETE CASCADE,
FOREIGN KEY (train_id) REFERENCES trainrecord(train_id)
ON DELETE CASCADE
)ENGINE=InnoDB;

create table station(
id int auto_increment primary key,
station_name varchar(30)
)ENGINE=InnoDB;

create table trainshedule(
train_id int,
station_id int,
stop_no int,
arrival_time varchar(20),
departure_time varchar(20),
dstncfrmsrc int,
FOREIGN KEY (train_id) REFERENCES trainrecord(train_id)
ON DELETE CASCADE
)ENGINE=InnoDB;

create table WeekDays(
train_id int primary key,
sunday int,
monday int,
tuesday int,
wednesday int,
thursday int,
friday int,
saturday int,
FOREIGN KEY (train_id) REFERENCES trainrecord(train_id)
ON DELETE CASCADE
)ENGINE=InnoDB;

select A.train_id FROM trainshedule A INNER JOIN trainshedule B ON A.train_id = B.train_id AND A.stop_no < B.stop_no where A.station_id = 1 AND B.station_id = 2;
select A.train_id from weekdays A INNER JOIN Trains B ON A.train_id = B.train_id where A.monday = 1;
select A.station_id, A.stop_no, B.station_name FROM trainshedule A JOIN station B ON A.station_id = B.id where A.train_id = 12450;
CREATE OR REPLACE VIEW showshedule AS select A.*, B.station_name FROM trainshedule A JOIN station B ON A.station_id = B.id where A.train_id = 12450;
select * from showshedule;



