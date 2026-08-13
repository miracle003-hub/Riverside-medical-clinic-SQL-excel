-- Riverside Medical Clinic Database Schema
-- SQL Server (SSMS)


CREATE DATABASE Riverside_clinic;
GO

USE Riverside_clinic;
GO

-- Table: Doctors
-- ============================
CREATE TABLE Doctors (
    doctor_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    years_experience INT,
    consultation_fee DECIMAL(10,2)
);
GO

-- Table: Patients
-- ============================
CREATE TABLE Patients (
    patient_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);
GO

-- Table: Appointments
-- ============================
CREATE TABLE Appointments (
    appointment_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_type VARCHAR(50), -- Consultation, Follow-up, Emergency, Vaccination
    status VARCHAR(20) DEFAULT 'Completed', -- Completed, Cancelled, No-show
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
GO


-- Table: Billing
-- ============================
CREATE TABLE Billing (
    bill_id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30), -- Cash, Card, Insurance, Transfer
    payment_status VARCHAR(20) DEFAULT 'Paid', -- Paid, Pending, Refunded
    bill_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
GO