-- Create SchoolDB database
CREATE DATABASE newDBfinal;
GO

-- Use SchoolDB
USE newDBfinal;
GO

-- Create Pupils Table
CREATE TABLE Pupils (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number NVARCHAR(15) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    school_id INT NOT NULL,
    grade_id INT,
    FOREIGN KEY (school_id) REFERENCES Schools(school_id),
    FOREIGN KEY (grade_id) REFERENCES Grades(grade_id)
);

-- Create Teachers Table
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number NVARCHAR(15) NOT NULL,
    department NVARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    school_id INT NOT NULL,
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

-- Create Grades Table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY IDENTITY(1,1),
    grade NVARCHAR(10) NOT NULL
);

-- Create Schools Table
CREATE TABLE Schools (
    school_id INT PRIMARY KEY IDENTITY(1,1),
    school_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255) NOT NULL
);


CREATE TABLE Pupil_Journal (
    attendance_id INT PRIMARY KEY IDENTITY(1,1),
    pupil_id INT NOT NULL,
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    grade_id INT,
    date DATE NOT NULL,
    status NVARCHAR(20) CHECK (status IN ('Present', 'Absent', 'Late')) NOT NULL,
    FOREIGN KEY (pupil_id) REFERENCES Pupils(student_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (grade_id) REFERENCES Grades(grade_id)
);


INSERT INTO Schools (school_name, address) VALUES
('1 gimnazia ', 'rustaveli'),
('europian skola', 'lisi');


INSERT INTO Grades (grade) VALUES
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10');


INSERT INTO Pupils (first_name, last_name, date_of_birth, gender, email, phone_number, address, school_id, grade_id) VALUES
('Saba', 'Burduli', '2019-03-03', 'M', 'sabagg@790.com', '555-1234', '789 barbare St', 1, 1),
('mari', 'burduli', '2011-07-22', 'F', 'mariburduli@6783.com', '534-2658', '101 barbare St', 2, 2);


INSERT INTO Teachers (first_name, last_name, email, phone_number, department, hire_date, school_id) VALUES
('Nazi', 'Gigashvili', 'Nazi.Gigashvili@example.com', '755-8765', 'Mathematics', '2015-09-01', 1),
('tekla', 'Gigashvili', 'tekla.Gigashvili@example.com', '455-4321', 'Science', '2016-03-15', 2);


INSERT INTO Pupil_Journal (pupil_id, subject_id, teacher_id, grade_id, date, status) VALUES
(1, 101, 1, 1, '2024-12-01', 'Present'),
(2, 102, 2, 2, '2024-12-01', 'Absent');
