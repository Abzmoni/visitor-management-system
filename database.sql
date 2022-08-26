
DROP DATABASE IF EXISTS vms;

CREATE DATABASE vms;
USE vms;

DROP TABLE IF EXISTS user_type;
CREATE TABLE user_type(
    id int not null primary key auto_increment,
    `type` varchar(16) not null
);

INSERT INTO user_type(type) VALUES('Admin');
INSERT INTO user_type(type) VALUES('Staff');
INSERT INTO user_type(type) VALUES('Visitor');


SELECT * FROM user_type;


DROP TABLE IF EXISTS department;
CREATE TABLE department(
    id int not null primary key auto_increment,
    department varchar(16) not null
);

INSERT INTO department(department) VALUES('BlackSentry');
INSERT INTO department(department) VALUES('Cloud Unit');
INSERT INTO department(department) VALUES('Customer Support');
INSERT INTO department(department) VALUES('Procurement');
INSERT INTO department(department) VALUES('Infrastructure');
INSERT INTO department(department) VALUES('Engineering');
INSERT INTO department(department) VALUES('IT Support');
INSERT INTO department(department) VALUES('Product Unit');

SELECT * FROM department;



DROP TABLE IF EXISTS gender;
CREATE TABLE gender(
    id int not null primary key auto_increment,
    gender varchar(16) not null
);

INSERT INTO gender(gender) VALUES('M');
INSERT INTO gender(gender) VALUES('F');

SELECT * FROM gender;


DROP TABLE IF EXISTS purpose;
CREATE TABLE purpose(
    id int not null primary key auto_increment,
    purpose varchar(16) not null
);

INSERT INTO purpose(purpose) VALUES('enquiry');
INSERT INTO purpose(purpose) VALUES('Job Application');
INSERT INTO purpose(purpose) VALUES('Visiting');
INSERT INTO purpose(purpose) VALUES('Appointment');
INSERT INTO purpose(purpose) VALUES('Work');

SELECT * FROM purpose;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id int not null primary key auto_increment,
    username varchar(16) not null,
    email varchar(32) not null,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
    phone_number varchar(16),
    gender_id int not null,
    department_id int not null,
    password varchar(255) not null,
    CONSTRAINT FK_DEPARTMENT FOREIGN KEY(department_id) REFERENCES department(id),
    CONSTRAINT FK_GENDER FOREIGN KEY(gender_id) REFERENCES gender(id)
);

INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');
INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('Vincento', 'mrvincentito@gmail.com', 'VINCENT', 'ITO', '080467894132', 2, 2, 'Playboy@123');
INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('davido', 'david03@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 3, 'Playboy@123');
INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 2, 4, 'Playboy@123');
INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');
INSERT INTO users(username, email, first_name, last_name, phone_number, gender_id, department_id, password) VALUES('zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123');

SELECT * FROM users;

DROP TABLE IF EXISTS visitors;
CREATE TABLE visitors(
    id int(11) not null primary key auto_increment,
    fullname varchar(64) not null,
    user_id int null,
    purpose_id int null,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    address text,
    CONSTRAINT FK_WHOM_TO_SEE FOREIGN KEY (user_id) references users(id),
    CONSTRAINT FK_PURPOSE FOREIGN KEY(purpose_id) references purpose(id)
);

INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );
INSERT INTO visitors(fullname, user_id, purpose_id, date_added, address) VALUES('Mrs. Diya', 2, 2, '2022-08-02', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja' );

SELECT * FROM visitors;


DROP TABLE IF EXISTS clock_in;
CREATE TABLE clock_in(
	visitor_id int not null, 
    time_in timestamp DEFAULT CURRENT_TIMESTAMP,-- TIME IN timestamp,
    time_out timestamp default '2000-08-02 00:00:00',
    CONSTRAINT FK_VISITORS PRIMARY KEY(visitor_id, time_in),
    CONSTRAINT FK_VISITORS_ID FOREIGN KEY (visitor_id) references visitors(id)
);


SHOW TABLES;

