# Hospital Management System and Patient Analytics Using SQL 🏥

## Objective
The objective of this project is to design and manage a hospital database system using SQL. The project demonstrates relational database concepts, patient-doctor appointment management, DDL and DML operations, joins, aggregate functions, and analytical SQL queries.

---

## Project Description
This project manages three core entities:

1. Patients
2. Doctors
3. Appointments

The database is designed to maintain patient records, doctor information, and appointment schedules while ensuring data integrity through constraints and relationships.

The project demonstrates:
- Database creation
- Table relationships
- DDL operations
- DML operations
- Aggregate analysis
- Join operations
- Subqueries
- Appointment analytics

---

## Database Schema

### Patients Table
Stores patient details.

| Column Name | Data Type | Constraints |
|-------------|-----------|-------------|
| PatientID | INT | PRIMARY KEY, AUTO_INCREMENT |
| PatientName | VARCHAR(100) | NOT NULL |
| Age | INT | CHECK(Age >= 0 AND Age <= 120) |
| Gender | ENUM | NOT NULL |
| ContactNumber | VARCHAR(20) | UNIQUE |
| City | VARCHAR(50) | DEFAULT 'Chennai' |

---

### HospitalDoctors Table
Stores doctor information.

| Column Name | Data Type | Constraints |
|-------------|-----------|-------------|
| DoctorID | INT | PRIMARY KEY, AUTO_INCREMENT |
| DoctorName | VARCHAR(100) | NOT NULL |
| Specialization | VARCHAR(50) | NOT NULL |
| Experience | INT | CHECK(Experience >= 2) |

---

### Appointments Table
Stores appointment details between patients and doctors.

| Column Name | Data Type | Constraints |
|-------------|-----------|-------------|
| AppointmentID | INT | PRIMARY KEY, AUTO_INCREMENT |
| PatientID | INT | FOREIGN KEY |
| DoctorID | INT | FOREIGN KEY |
| AppointmentDate | DATE | NOT NULL |
| Status | VARCHAR(20) | DEFAULT 'Scheduled' |

---

## Features
- Relational database design
- Primary and foreign key implementation
- ON DELETE CASCADE
- ON DELETE SET NULL
- CHECK, UNIQUE, and DEFAULT constraints
- DDL operations
- DML operations
- Data filtering and sorting
- JOIN operations
- Aggregate functions
- GROUP BY and HAVING
- Subqueries and nested queries
- Patient and appointment analytics

---

## SQL Concepts Covered

### DDL (Data Definition Language)
- CREATE DATABASE
- CREATE TABLE
- ALTER TABLE
- MODIFY COLUMN
- DROP COLUMN
- RENAME TABLE
- RENAME COLUMN

### DML (Data Manipulation Language)
- INSERT INTO
- SELECT Statement
- WHERE Clause
- ORDER BY
- DISTINCT
- GROUP BY
- HAVING
- JOIN Operations
- Subqueries

---

## Queries Implemented

### Basic Queries
- Display all patient, doctor, and appointment records
- Display patients from Chennai
- Display patients older than 30
- Sort patients by age descending
- List unique patient cities

### Filtering Queries
- Doctors specialized in Cardiology or Pediatrics
- Patients whose names start with 'P'

### Aggregate Functions
- Count total patients
- Count patients per city
- Count doctors by specialization
- Count appointments handled by each doctor
- Calculate average age by gender

### JOIN Queries
- List appointments with patient and doctor names
- List patients and their appointments
- List doctors and their appointments

### Appointment Analytics
- Count completed appointments by doctor
- Count appointments by appointment date

### Subqueries
- Find patients with completed appointments
- Find patients older than average age

---

## Sample Business Questions Solved

1. Which doctors handled the highest number of appointments?
2. Which city has the most patients?
3. Which patients completed appointments?
4. What is the average age of patients by gender?
5. Which doctors specialize in Cardiology or Pediatrics?
6. Which appointment dates had the highest number of appointments?
7. Which patients are older than the average patient age?

---

## Learning Outcomes
By completing this project, you will learn:
- How relational hospital databases are designed
- How foreign key relationships work
- How to apply SQL constraints for data integrity
- How DDL and DML operations work
- How to perform joins and aggregate analysis
- How subqueries help solve analytical problems
- How SQL is used in healthcare management systems

---

## Conclusion
This project provides practical experience in SQL-based hospital management and patient analytics systems. It demonstrates essential database operations and analytical SQL techniques commonly used in healthcare and enterprise database applications.

---
