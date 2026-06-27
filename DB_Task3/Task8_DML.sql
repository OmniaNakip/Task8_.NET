-- 1. SELECT: Retrieve all columns from the Doctor table.
SELECT * 
FROM doctor;
-- 2. ORDER BY: List patients in the Patient table in ascending order of their ages.
SELECT * 
FROM patients
ORDER BY Age;
-- 3. OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
SELECT *
FROM patients
ORDER BY UR_Num
OFFSET 4 ROWS
FETCH NEXT 10 ROWS ONLY;
-- 4. SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
SELECT TOP 5 *
FROM doctor;
-- 5. SELECT DISTINCT: Get a list of unique address from the Patient table.
SELECT DISTINCT Address
FROM Patients;
-- 6. WHERE: Retrieve patients from the Patient table who are aged 25.
SELECT * 
FROM Patients
WHERE Age = 25;
-- 7. NULL: Retrieve patients from the Patient table whose email is not provided.
SELECT *
FROM Patients
WHERE Email IS NULL ;
-- 8. AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.
SELECT *
FROM doctor
WHERE Years_Of_Experience > 5 AND Specialty = 'Cardiology';
-- 9. IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
SELECT *
FROM doctor
WHERE Specialty IN ('Dermatology', 'Oncology');
-- 10. BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
SELECT *
FROM Patients
WHERE Age BETWEEN 18 AND 30;
-- 11. LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT *
FROM doctor
WHERE Name LIKE 'Dr.%'
-- 12. Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
SELECT Name DoctorName, Email DoctorEmail
FROM doctor
-- 13. Joins: Retrieve all prescriptions with corresponding patient names.
SELECT P.*, PT.Name
FROM Prescription P
JOIN patients PT
ON P.UR_num = PT.UR_num;
-- 14. GROUP BY: Retrieve the count of patients grouped by their cities.
SELECT [Address], COUNT(*) AS Patient_Count
FROM patients
GROUP BY [Address];
-- 15. HAVING: Retrieve cities with more than 3 patients.
SELECT [Address], COUNT(*) AS Patient_Count
FROM patients
GROUP BY [Address]
HAVING COUNT(*) > 3;
-- 16. EXISTS: Retrieve patients who have at least one prescription.
SELECT *
FROM patients PT
WHERE EXISTS (
    SELECT 1
    FROM Prescription P
    WHERE P.UR_num = PT.UR_num
);
-- 17. UNION: Retrieve a combined list of doctors and patients.
SELECT [Name]
FROM doctor

UNION

SELECT [Name]
FROM patients;
-- 18. INSERT: Insert a new doctor into the Doctor table.
INSERT INTO doctor
([Name], Email, Phone, Specialty, Years_Of_Experience)
VALUES
('Ahmed Ali', 'ahmed@gmail.com', '01012345678', 'Cardiology', 10);
-- 19. INSERT Multiple Rows: Insert multiple patients into the Patient table.
INSERT INTO patients
([Name], [Address], Age, Email, Phone)
VALUES
('Sara Mohamed', 'Cairo', 22, 'sara@gmail.com', '01111111111'),
('Omar Ali', 'Giza', 30, 'omar@gmail.com', '01222222222');
-- 20. UPDATE: Update the phone number of a doctor.
UPDATE doctor
SET Phone = '01099999999'
WHERE ID = 1;
-- 21. UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.
UPDATE PT
SET PT.[Address] = 'Cairo'
FROM patients PT
JOIN Prescription P
ON PT.UR_Num = P.UR_Num
WHERE P.Doctor_ID = 1;
-- 22. DELETE: Delete a patient from the Patient table.
DELETE FROM patients
WHERE UR_Num = 5;
-- 23. Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Doctor
    ([Name], Email, Phone, Specialty, Years_Of_Experience)
    VALUES
    ('Mona Ahmed', 'mona@gmail.com', '01055555555', 'Dermatology', 8);

    INSERT INTO Patients
    ([Name], [Address], Age, Email, Phone)
    VALUES
    ('Ali Hassan', 'Alex', 25, 'ali@gmail.com', '01122222222');

    COMMIT;

END TRY

BEGIN CATCH
    ROLLBACK;

END CATCH;