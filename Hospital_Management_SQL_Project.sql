-- Hospital Management SQL Project Script

CREATE DATABASE IF NOT EXISTS hospital_management;


USE hospital_management;

select * from doctors;
select * from patients;
select * from treatments;
select * from appointments;
select * from billing;


-- Q1: 1. What is the total number of patients and doctors?
SELECT (SELECT COUNT(*) FROM patients) AS total_patients, (SELECT COUNT(*) FROM doctors) AS total_doctors;


-- Q2: 2. Which patient had the most appointments?
SELECT patient_id, COUNT(*) AS num_appointments FROM appointments GROUP BY patient_id ORDER BY num_appointments DESC LIMIT 1;


-- Q3: 3. Which doctor had the most appointments?
SELECT doctor_id, COUNT(*) AS num_appointments FROM appointments GROUP BY doctor_id ORDER BY num_appointments DESC LIMIT 1;


-- Q4: 4. What is the gender distribution among patients?
SELECT gender, COUNT(*) AS count FROM patients GROUP BY gender;


-- Q5: 5. How many appointments are scheduled per doctor?
SELECT doctor_id, COUNT(*) AS appointment_count FROM appointments GROUP BY doctor_id;


-- Q6: 6. What is the total revenue generated from all treatments?
SELECT SUM(amount) AS total_revenue FROM billing;


-- Q7: 7. Which treatment is most commonly given to patients?
SELECT treatment_type, COUNT(*) AS count FROM treatments GROUP BY treatment_type ORDER BY count DESC LIMIT 1;


-- Q8: 8. What is the average billing amount per patient?
SELECT patient_id, AVG(amount) AS avg_billing FROM billing GROUP BY patient_id;


-- Q9: 9. Which department has the most number of doctors?
SELECT specialization, COUNT(*) AS doctor_count FROM doctors GROUP BY specialization ORDER BY doctor_count DESC LIMIT 1;


-- Q10: 10. How many patients were treated in each department?
SELECT d.specialization, COUNT(DISTINCT a.patient_id) AS total_patients FROM treatments t JOIN appointments a ON 
t.appointment_id = a.appointment_id JOIN doctors d ON a.doctor_id = d.doctor_id GROUP BY d.specialization
ORDER BY total_patients DESC;


-- Q11: 11. What is the monthly trend of appointments?
SELECT DATE_FORMAT(appointment_date, '%Y-%m') AS month, COUNT(*) AS count FROM appointments GROUP BY month ORDER BY month;


-- Q12: 12. Which day of the week has the most appointments?
SELECT DAYNAME(appointment_date) AS weekday, COUNT(*) AS count FROM appointments GROUP BY weekday ORDER BY count DESC;


-- Q13: 13. What are the top 5 most expensive treatments?
SELECT treatment_id, amount FROM billing ORDER BY amount DESC LIMIT 5;


-- Q14: 14. What is the gender distribution of patients?
SELECT gender, COUNT(*) AS total_patients FROM patients GROUP BY gender;


-- Q15: 15. Find the doctor with the highest average billing per patient.
SELECT CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, ROUND(AVG(b.amount), 2) AS avg_billing
FROM billing b JOIN treatments t ON b.treatment_id = t.treatment_id JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN doctors d ON a.doctor_id = d.doctor_id GROUP BY doctor_name ORDER BY avg_billing DESC LIMIT 1;


