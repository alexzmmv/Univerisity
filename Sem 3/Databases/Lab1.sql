
DROP DATABASE University
go
--/*
CREATE DATABASE University
go

USE University

-- Create Buildings table (as it is referenced in Rooms)
CREATE TABLE Buildings (
    Building_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);

-- Create Rooms table (before Classes, as it is referenced there)
CREATE TABLE Rooms (
    Room_ID INT PRIMARY KEY IDENTITY(1,1),
    Building_ID INT NOT NULL,  -- Foreign Key from Buildings
    Name VARCHAR(100) NOT NULL,
    Capacity INT,
    Floor INT,
    Equipment VARCHAR(200),
    AV_Facilities VARCHAR(200),
    FOREIGN KEY (Building_ID) REFERENCES Buildings(Building_ID)
);


-- Create Secretaries table
CREATE TABLE Secretaries (
    Secretary_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Office_Location VARCHAR(100)
);

-- Create Faculties table (as it is referenced by Profiles, Professors, Courses)
CREATE TABLE Faculties (
    Faculty_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Secretary_ID INT NOT NULL UNIQUE,  -- Foreign Key from Secretaries
    Dean VARCHAR(100),
    Established date,
	FOREIGN KEY (Secretary_ID) REFERENCES Secretaries(Secretary_ID)
	
);

-- Create Profiles table (after Faculties)
CREATE TABLE Profiles (
    Profile_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Faculty_ID INT NOT NULL,  -- Foreign Key from Faculties
    Duration_Years INT,
    Degree_Type VARCHAR(50),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculties(Faculty_ID)
);

-- Create Students table (after Profiles)
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Date_of_Birth DATE,
    Profile_ID INT NOT NULL,  -- Foreign Key from Profiles
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Enrollment_Date DATE,
    FOREIGN KEY (Profile_ID) REFERENCES Profiles(Profile_ID)
);

-- Create Professors table (after Faculties)
CREATE TABLE Professors (
    Professor_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Faculty_ID INT NOT NULL,  -- Foreign Key from Faculties
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Office_Location VARCHAR(100),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculties(Faculty_ID)
);

-- Create Courses table (after Faculties)
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY IDENTITY(1,1),
    Code VARCHAR(20) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Faculty_ID INT NOT NULL,  -- Foreign Key from Faculties
    Semester INT,
    Credit_Hours INT,
    Description VARCHAR(500),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculties(Faculty_ID)
);

-- Create Classes table (after Rooms, Professors, and Courses are created)
CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY IDENTITY(1,1),
    Course_ID INT NOT NULL,  -- Foreign Key from Courses
    Professor_ID INT NOT NULL,  -- Foreign Key from Professors
    Room_ID INT NOT NULL,  -- Foreign Key from Rooms
    Date_Time_Start DATETIME,
    Date_Time_End DATETIME,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

-- Create Grades table (after Students and Courses are created)
CREATE TABLE Grades (
    Grade_ID INT PRIMARY KEY IDENTITY(1,1),
    Student_ID INT NOT NULL,  -- Foreign Key from Students
    Course_ID INT NOT NULL,  -- Foreign Key from Courses
    Grade DECIMAL(3, 2),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Create Relationships (Many-to-Many between Students and Courses - Enrollment)
CREATE TABLE Student_Courses (
    Student_ID INT NOT NULL,  -- Foreign Key from Students
    Course_ID INT NOT NULL,  -- Foreign Key from Courses
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Create Relationships (Many-to-Many between Courses and Rooms)
CREATE TABLE Course_Rooms (
    Course_ID INT NOT NULL,  -- Foreign Key from Courses
    Room_ID INT NOT NULL,  -- Foreign Key from Rooms
    PRIMARY KEY (Course_ID, Room_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

--*/