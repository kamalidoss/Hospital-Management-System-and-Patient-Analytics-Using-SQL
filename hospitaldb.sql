-- DDL (DATA DEFINITION LANGUAGE ) AND DML (Data Manipulation Language)
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- PATIENTS MASTER TABLE
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0 AND Age <= 120),
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    City VARCHAR(50) DEFAULT 'Chennai'
);

-- DOCTORS MASTER TABLE 
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    Experience INT   CHECK (Experience >= 2)
);

-- APPOINTMENTS TABLE 
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT ,
    AppointmentDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Scheduled' CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),

    -- Foreign key constraints 
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



INSERT INTO Patients (PatientName, Age, Gender, ContactNumber, City)
VALUES
('Ravi Kumar', 32, 'Male', '9876543210', 'Chennai'),
('Priya Sharma', 28, 'Female', '9988776655', 'Bangalore'),
('Sanjay Verma', 45, 'Male', '9123456789', 'Mumbai'),
('Anita Desai', 36, 'Female', '9012345678', 'Delhi'),
('Karan Singh', 50, 'Male', '9234567890', 'Chennai'),
('Neha Kapoor', 22, 'Female', '9345678901', 'Bangalore'),
('Arjun Mehta', 41, 'Male', '9456789012', 'Mumbai'),
('Pooja Jain', 29, 'Female', '9567890123', 'Delhi'),
('Rohan Gupta', 33, 'Male', '9678901234', 'Chennai'),
('Sakshi Reddy', 27, 'Female', '9789012345', 'Bangalore');


-- 2. INSERT INTO HOSPITALDOCTORS

INSERT INTO HospitalDoctors (DoctorName, Specialization, Experience)
VALUES
('Dr. Meenakshi', 'Cardiology', 12),
('Dr. Arjun Reddy', 'Dermatology', 7),
('Dr. Kavitha', 'Pediatrics', 10),
('Dr. Vikram Sharma', 'Neurology', 15),
('Dr. Sunita Rao', 'Orthopedics', 9);

-- 3. INSERT INTO APPOINTMENTS (20 rows)

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1, 1, '2025-01-05', 'Scheduled'),
(2, 3, '2025-01-06', 'Scheduled'),
(3, 2, '2025-01-07', 'Completed'),
(4, 4, '2025-01-08', 'Scheduled'),
(5, 5, '2025-01-09', 'Scheduled'),
(6, 1, '2025-01-10', 'Completed'),
(7, 2, '2025-01-11', 'Scheduled'),
(8, 3, '2025-01-12', 'Scheduled'),
(9, 4, '2025-01-13', 'Scheduled'),
(10, 5, '2025-01-14', 'Completed'),
(1, 2, '2025-01-15', 'Scheduled'),
(2, 4, '2025-01-16', 'Completed'),
(3, 5, '2025-01-17', 'Scheduled'),
(4, 1, '2025-01-18', 'Scheduled'),
(5, 2, '2025-01-19', 'Completed'),
(6, 3, '2025-01-20', 'Scheduled'),
(7, 4, '2025-01-21', 'Scheduled'),
(8, 5, '2025-01-22', 'Completed'),
(9, 1, '2025-01-23', 'Scheduled'),
(10, 2, '2025-01-24', 'Scheduled');

-- Add a new column to Patients - ALTER
ALTER TABLE Patients
ADD Email VARCHAR(100);

-- Modify a column (change data type / add NOT NULL) -MODIFY
ALTER TABLE Patients 
MODIFY Age INT NOT NULL;

-- Drop a column - DROP
ALTER TABLE Patients
DROP COLUMN Email;

-- Rename entire table RENAME
RENAME TABLE Doctors TO HospitalDoctors;

-- Rename a column RENAME
ALTER TABLE Patients
RENAME COLUMN Phone TO ContactNumber;

-- 1 to 3 display all the coloumns of all the tables 
select * from appointments;
select * from hospitaldoctors;
select * from patients;

-- 4.display patients from chennai
select patientname,city 
from patients
where city = 'chennai';

-- 5.display patients from chennai and older than 30
select patientname,city,age 
from patients
where city = 'chennai' and age > 30;

-- 6.Select all patients ordered by Age descending.
select patientname,age 
from patients
order by age desc;

-- 7.List unique cities of patients.
select distinct city
from patients;

-- 9.Select doctors specialized in Cardiology or Pediatrics.
select doctorname,Specialization
from hospitaldoctors
where Specialization in ('cardiology','pediatrics');

-- 10.	Select patients whose name starts with 'P'.
select patientname
from patients
where patientname like 'p%';

-- 11.	Count total number of patients.
select count(*) as patients_count from patients;

-- 12.	Count number of patients per city.
select city, count(*) as patients_per_city
from patients
group by city;

-- 13.Count cities having more than 1 patient.
select city, count(*) as patients_per_city
from patients
group by city
having count(*) > 1;

-- 14.	List all appointments with patient and doctor names.
select a.appointmentid,a.appointmentdate,
	   p.patientname,
       h.doctorname
from appointments as a
join 
	patients as p 
	on p.patientid = a.patientid
join hospitaldoctors as h 
	on h.doctorid = a.doctorid;

-- 15.	List all patients and their appointments (if any).
select p.patientname,
	   a.appointmentid,
       a.appointmentdate
from patients as p
left join appointments as a 
     on p.patientid = a.patientid;
     
-- 16.	List all doctors and their appointments (if any).
select h.doctorname,
	   a.appointmentid,
       a.appointmentdate
from hospitaldoctors as h
left join appointments as a 
	   on h.doctorid = a.doctorid;

-- Count doctors by specialization.
select Specialization,count(*) as doctors_count 
from hospitaldoctors
group by Specialization;

-- Find the total number of appointments handled by each doctor.
select doctorid,count(*) as total_appointments
from appointments
group by doctorid;

-- Find the average age of patients by gender.
select gender,avg(age) as avg_age
from patients
group by gender;

-- Find the number of completed appointments for each doctor.
SELECT 
    h.DoctorName,
    COUNT(a.AppointmentID) AS Completed_Appointments
FROM HospitalDoctors h
JOIN Appointments a 
    ON h.DoctorID = a.DoctorID
WHERE a.Status = 'Completed'
GROUP BY h.DoctorName;

-- Find the total number of appointments on each appointment date.
select appointmentdate,count(*) as total_appointments
from appointments
group by appointmentdate;

-- Find the total experience of doctors for each specialization.
select doctorname,Specialization,experience
from hospitaldoctors;

-- Select patients who have completed appointments.

SELECT patientid,patientname
FROM patients
WHERE patientid IN (
    SELECT patientid
    FROM appointments
    WHERE Status = 'completed');

-- List cities and patient counts greater than 1.
select count(patientid) as patient_count,city
from patients
group by city
having count(patientid) > 1;

-- List patients older than average age.
select patientname,age 
from patients 
where age >
(select avg(age) from patients);


