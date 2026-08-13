# Riverside Medical Clinic — SQL + Excel Project

A SQL Server database project for a fictional medical clinic, built to practice core SQL skills and Excel reporting/visualization.

## Project Overview
Riverside Medical Clinic tracks patients, doctors, appointments, and billing. This project involves building the database, running analytical queries, and turning the results into an Excel report with visualizations.

## Tech Stack
- **Database:** SQL Server (SSMS)
- **Reporting:** Microsoft Excel (Power Query, PivotTables, Charts)

## Files in this Project
| File | Description |
|---|---|
| `01_schema_ssms.sql` | Creates the `riverside_clinic` database and 4 tables: Doctors, Patients, Appointments, Billing |
| `02_seed_data_ssms.sql` | Populates the tables with sample data — 8 doctors, 25 patients, 50 appointments, and matching billing records |
| `03_tasks.md` | 21 SQL practice tasks covering filtering, sorting, aggregates, joins, filtering logic, and data manipulation |

## Database Structure
- **Doctors** — doctor_id, name, department, years_experience, consultation_fee
- **Patients** — patient_id, name, date_of_birth, gender, phone, city, registration_date
- **Appointments** — appointment_id, patient_id (FK), doctor_id (FK), appointment_date, appointment_type, status
- **Billing** — bill_id, appointment_id (FK), amount, payment_method, payment_status, bill_date

## How to Run (SSMS)
1. Open SQL Server Management Studio and connect to your local server.
2. Open `01_schema_ssms.sql` and execute it (F5) — this creates the database and tables.
3. Open `02_seed_data_ssms.sql` and execute it (F5) — this loads the dataset.
4. Confirm the data loaded: expand **Databases > riverside_clinic > Tables** in Object Explorer, right-click a table, and choose **Select Top 1000 Rows**.
5. Open a New Query window against `riverside_clinic` and work through `03_tasks.md`.

## Skills Practiced
- SELECT / FROM / WHERE
- Sorting & Limiting
- Aggregate functions with GROUP BY / HAVING
- JOINs (INNER and LEFT, across up to 3 tables)
- Filtering logic (AND, OR, IN, BETWEEN, LIKE, IS NULL)
- Data manipulation (INSERT, UPDATE, DELETE)

## Next Stage
Query results (doctor workload, payment breakdown, department volume, appointment detail) are exported to Excel to build 3 visualizations, followed by a Power Query import/cleanup step.

## Author
Meera — Data with Meera
