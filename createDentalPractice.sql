Drop database if exists dentalpractice;
Show databases;
create database dentalpractice CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;
Use dentalpractice;
Show tables;

-- patient table
Drop table if exists patient;
create table patient (
  ppsn Int(6) unsigned auto_increment,
  firstname varchar(45) NOT NULL,
  surname varchar(45) NOT NULL,
  dob date NOT NULL, 
  phoneno int NOT NULL,
  address varchar(45) NOT NULL,
  email varchar(45) NOT NULL, 
  treatment varchar(45) NOT NULL,
  dentalXray LONGBLOB,
  PRIMARY KEY (ppsn),
  FOREIGN KEY (treatment) references appointment(treatment)
  );

Insert into patient values 
(001, 'John', 'Smith', '1998-01-01', 0871231234, 'Ballybane, Galway', 'john@gmail.com', 'Wisdom Tooth', load_file('c:/patients/xray_001.jpg')), 
(002, 'Mary', 'Coleman', '1990-02-02', 0872232234, 'Blanchardstown, Dublin', 'mary@gmail.com', 'Whitening', load_file('c:/patients/xray_002.jpg')), 
(003, 'Jack', 'McNamee', '1998-03-03', 0873233234, 'Foxford, Mayo', 'jack@gmail.com', 'Check up', load_file('c:/patients/xray_003.jpg'));


-- appointment table
Drop table if exists appointment;
create table appointment (
  ppsn Int(6) unsigned auto_increment,  
  time datetime NOT NULL, 
  treatment varchar(45) NOT NULL, 
  owesmoney varchar(45) NOT NULL, 
  followup varchar(45) NOT NULL, 
  PRIMARY KEY (treatment),
  FOREIGN KEY (ppsn) references patient(ppsn)
  );

Insert into appointment values 
(001, '2020-04-01 09:00:00', 'Wisdom tooth', 'No', 'No'), 
(002, '2020-04-02 10:00:00', 'Cleaning', 'Yes', 'No'), 
(003, '2020-04-03 11:00:00', 'Check up', 'No', 'Yes');


-- payment table
Drop table if exists payment;
create table payment (
  ppsn Int(6) unsigned auto_increment,
  cost int NOT NULL,
  method varchar(45) NOT NULL,
  PRIMARY KEY (method),
  FOREIGN KEY (ppsn) references patient(ppsn),
  FOREIGN KEY (cost) references bill(cost)
  );

Insert into payment values 
(001, '100.00', 'Cheque'), 
(002, '110.00', 'Card'), 
(003, '90.00', 'Cash');


-- bill table
Drop table if exists bill;
create table bill (
  ppsn Int(6) unsigned auto_increment,  
  cost int NOT NULL, 
  treatment varchar(45) NOT NULL, 
  email varchar(45) NOT NULL, 
  PRIMARY KEY (cost),
  FOREIGN KEY (ppsn) references patient(ppsn),
  FOREIGN KEY (treatment) references appointment(treatment)
  );

Insert into bill values 
(001, '100.00', 'Wisdom tooth', 'john@gmail.com'), 
(002, '110.00', 'Cleaning', 'mary@gmail.com'), 
(003, '90.00', 'Check up', 'jack@gmail.com');


-- specialist table
Drop table if exists specialist;
create table specialist (
  name varchar(45) NOT NULL,
  ppsn Int(6) unsigned auto_increment,  
  treatment varchar(45) NOT NULL, 
  PRIMARY KEY (name),
  FOREIGN KEY (ppsn) references patient(ppsn),
  FOREIGN KEY (treatment) references appointment(treatment)
  );

Insert into specialist values 
('Dr. Coleman', 001, 'Wisdom tooth');


-- treatment table
Drop table if exists treatment;
create table treatment (
  ppsn Int(6) unsigned auto_increment,
  dentalreport varchar(45) NOT NULL,
  PRIMARY KEY (dentalreport),
  FOREIGN KEY (ppsn) references patient(ppsn)
  );

Insert into treatment values 
(001, 'Wisdom tooth taken out');


show warnings;
