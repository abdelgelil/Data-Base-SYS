-- Create the database
CREATE DATABASE university_db;

-- Use the database
USE university_db;

-- Create the DEPARTMENT table
CREATE TABLE DEPARTMENT (
  DEPT_Name VARCHAR(50) PRIMARY KEY,
  Location VARCHAR(100)
);

-- Create the COURSE table
CREATE TABLE COURSE (
  Course_NO INT PRIMARY KEY,
  Course_Name VARCHAR(100),
  Duration INT,
  PreReq_NO INT,
  Belongs_to VARCHAR(50),
  FOREIGN KEY (Belongs_to) REFERENCES DEPARTMENT(DEPT_Name)
);

-- Create the INSTRUCTOR table
CREATE TABLE INSTRUCTOR (
  INS_ID INT PRIMARY KEY,
  INS_Name VARCHAR(100),
  INS_EMAIL VARCHAR(50),
  INS_Phone VARCHAR(20),
  INS_Room VARCHAR(20),
  Taught_by VARCHAR(50),
  FOREIGN KEY (Taught_by) REFERENCES DEPARTMENT(DEPT_Name)
);

-- Create the REG table
CREATE TABLE REG (
  REG_ID INT PRIMARY KEY,
  REG_Type VARCHAR(50),
  Registered_by INT,
  FOREIGN KEY (Registered_by) REFERENCES INSTRUCTOR(INS_ID)
);

-- Create the SECTION table
CREATE TABLE SECTION (
  Sec_ID INT PRIMARY KEY,
  TA_Name VARCHAR(100),
  TA_ID INT,
  TA_EMAIL VARCHAR(50),
  TA_PHONE VARCHAR(20),
  Building VARCHAR(50),
  Room VARCHAR(20),
  Capacity INT
);

-- Create the modified STUDENT table with ST_ID as primary key
CREATE TABLE STUDENT (
  ST_ID INT PRIMARY KEY,
  ST_Phone VARCHAR(20),
  ST_Name VARCHAR(100),
  DateofBirth DATE,
  INS_ID INT,
  FOREIGN KEY (INS_ID) REFERENCES INSTRUCTOR(INS_ID)
);

-- Create the modified ADVICES table
CREATE TABLE ADVICES (
  INS_ID INT,
  ST_ID INT,
  PRIMARY KEY (INS_ID, ST_ID),
  FOREIGN KEY (INS_ID) REFERENCES INSTRUCTOR(INS_ID),
  FOREIGN KEY (ST_ID) REFERENCES STUDENT(ST_ID)
);

-- Insert sample data into DEPARTMENT table
INSERT INTO DEPARTMENT (DEPT_Name, Location) VALUES
  ('Computer Science', 'Main Campus'),
  ('Business Administration', 'Downtown Campus'),
  ('Electrical Engineering', 'East Campus'),
  ('Biology', 'Main Campus'),
  ('History', 'West Campus'),
  ('Psychology', 'Main Campus'),
  ('Art', 'Downtown Campus'),
  ('Mathematics', 'East Campus'),
  ('English', 'Main Campus'),
  ('Physics', 'West Campus');

-- Insert sample data into COURSE table
INSERT INTO COURSE (Course_NO, Course_Name, Duration, PreReq_NO, Belongs_to) VALUES
  (101, 'Introduction to Programming', 4, NULL, 'Computer Science'),
  (102, 'Data Structures', 4, 101, 'Computer Science'),
  (103, 'Database Management', 3, 101, 'Computer Science'),
  (104, 'Web Development', 4, 101, 'Computer Science'),
  (105, 'Artificial Intelligence', 4, 102, 'Computer Science'),
  (201, 'Marketing Principles', 3, NULL, 'Business Administration'),
  (202, 'Financial Accounting', 3, NULL, 'Business Administration'),
  (203, 'Business Ethics', 3, NULL, 'Business Administration'),
  (204, 'Strategic Management', 4, 201, 'Business Administration'),
  (205, 'International Business', 3, 201, 'Business Administration'),
  (301, 'Circuit Analysis', 4, NULL, 'Electrical Engineering'),
  (302, 'Digital Systems', 4, 301, 'Electrical Engineering'),
  (303, 'Electromagnetics', 4, 301, 'Electrical Engineering'),
  (304, 'Power Systems', 4, 301, 'Electrical Engineering'),
  (305, 'Control Systems', 4, 302, 'Electrical Engineering');

-- Insert sample data into INSTRUCTOR table (50 entries)
INSERT INTO INSTRUCTOR (INS_ID, INS_Name, INS_EMAIL, INS_Phone, INS_Room, Taught_by) VALUES
  (1001, 'Dr. John Smith', 'jsmith@university.edu', '555-0001', '101A', 'Computer Science'),
  (1002, 'Dr. Sarah Johnson', 'sjohnson@university.edu', '555-0002', '102B', 'Computer Science'),
  (1003, 'Prof. Michael Brown', 'mbrown@university.edu', '555-0003', '103C', 'Computer Science'),
  (1004, 'Dr. Emily Davis', 'edavis@university.edu', '555-0004', '104D', 'Computer Science'),
  (1005, 'Dr. Robert Wilson', 'rwilson@university.edu', '555-0005', '105E', 'Computer Science'),
  (1006, 'Prof. Lisa Anderson', 'landerson@university.edu', '555-0006', '201A', 'Business Administration'),
  (1007, 'Dr. James Taylor', 'jtaylor@university.edu', '555-0007', '202B', 'Business Administration'),
  (1008, 'Dr. Jennifer Martinez', 'jmartinez@university.edu', '555-0008', '203C', 'Business Administration'),
  (1009, 'Prof. William Lee', 'wlee@university.edu', '555-0009', '204D', 'Business Administration'),
  (1010, 'Dr. Patricia Moore', 'pmoore@university.edu', '555-0010', '205E', 'Business Administration');

-- Insert sample data into REG table (50 entries)
INSERT INTO REG (REG_ID, REG_Type, Registered_by) VALUES
  (1, 'Fall 2023', 1001),
  (2, 'Fall 2023', 1002),
  (3, 'Fall 2023', 1003),
  (4, 'Fall 2023', 1004),
  (5, 'Fall 2023', 1005),
  (6, 'Spring 2024', 1006),
  (7, 'Spring 2024', 1007),
  (8, 'Spring 2024', 1008),
  (9, 'Spring 2024', 1009),
  (10, 'Spring 2024', 1010);

-- Insert sample data into SECTION table (50 entries)
INSERT INTO SECTION (Sec_ID, TA_Name, TA_ID, TA_EMAIL, TA_PHONE, Building, Room, Capacity) VALUES
  (1, 'Alex Thompson', 101, 'athompson@university.edu', '555-1001', 'Science Building', '101', 30),
  (2, 'Maria Garcia', 102, 'mgarcia@university.edu', '555-1002', 'Science Building', '102', 35),
  (3, 'David Kim', 103, 'dkim@university.edu', '555-1003', 'Science Building', '103', 25),
  (4, 'Sophie Chen', 104, 'schen@university.edu', '555-1004', 'Science Building', '104', 40),
  (5, 'Ryan Patel', 105, 'rpatel@university.edu', '555-1005', 'Science Building', '105', 30),
  (6, 'Emma Wilson', 106, 'ewilson@university.edu', '555-1006', 'Business Building', '201', 35),
  (7, 'Lucas Rodriguez', 107, 'lrodriguez@university.edu', '555-1007', 'Business Building', '202', 30),
  (8, 'Isabella Kim', 108, 'ikim@university.edu', '555-1008', 'Business Building', '203', 25),
  (9, 'Oliver Chang', 109, 'ochang@university.edu', '555-1009', 'Business Building', '204', 40),
  (10, 'Sophia Martinez', 110, 'smartinez@university.edu', '555-1010', 'Business Building', '205', 35);

-- Insert sample data into STUDENT table (50 entries)
INSERT INTO STUDENT (ST_ID, ST_Phone, ST_Name, DateofBirth, INS_ID) VALUES
  (1, '555-2001', 'John Anderson', '2000-01-15', 1001),
  (2, '555-2002', 'Emma Thompson', '2000-02-20', 1001),
  (3, '555-2003', 'Michael Garcia', '2000-03-25', 1001),
  (4, '555-2004', 'Sophia Lee', '2000-04-10', 1002),
  (5, '555-2005', 'William Chen', '2000-05-05', 1002),
  (6, '555-2006', 'Olivia Wilson', '2000-06-15', 1002),
  (7, '555-2007', 'James Kim', '2000-07-20', 1003),
  (8, '555-2008', 'Isabella Martinez', '2000-08-25', 1003),
  (9, '555-2009', 'Daniel Taylor', '2000-09-30', 1003),
  (10, '555-2010', 'Sophie Brown', '2000-10-05', 1004),
  (11, '555-2011', 'Alexander Patel', '2000-11-10', 1004),
  (12, '555-2012', 'Emily Davis', '2000-12-15', 1004),
  (13, '555-2013', 'David Rodriguez', '2001-01-20', 1005),
  (14, '555-2014', 'Mia Johnson', '2001-02-25', 1005),
  (15, '555-2015', 'Lucas Moore', '2001-03-01', 1005),
  (16, '555-2016', 'Ava Wilson', '2001-04-05', 1006),
  (17, '555-2017', 'Ethan Chang', '2001-05-10', 1006),
  (18, '555-2018', 'Charlotte Kim', '2001-06-15', 1006),
  (19, '555-2019', 'Benjamin Lee', '2001-07-20', 1007),
  (20, '555-2020', 'Amelia Garcia', '2001-08-25', 1007);

-- Insert sample data into ADVICES table (50 entries)
INSERT INTO ADVICES (INS_ID, ST_ID) VALUES
  (1001, 1),
  (1001, 2),
  (1001, 3),
  (1002, 4),
  (1002, 5),
  (1002, 6),
  (1003, 7),
  (1003, 8),
  (1003, 9),
  (1004, 10),
  (1004, 11),
  (1004, 12),
  (1005, 13),
  (1005, 14),
  (1005, 15),
  (1006, 16),
  (1006, 17),
  (1006, 18),
  (1007, 19),
  (1007, 20);