# 🎓 Training Database

A relational database project designed to manage a complete training and education system using **SQL**.

The database provides a structured way to manage students, instructors, departments, courses, enrollment, attendance, assignments, and submissions.

## ✨ Features

- 👨‍🎓 Student management
- 👨‍🏫 Instructor management
- 🏢 Department management
- 📚 Course management
- 📝 Student enrollment
- 📅 Attendance tracking
- 📋 Assignment management
- 📤 Assignment submissions
- 📞 Student phone numbers
- 📱 Instructor phone numbers
- 🔗 Relationships between database tables
- 🛡️ Primary Keys, Foreign Keys, and Constraints

## 🗂️ Database Tables

### 👨‍🎓 Students

Stores student information including name, date of birth, SSN, major, email, gender, enrollment date, city, and street.

### 👨‍🏫 Instructors

Stores instructor information and connects instructors with their departments.

### 🏢 Departments

Stores department information including department name, department head, and building.

### 📚 Courses

Stores course information including course code, name, description, credit hours, and department.

### 📝 Enrollment

Connects students with courses and stores enrollment dates and grades.

### 📅 Attendance

Stores student attendance records for different courses.

### 📋 Assignments

Stores course assignments including title, description, due date, and maximum score.

### 📤 Submissions

Stores student assignment submissions including submission date, score, and feedback.

### 📞 Student Phones

Stores phone numbers associated with students.

### 📱 Instructor Phones

Stores phone numbers associated with instructors.

## 🛠️ Technologies Used

- SQL
- SQL Server
- Entity Relationship Diagram (ERD)

## 🧩 SQL Concepts Used

- DDL → CREATE, ALTER, DROP
- DML → INSERT, UPDATE, DELETE
- DQL → SELECT
- Primary Keys
- Foreign Keys
- Identity Columns
- Unique Constraints
- Check Constraints

## 📊 Database Design

The database was designed using an **Entity Relationship Diagram (ERD)** to define the entities, attributes, and relationships within the training system.

The main entities include:

- Students
- Instructors
- Departments
- Courses
- Enrollment
- Attendance
- Assignments
- Submissions
- Student Phones
- Instructor Phones

## 🚀 How to Run

1. Open **SQL Server Management Studio (SSMS)**.
2. Create a new database.
3. Run the SQL script.
4. Execute the required queries.
5. Start working with the database.

No additional dependencies are required.

## 📂 Project Structure

```text
Training-Database/
│
├── SQL/
│   └── Training_Database.sql
│
├── ERD/
│   └── Training_Database_ERD.png
│
└── README.md
