---1.	List all doctors in the "Cardiology" department.
			SELECT *
			FROM  Doctors
			WHERE department = 'Cardiology'

--2.	Find all patients who live in "Port Harcourt".
			SELECT *
			FROM Patients
			WHERE city ='Port Harcourt'

--3.	Show all appointments with status "Cancelled" or "No-show".
			SELECT *
			FROM appointments
			WHERE status = 'Cancelled' 
			OR status ='No-show'

--4.	List the 5 most recent appointments (by date).
			SELECT TOP 5*
			FROM Appointments
			ORDER BY appointment_date DESC

--5.	Show all doctors sorted by years_experience, highest first.
			SELECT *
			FROM Doctors
			ORDER BY years_experience DESC

--6.	Show the 3 patients who registered earliest.
			SELECT TOP 3 *
			FROM Patients
			ORDER BY registration_date ASC

--7.	Count how many appointments each doctor has had.
			SELECT 
				doctor_id,
			COUNT(*) AS total_appointments
			FROM Appointments
			GROUP BY doctor_id

--8.	Find total billing amount collected per payment method.
			SELECT 
				payment_method,
				SUM(amount) AS total_amount
				FROM Billing
				GROUP BY payment_method

--9.	Show departments that have handled more than 10 appointments (HAVING).
			SELECT
			d.department,
			COUNT(a.appointment_id) AS total_appointment
			FROM Appointments a
			INNER JOIN Doctors d ON a.doctor_id = d.doctor_id
			GROUP BY d.department
			HAVING COUNT(a.appointment_id) > 10

--10.	Find the average consultation fee per department.
			SELECT 
				department,
				AVG( consultation_fee) AS Avg_fee
			FROM Doctors
			GROUP BY department 

--11.	List each appointment with the patient's full name and doctor's full name (join Appointments → Patients → Doctors).
			SELECT
				p.first_name,
				p.last_name,
				a.*,
				d.first_name,
				d.last_name
			FROM Appointments a
			INNER JOIN Patients p ON p.patient_id =a.patient_id
			INNER JOIN Doctors d ON d.doctor_id = a. doctor_id

--12.	Show all billing records with the patient name and appointment date attached (join Billing → Appointments → Patients).
		SELECT
			p.first_name,
			p.last_name,
			a.appointment_date,
			b.*
		FROM Billing b
		INNER JOIN Appointments a ON a.appointment_id = b.appointment_id
		INNER JOIN Patients p ON a.patient_id = a.patient_id

--13.	Find all patients who have never had an appointment (LEFT JOIN, IS NULL check).
		SELECT
			p.*
		from Patients p
		LEFT JOIN Appointments a ON p.patient_id = a.patient_id
		WHERE a.appointment_id IS  NUll

--14.	Find appointments between '2026-04-01' and '2026-04-30'.
		SELECT
			appointment_date,
			appointment_type,
			status
		FROM Appointments
		where appointment_date between '2026-04-01' and '2026-04-30'

--15.	Find patients whose last name starts with "O" (LIKE).
		select *
		from Patients
		where last_name like '%o%'

--16.	Find appointments where the type is IN ('Emergency', 'Vaccination').
		select *
		from Appointments
		where appointment_type in ('Emergency', 'Vaccination')

--17.	Find billing records where payment_status is 'Pending' AND payment_method is NOT 'Cash'.
		select 
			amount,
			payment_status,
			payment_method
		from Billing
		where payment_status = 'pending'
		and payment_method <> 'cash'

--18.	Insert a new patient of your choice
		insert into Patients(first_name, last_name, date_of_birth, gender, phone, city, registration_date)
		VALUES ('victory' , 'ikye','2006-02-14','Male','07018182928','Owerri','2026-02-01')

--19.	Insert a new appointment for that patient with any doctor.
		INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_type, status)
		VALUES (23, 2, '2026-04-22', 'Vaccination', 'Completed')

--20.	Update a 'Pending' billing record to 'Paid'.
		update Billing
		set payment_status = 'paid'
		where appointment_id = 14
		and payment_status = 'pending'

--21.	Delete one 'Cancelled' appointment (and its billing record if one exists
		delete Billing
		where appointment_id in (
				select top 1 appointment_id
				from Appointments
				where status = 'Cancelled'
				)