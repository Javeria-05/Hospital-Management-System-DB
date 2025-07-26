-- Patient Table
CREATE TABLE Patient (
    PatientID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Gender VARCHAR2(10),
    Address VARCHAR2(200),
    Email VARCHAR2(100),
    ContactNumber VARCHAR2(15),
    MedicalHistory VARCHAR2(255),
    Allergies VARCHAR2(255)
);


INSERT INTO Patient VALUES (1, 'Ahmed Khan', 'Male', 'House 15, F-7/1, Islamabad', 'ahmed.khan@example.pk', '03001234567', 'Diabetes', 'None');
INSERT INTO Patient VALUES (2, 'Ayesha Ali', 'Female', 'House 21, Gulshan, Karachi', 'ayesha.ali@example.pk', '03019876543', 'Hypertension', 'Peanuts');
INSERT INTO Patient VALUES (3, 'Bilal Ahmed', 'Male', 'Street 10, Model Town, Lahore', 'bilal.ahmed@example.pk', '03211234567', 'Asthma', 'Dust');
INSERT INTO Patient VALUES (4, 'Fatima Siddiqui', 'Female', 'Block A, Clifton, Karachi', 'fatima.siddiqui@example.pk', '03321234567', 'None', 'Penicillin');
INSERT INTO Patient VALUES (5, 'Hassan Qureshi', 'Male', 'Street 4, DHA, Lahore', 'hassan.qureshi@example.pk', '03451234567', 'Heart Disease', 'None');
INSERT INTO Patient VALUES (6, 'Zara Saeed', 'Female', 'Sector G-11, Islamabad', 'zara.saeed@example.pk', '03121234567', 'Arthritis', 'None');
INSERT INTO Patient VALUES (7, 'Ali Raza', 'Male', 'Street 8, North Nazimabad, Karachi', 'ali.raza@example.pk', '03071234567', 'High Cholesterol', 'None');
INSERT INTO Patient VALUES (8, 'Sana Malik', 'Female', 'Block H, Gulberg, Lahore', 'sana.malik@example.pk', '03261234567', 'Migraines', 'Seafood');
INSERT INTO Patient VALUES (9, 'Usman Tariq', 'Male', 'Sector I-8, Islamabad', 'usman.tariq@example.pk', '03461234567', 'Kidney Stones', 'None');
INSERT INTO Patient VALUES (10, 'Nida Javed', 'Female', 'House 12, Cantt, Rawalpindi', 'nida.javed@example.pk', '03171234567', 'None', 'Nuts');

SELECT * FROM Patient;
-- Doctor Table
CREATE TABLE Doctor (
    DoctorID NUMBER PRIMARY KEY,
    StaffID NUMBER REFERENCES Staff(StaffID), -- Foreign key to Staff table
    Name VARCHAR2(100),
    Specialization VARCHAR2(100),
    YearsOfExperience NUMBER,
    Email VARCHAR2(100),
    ContactNumber VARCHAR2(15),
    Qualification VARCHAR2(50),
    Department VARCHAR2(100)
);

INSERT INTO Doctor VALUES (1, 1, 'Dr. Imran Shah', 'Cardiology', 15, 'dr.imran.shah@example.pk', '03331234567', 'MBBS, FCPS', 'Cardiology');
INSERT INTO Doctor VALUES (2, 2, 'Dr. Ayesha Khalid', 'Pediatrics', 12, 'dr.ayesha.khalid@example.pk', '03451234567', 'MBBS, MCPS', 'Pediatrics');
INSERT INTO Doctor VALUES (3, 3, 'Dr. Omar Farooq', 'Nephrology', 20, 'dr.omar.farooq@example.pk', '03211234567', 'MBBS, FCPS', 'Nephrology');
INSERT INTO Doctor VALUES (4, 4, 'Dr. Maryam Saeed', 'General Surgery', 18, 'dr.maryam.saeed@example.pk', '03131234567', 'MBBS, MS', 'Surgery');
INSERT INTO Doctor VALUES (5, 5, 'Dr. Tariq Malik', 'Neurology', 22, 'dr.tariq.malik@example.pk', '03091234567', 'MBBS, FCPS', 'Neurology');
INSERT INTO Doctor VALUES (6, 6, 'Dr. Amina Hassan', 'Cardiology', 19, 'dr.amina.hassan@example.pk', '03291234567', 'MBBS, FCPS', 'Cardiology');
INSERT INTO Doctor VALUES (7, 7, 'Dr. Salman Aziz', 'Pediatrics', 14, 'dr.salman.aziz@example.pk', '03481234567', 'MBBS, MCPS', 'Pediatrics');
INSERT INTO Doctor VALUES (8, 8, 'Dr. Shireen Ahmed', 'Orthopedics', 25, 'dr.shireen.ahmed@example.pk', '03181234567', 'MBBS, MS', 'Orthopedics');
INSERT INTO Doctor VALUES (9, 9, 'Dr. Faisal Khan', 'Plastic Surgery', 20, 'dr.faisal.khan@example.pk', '03371234567', 'MBBS, MS', 'Plastic Surgery');
INSERT INTO Doctor VALUES (10, 10, 'Dr. Saima Noor', 'Gynecology', 16, 'dr.saima.noor@example.pk', '03061234567', 'MBBS, FCPS', 'Gynecology');

select * from Doctor;
ALTER TABLE Doctor
ADD PatientID NUMBER;

ALTER TABLE Doctor
ADD CONSTRAINT FK_Doctor_Patient
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

CREATE TABLE Staff (
    StaffID NUMBER PRIMARY KEY,
    PatientID NUMBER REFERENCES Patient(PatientID), -- Foreign key to Patient table
    Name VARCHAR2(100),
    Role VARCHAR2(50),
    ContactNumber VARCHAR2(15),
    Email VARCHAR2(100),
    ShiftTiming VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(100)
);
drop table Staff;
DROP TABLE Staff CASCADE CONSTRAINTS;
INSERT INTO Staff VALUES (1, 1, 'Sara Khan', 'Nurse', '03481234567', 'sara.khan@example.pk', 'Day', 70000, 'Emergency');
INSERT INTO Staff VALUES (2, 2, 'Ali Haider', 'Lab Technician', '03191234567', 'ali.haider@example.pk', 'Night', 65000, 'Pathology');
INSERT INTO Staff VALUES (3, 3, 'Rabia Qureshi', 'Receptionist', '03351234567', 'rabia.qureshi@example.pk', 'Day', 40000, 'Front Desk');
INSERT INTO Staff VALUES (4, NULL, 'Fahad Malik', 'Admin', '03031234567', 'fahad.malik@example.pk', 'Day', 80000, 'Management');
INSERT INTO Staff VALUES (5, 4, 'Hira Jamil', 'Nurse', '03281234567', 'hira.jamil@example.pk', 'Night', 72000, 'Pediatrics');


select * from Staff;
-- Appointment Table
CREATE TABLE Appointment (
    AppointmentID NUMBER PRIMARY KEY,
    PatientID NUMBER REFERENCES Patient(PatientID), -- Foreign key to Patient table
    DoctorID NUMBER REFERENCES Doctor(DoctorID),   -- Foreign key to Doctor table
    AppointmentDate DATE,
    AppointmentTime VARCHAR2(10),
    Status VARCHAR2(50),
    ReasonForVisit VARCHAR2(255)
);

INSERT INTO Appointment VALUES (1, 1, 1, TO_DATE('2024-12-01', 'YYYY-MM-DD'), '10:00 AM', 'Scheduled', 'Routine Checkup');
INSERT INTO Appointment VALUES (2, 2, 2, TO_DATE('2024-12-02', 'YYYY-MM-DD'), '11:00 AM', 'Completed', 'Follow-up');
INSERT INTO Appointment VALUES (3, 3, 3, TO_DATE('2024-12-03', 'YYYY-MM-DD'), '2:00 PM', 'Canceled', 'Consultation');
INSERT INTO Appointment VALUES (4, 4, 4, TO_DATE('2024-12-04', 'YYYY-MM-DD'), '9:30 AM', 'Scheduled', 'Surgery Consultation');
INSERT INTO Appointment VALUES (5, 5, 5, TO_DATE('2024-12-05', 'YYYY-MM-DD'), '3:00 PM', 'Completed', 'Neurology Checkup');
INSERT INTO Appointment VALUES (6, 6, 6, TO_DATE('2024-12-06', 'YYYY-MM-DD'), '1:30 PM', 'Scheduled', 'Heart Monitoring');
INSERT INTO Appointment VALUES (7, 7, 7, TO_DATE('2024-12-07', 'YYYY-MM-DD'), '4:00 PM', 'Scheduled', 'Pediatric Vaccination');
INSERT INTO Appointment VALUES (8, 8, 8, TO_DATE('2024-12-08', 'YYYY-MM-DD'), '8:30 AM', 'Completed', 'Surgical Follow-up');
INSERT INTO Appointment VALUES (9, 9, 9, TO_DATE('2024-12-09', 'YYYY-MM-DD'), '10:30 AM', 'Canceled', 'Plastic Surgery Consultation');
INSERT INTO Appointment VALUES (10, 10, 10, TO_DATE('2024-12-10', 'YYYY-MM-DD'), '12:00 PM', 'Scheduled', 'Orthopedic Consultation');


select * from Appointment;
-- Medical Record Table
CREATE TABLE MedicalRecord (
    RecordID NUMBER PRIMARY KEY,
    PatientID NUMBER REFERENCES Patient(PatientID), -- Foreign key to Patient table
    DoctorID NUMBER REFERENCES Doctor(DoctorID),   -- Foreign key to Doctor table
    Diagnosis VARCHAR2(255),
    Treatment VARCHAR2(255),
    Prescriptions VARCHAR2(255),
    TestResults VARCHAR2(255),
    DateOfVisit DATE
);

INSERT INTO MedicalRecord VALUES (1, 1, 1, 'Hypertension', 'Lifestyle modification, Medication', 'Amlodipine 5mg', 'Normal BP readings', TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (2, 2, 2, 'Pediatric Cold', 'Rest, Fluids', 'Paracetamol 250mg', 'Normal recovery', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (3, 3, 3, 'Kidney Stones', 'Surgery', 'Painkillers', 'Stone removed successfully', TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (4, 4, 4, 'Appendicitis', 'Appendectomy', 'Post-op antibiotics', 'Surgical recovery', TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (5, 5, 5, 'Migraine', 'Avoid triggers, Pain relief', 'Sumatriptan 50mg', 'Symptoms controlled', TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (6, 6, 6, 'Heart Disease', 'Stent placement', 'Aspirin 75mg', 'Improved heart function', TO_DATE('2024-04-12', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (7, 7, 7, 'Childhood Vaccination', 'Vaccination', 'N/A', 'All vaccines completed', TO_DATE('2024-04-18', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (8, 8, 8, 'Post-Surgery Recovery', 'Physiotherapy', 'Pain relief medication', 'Normal mobility restored', TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (9, 9, 9, 'Burn Scar Removal', 'Plastic Surgery', 'Scar healing gel', 'Improved scar appearance', TO_DATE('2024-06-15', 'YYYY-MM-DD'));
INSERT INTO MedicalRecord VALUES (10, 10, 10, 'Knee Injury', 'Surgery, Physiotherapy', 'Painkillers', 'Strength regained', TO_DATE('2024-06-30', 'YYYY-MM-DD'));


select * from MedicalRecord;
-- Billing Table
CREATE TABLE Billing (
    BillingID NUMBER PRIMARY KEY,
    PatientID NUMBER REFERENCES Patient(PatientID), -- Foreign key to Patient table
    AppointmentID NUMBER REFERENCES Appointment(AppointmentID), -- Foreign key to Appointment table
    TotalAmount NUMBER,
    PaymentStatus VARCHAR2(50), 
    BillingDate DATE
);

INSERT INTO Billing VALUES (1, 1, 1, 1000, 'Paid', TO_DATE('2024-01-11', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (2, 2, 2, 500, 'Paid', TO_DATE('2024-01-16', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (3, 3, 3, 3000, 'Unpaid', TO_DATE('2024-02-02', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (4, 4, 4, 2000, 'Paid', TO_DATE('2024-03-06', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (5, 5, 5, 700, 'Paid', TO_DATE('2024-03-21', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (6, 6, 6, 5000, 'Paid', TO_DATE('2024-04-13', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (7, 7, 7, 200, 'Paid', TO_DATE('2024-04-19', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (8, 8, 8, 1500, 'Unpaid', TO_DATE('2024-05-11', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (9, 9, 9, 4000, 'Paid', TO_DATE('2024-06-16', 'YYYY-MM-DD'));
INSERT INTO Billing VALUES (10, 10, 10, 2500, 'Paid', TO_DATE('2024-07-01', 'YYYY-MM-DD'));

select * from Billing;
-- Pharmacy Table
CREATE TABLE Pharmacy (
    PharmacyID NUMBER PRIMARY KEY,
    StaffID NUMBER REFERENCES Staff(StaffID), -- Foreign key to Staff table
    MedicineName VARCHAR2(100),
    MedicineCode VARCHAR2(50),
    ExpiryDate DATE,
    QuantityAvailable NUMBER,
    Price NUMBER,
    PrescriptionRequired VARCHAR2(10)
);

INSERT INTO Pharmacy VALUES (1, 1, 'Paracetamol', 'P001', TO_DATE('2025-01-01', 'YYYY-MM-DD'), 500, 5, 'No');
INSERT INTO Pharmacy VALUES (2, 2, 'Amoxicillin', 'A002', TO_DATE('2025-03-01', 'YYYY-MM-DD'), 300, 10, 'Yes');
INSERT INTO Pharmacy VALUES (3, 3, 'Ibuprofen', 'I003', TO_DATE('2025-05-01', 'YYYY-MM-DD'), 400, 8, 'No');
INSERT INTO Pharmacy VALUES (4, 4, 'Metformin', 'M004', TO_DATE('2025-07-01', 'YYYY-MM-DD'), 200, 15, 'Yes');
INSERT INTO Pharmacy VALUES (5, 5, 'Lisinopril', 'L005', TO_DATE('2025-09-01', 'YYYY-MM-DD'), 100, 12, 'Yes');

select *  from Pharmacy;
drop table Pharmacy;

CREATE TABLE patient_payment (
    payment_id INT PRIMARY KEY,                      -- Unique identifier for each payment
    patient_name VARCHAR(50),                        -- Name of the patient
    treatment_code VARCHAR(20),                      -- Code for the treatment or service
    amount INT,                                      -- Amount paid for the treatment
    payment_date DATE,                               -- Date of payment
    payment_method VARCHAR(20),                      -- Payment method (e.g., 'Credit Card', 'Cash')
    card_number VARCHAR(16),                         -- Card number for credit/debit payments
    status VARCHAR(20),                              -- Payment status (e.g., 'Completed', 'Pending')
    comments VARCHAR(255)                            -- Additional comments (e.g., special requests)
);
Select * from patient_payment;
----------------------------LAB 2----------------------------------------------------------------
---- Display PatientID, Name, Email, ContactNumber, and rename Gender as Sex
SELECT PatientID, Name, Email, ContactNumber, Gender AS Sex
FROM Patient;

-- Lab Task 2: Display Name concatenated with Email, and name the columns as Patient and Contact
SELECT Name || ', ' || Email AS Patient, Email AS Contact
FROM Patient;

-- Lab Task 3: Retrieve only distinct ContactNumbers
SELECT DISTINCT ContactNumber
FROM Patient;

-- Lab Task 4: Concatenate Name and Address of patients, use a space as the separator, and name the result as PatientInfo
SELECT Name || ' - ' || Address AS PatientInfo
FROM Patient;

-- Lab Task 5: Display only the Name of patients for simplicity
SELECT Name
FROM Patient;

-- Lab Task 6: Display the structure of the Patient table
DESCRIBE Patient;

-- ACTIVITY 1: Selecting all columns from the Patient table
SELECT * 
FROM Patient;

-- ACTIVITY 2: Selecting specific columns (Name, Email) from the Patient table
SELECT Name, Email 
FROM Patient;

-- ACTIVITY 3: Using Arithmetic Operators (e.g., calculating the length of the Name column)
SELECT Name, LENGTH(Name) * 2 AS NameLengthDoubled 
FROM Patient;

-- ACTIVITY 4: Handling NULL values in Arithmetic Expression
-- (Hypothetically, assuming MedicalHistory might be NULL)
SELECT MedicalHistory, LENGTH(MedicalHistory) * 2 AS HistoryLengthMultiplier 
FROM Patient;

-- ACTIVITY 5: Using Column Aliases (Renaming Name and Email for better readability)
SELECT Name AS Patient_Name, Email AS Patient_Email 
FROM Patient;

-- ACTIVITY 6: Using Concatenation Operator (Concatenating Name and Gender)
SELECT Name || ' (' || Gender || ')' AS FullName 
FROM Patient;

-- ACTIVITY 7: Using Literal Character Strings (Displaying custom message with concatenation)
SELECT Name || ' resides at ' || Address AS PatientDetails 
FROM Patient;

-- ACTIVITY 8: Using Alternative Quote (q) Operator (Inserting custom text while handling special characters)
SELECT Name || q'[ has the medical condition: ]' || MedicalHistory AS PatientCondition 
FROM Patient;

-- ACTIVITY 9: Using DISTINCT Keyword to remove duplicates (Selecting distinct allergies)
SELECT DISTINCT Allergies 
FROM Patient;

-- ACTIVITY 10: Using the DESCRIBE Keyword to show the structure of the Patient table
DESCRIBE Patient;
------------------------------LAB 3----------------------------------------
--LAB TASK 1
----Retrieve the name and email for the patient with PatientID = 1:
SELECT Name, Email 
FROM Patient
WHERE PatientID = 1;
--LAB TASK 2
--Retrieve the name and contact number for patients whose PatientID is not between 5 and 10:
SELECT Name, ContactNumber 
FROM Patient
WHERE PatientID NOT BETWEEN 5 AND 10;
--LAB TASK 3
--Retrieve the name, contact number, and address for patients with the names 'Ali Ahmed' or 'Sara Khan'. Sort the results in ascending order by Address:
SELECT Name, ContactNumber, Address 
FROM Patient
WHERE Name IN ('Ali Ahmed', 'Sara Khan')
ORDER BY Address ASC;
--LAB TASK 4
--Retrieve the name and PatientID of patients with PatientID = 1 or 5, sorted by Name:
SELECT Name, PatientID 
FROM Patient
WHERE PatientID IN (1, 5)
ORDER BY Name ASC;
--LAB TASK 5
--Retrieve the name and email of patients whose contact number is NULL:
SELECT Name, Email 
FROM Patient
WHERE ContactNumber IS NULL;
--LAB TASK 6
--Retrieve the name, address, and medical history for patients with non-null MedicalHistory, sorted by PatientID in descending order:
SELECT Name, Address, MedicalHistory 
FROM Patient
WHERE MedicalHistory IS NOT NULL
ORDER BY PatientID DESC;
--LAB TASK 7
--Retrieve the name and email for patients based on specific PatientID and sorted by the requested columns:
--For PatientID = 3, sorted by Name:
SELECT Name, Email 
FROM Patient
WHERE PatientID = 3
ORDER BY Name ASC;
--For PatientID = 5, sorted by Email:
SELECT Name, Email 
FROM Patient
WHERE PatientID = 5
ORDER BY Email ASC;
---LAB TASK 8
--Retrieve the names of patients whose name contains both 'a' and 'e':
SELECT Name 
FROM Patient
WHERE Name LIKE '%a%' AND Name LIKE '%e%';
---LAB TASK 9
----Retrieve the name and email of patients whose PatientID is not 2, 4, or 8:
SELECT Name, Email 
FROM Patient
WHERE PatientID NOT IN (2, 4, 8);
-----------------------Activities
---ACTIVITY 1
--Retrieve the name and PatientID of the patient with PatientID = 3:
SELECT Name, PatientID 
FROM Patient 
WHERE PatientID = 3;
---ACTIVITY 2
---Retrieve the name and email of patients whose name is 'Ali Ahmed':
SELECT Name, Email 
FROM Patient 
WHERE Name = 'Ali Ahmed';
---ACTIVITY 3
---Retrieve the name, contact number, and PatientID for patients whose PatientID is less than or equal to 5:
SELECT Name, ContactNumber, PatientID 
FROM Patient 
WHERE PatientID <= 5;
---ACTIVITY 4
--Retrieve the PatientID of patients whose PatientID is between 3 and 6:
SELECT PatientID 
FROM Patient 
WHERE PatientID BETWEEN 3 AND 6;
---ACTIVITY 5
--Retrieve names of patients whose names are between 'A' and 'M' alphabetically:
SELECT Name 
FROM Patient 
WHERE Name BETWEEN 'A' AND 'M';
---ACTIVITY 6
----Retrieve names of patients whose names start with 'A':
SELECT Name 
FROM Patient 
WHERE Name LIKE 'A%';
------ACTIVITY 7
---Retrieve the name and email of patients with NULL contact numbers:
SELECT Name, Email 
FROM Patient 
WHERE ContactNumber IS NULL;
---ACTIVITY 8
--Retrieve the name and contact number of patients whose PatientID > 5 and name contains 'a':
SELECT Name, ContactNumber 
FROM Patient 
WHERE PatientID > 5 AND Name LIKE '%a%';
---ACTIVITY 9
--Retrieve PatientID, name, and email of patients sorted by PatientID in descending order:
SELECT PatientID, Name, Email 
FROM Patient 
ORDER BY PatientID DESC;
---ACTIVITY 10
--Using single and double ampersand substitution variables:
SELECT Name, Email 
FROM Patient 
WHERE PatientID = &PatientID;

SELECT Name, Email 
FROM Patient 
WHERE PatientID = &&PatientID;
-----------------------------------------------------------LAB 4------------------------------------------------
--Activity 1: Use of Character Functions
--1. Concatenating Name Fields with Formatting

SELECT 'Patient Name: ' || UPPER(Name) AS "Formatted Name"
FROM Patient;
--. Finding Patients by Address Using INITCAP
SELECT PatientID, Name, Address
FROM Patient
WHERE INITCAP(Address) LIKE 'Dha%';
--- 3. Checking if Medical History Contains 'Asthma'

SELECT PatientID, Name, MedicalHistory,
       LENGTH(MedicalHistory) AS "History Length",
       INSTR(MedicalHistory, 'Asthma') AS "Contains 'Asthma'"
FROM Patient;
----Activity 2: Use of Number Functions
--1. Using MOD on Patient IDs
SELECT Name, PatientID, MOD(PatientID, 3) AS "Remainder"
FROM Patient
WHERE LENGTH(ContactNumber) = 11;
--2. Demonstrating TRUNC and ROUND
SELECT TRUNC(Price, 2), ROUND(Price, 0)
FROM Pharmacy;
----Activity 3: Use of Date Functions
--1. Weeks Since Expiry Date
SELECT MedicineName, 
       (SYSDATE - ExpiryDate)/7 AS "Weeks Until Expiry"
FROM Pharmacy;
--2. Calculating Age in Months and First Birthday
SELECT PatientID, Name, DateOfBirth,
       MONTHS_BETWEEN(SYSDATE, DateOfBirth) AS "Age in Months",
       ADD_MONTHS(DateOfBirth, 12) AS "First Birthday"
FROM Patient;
----Activity 4: Conversion Functions and Conditional Expressions
--1. Formatting Dates and Checking Expired Medicines
SELECT MedicineName, TO_CHAR(ExpiryDate, 'MM/YYYY') AS "Expiry Date"
FROM Pharmacy
WHERE ExpiryDate < SYSDATE;
-----Activity 5: Nesting Functions
--1. Calculating Next Review Date for Patients
SELECT Name, TO_CHAR(NEXT_DAY(ADD_MONTHS(DateOfBirth, 6), 'FRIDAY'), 'Day, Month DD, YYYY') AS "Next Review Date"
FROM Patient;
------Activity 6: Using General Functions
--1. Handling Nulls in Medical History
SELECT Name, NVL(MedicalHistory, 'No History') AS "Medical History"
FROM Patient;
--2. Checking for Missing Phone Numbers
SELECT Name,  NVL2(ContactNumber, 'Has Phone', 'No Phone') AS "Phone Status"
FROM Patient;
-----------------------Lab Tasks
--Lab Task 1: Calculate Salaries with Adjustments

SELECT StaffID AS "Employee ID", Name,
       ROUND(Salary * 1.1, 2) AS "Adjusted Salary"
FROM Staff;
--Lab Task 2: Select Patients with Initials 'A', 'S', or 'F'
SELECT INITCAP(Name) AS "Patient Name"
FROM Patient
WHERE Name LIKE 'A%' OR Name LIKE 'S%' OR Name LIKE 'F%';
--Lab Task 3: Months Since Registration
SELECT Name, CEIL(MONTHS_BETWEEN(SYSDATE, DateOfBirth)) AS "Months Since Birth"
FROM Patient
ORDER BY "Months Since Birth";
--Lab Task 4: Null Handling in Billing
SELECT PatientID, Amount, 
       NVL(InsuranceCoverage, 'Not Covered') AS "Ins
       
       ----------------------------LAB 5--------------------------------------------------------
-- Activity 1: Using Aggregate Functions in SELECT Statement
SELECT AVG(PatientID), MAX(PatientID), MIN(PatientID), SUM(PatientID)
FROM Patient
WHERE Name LIKE '%a%';

-- Activity 2: Using the COUNT Function
-- Count total patients
SELECT COUNT(*)
FROM Patient
WHERE ContactNumber IS NOT NULL;

-- Count patients with a non-null email and whose name starts with 'A'
SELECT COUNT(Email)
FROM Patient
WHERE Email IS NOT NULL
AND Name LIKE 'A%';

-- Activity 3: Using the DISTINCT Keyword
-- Count distinct medical histories (excluding null entries)
SELECT COUNT(DISTINCT MedicalHistory)
FROM Patient;

-- Activity 4: Group Functions and Null Values
-- Average length of Email with nulls ignored
SELECT AVG(LENGTH(Email))
FROM Patient;
  
-- Average length of Email treating nulls as length 0
SELECT AVG(NVL(LENGTH(Email), 0))
FROM Patient;

-- Activity 5: Creating Groups of Data
SELECT Address, AVG(PatientID)
FROM Patient
GROUP BY Address;

-- Activity 6: Grouping by More than One Column
SELECT Address, Gender, COUNT(*) 
FROM Patient
GROUP BY Address, Gender
ORDER BY Address;

-- ACTIVITY 7 Using COUNT with proper grouping
SELECT PatientID, COUNT(Name)
FROM Patient
GROUP BY PatientID;

-- 2: Including all non-aggregate columns in GROUP BY
SELECT PatientID, ContactNumber, COUNT(Name)
FROM Patient
GROUP BY PatientID,ContactNumber;

-- Activity 8: Restricting Group Results Using HAVING Clause
SELECT Address, AVG(PatientID)
FROM Patient
GROUP BY Address
HAVING AVG(PatientID) > 5;

SELECT Gender, MAX(PatientID)
FROM Patient
GROUP BY Gender
HAVING MAX(PatientID) > 7;

-- Activity 9: Nesting Group Functions
SELECT MAX(AVG(PatientID))
FROM Patient
GROUP BY Gender;

-- Lab Task 1
SELECT 
    MAX(PatientID) AS Maximum, 
    MIN(PatientID) AS Minimum, 
    SUM(PatientID) AS Sum, 
    AVG(PatientID) AS Average
FROM Patient;

-- Lab Task 2
SELECT Gender, COUNT(*) AS NumberOfPatients
FROM Patient
GROUP BY Gender;

-- Lab Task 3
SELECT COUNT(*) AS "Patients Without Contact Numbers"
FROM Patient
WHERE ContactNumber IS NULL;

-- Lab Task 4
SELECT 
    (MAX(PatientID) - MIN(PatientID)) AS Difference
FROM Patient;

-- Lab Task 5
SELECT PatientID, Name, Gender
FROM Patient
WHERE Email IS NULL
ORDER BY Name ASC;

-- Lab Task 6
SELECT Gender,COUNT(*) AS NumberOfPatients
FROM Patient
WHERE Address LIKE '%Karachi%'
GROUP BY Gender;
----------------------LAB 6----------------------------------------------------------------
---Activity 1: Creating Natural Joins
SELECT PatientID, Name, Gender, AppointmentID, AppointmentDate, Status 
FROM Patient NATURAL JOIN Appointment;

SELECT AppointmentID, TotalAmount, PaymentStatus, BillingDate
FROM Appointment NATURAL JOIN Billing
WHERE Status = 'Completed';

----Activity 2: Creating Joins with the USING Clause

SELECT DoctorID, Name, Specialization, AppointmentID
FROM Doctor
JOIN Appointment USING (DoctorID);

--Join Patient and Appointment using PatientID:
SELECT PatientID, Name, Gender, AppointmentID
FROM Patient
JOIN Appointment USING (PatientID);

---Activity 3: Using Table Aliases with the USING Clause
---Fetch doctor names and appointments in the Cardiology department:
SELECT d.Name AS DoctorName, a.AppointmentID, a.AppointmentDate
FROM Doctor d
JOIN Appointment a USING (DoctorID)
WHERE d.Department = 'Cardiology';

 
---Fetch staff working in the Emergency department:
SELECT s.Name AS StaffName, s.Role, p.Name AS PatientName
FROM Staff s
JOIN Patient p USING (PatientID)
WHERE s.Department = 'Emergency';

---Activity 4: Creating Joins with the ON Clause
--Fetch patients with their assigned doctors:
SELECT p.Name AS PatientName, d.Name AS DoctorName, d.Specialization
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;

---Activity 5: Creating Three-Way Joins with the ON Clause
SELECT p.Name AS PatientName, d.Name AS DoctorName, b.TotalAmount, b.PaymentStatus
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
JOIN Billing b ON a.AppointmentID = b.AppointmentID;

--Activity 6: Applying Additional Conditions to a Join
SELECT p.Name AS PatientName, d.Name AS DoctorName, a.AppointmentDate
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE d.Specialization = 'Cardiology' AND a.Status = 'Scheduled';

--Activity 7: Self-Join: Joining a Table to Itself
SELECT d1.Name AS DoctorName, d2.Name AS HeadName, d2.Qualification AS HeadQualification
FROM Doctor d1
JOIN Doctor d2 ON d1.Department = d2.Department AND d2.Specialization = 'Neurology'
WHERE d1.YearsOfExperience < 50;

--Activity 8: Retrieving Records with Non-Equijoinss
SELECT s.Name AS StaffName, s.Salary, d.Department 
FROM Staff s 
JOIN Doctor d 
ON s.Department = d.Department 
WHERE s.Salary BETWEEN 50000 AND 80000;

--Activity 9: Retrieving Data Using LEFT OUTER JOIN Fetch all patients and their corresponding appointments (if any):
SELECT p.Name AS PatientName, a.AppointmentID, a.AppointmentDate
FROM Patient p
LEFT OUTER JOIN Appointment a ON p.PatientID = a.PatientID;

--Activity 10: Retrieving Data Using RIGHT OUTER JOIN
SELECT d.Name AS DoctorName, a.AppointmentID
FROM Doctor d
RIGHT OUTER JOIN Appointment a ON d.DoctorID = a.DoctorID;

--Activity 11: Retrieving Data Using FULL OUTER JOIN
SELECT p.Name AS PatientName, b.BillingID, b.TotalAmount
FROM Patient p
FULL OUTER JOIN Billing b ON p.PatientID = b.PatientID;

---Activity 12: Creating Cross Joins
SELECT d.Name AS DoctorName, m.MedicineName
FROM Doctor d
CROSS JOIN Pharmacy m;
--Lab Task 1:
SELECT AppointmentID, AppointmentDate, AppointmentTime, PatientID, TotalAmount
FROM Appointment
NATURAL JOIN Billing;
--Lab Task 2:
SELECT p.Name AS PatientName, b.AppointmentID, b.TotalAmount
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID;
--Lab Task 3:
SELECT p.Name AS PatientName, b.AppointmentID, a.DoctorID
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID
JOIN Appointment a ON b.AppointmentID = a.AppointmentID
WHERE a.DoctorID = 3; 
--Lab Task 4:
SELECT p.Name AS PatientName, b.AppointmentID, a.DoctorID
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID
JOIN Appointment a ON b.AppointmentID = a.AppointmentID;
--Lab Task 5:

SELECT p.Name AS PatientName, 
       b.AppointmentID, 
       a.DoctorID, 
       a.AppointmentDate
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID
JOIN Appointment a ON b.AppointmentID = a.AppointmentID
WHERE p.PatientID = 1;


--Lab Task 6:
SELECT p.Name AS PatientName, b.AppointmentID, a.DoctorID
FROM Patient p
JOIN Billing b ON p.PatientID = b.PatientID
JOIN Appointment a ON b.AppointmentID = a.AppointmentID
WHERE a.DoctorID = 3; 
--------------------------------------lab 7------------------------------------------------------------------------------
--Activity 1 Query: Find the Name and PatientID for a patient whose PatientID matches the doctor's ID 1.
SELECT Name, PatientID 
FROM Patient
WHERE PatientID = (SELECT PatientID FROM Staff WHERE StaffID = 1);

--Activity 2 Query: Retrieve DoctorID, AppointmentID, and PatientID where DoctorID matches DoctorID = 1.
SELECT DoctorID, AppointmentID, PatientID
FROM Appointment
WHERE DoctorID IN (SELECT DoctorID FROM Doctor WHERE Specialization = 'Cardiology');

--Activity 3 Query: Get the Name, PatientID, and DateOfBirth for the youngest patient. 
SELECT Name, PatientID, PatientID AS DateOfBirth
FROM Patient
WHERE PatientID = (SELECT MAX(PatientID) FROM Patient);

--Activity 4 Query: Find the PatientID and earliest visit dates older than a reference date.
SELECT PatientID, MIN(AppointmentDate) AS EarliestVisit
FROM Appointment
GROUP BY PatientID
HAVING MIN(AppointmentDate) > 
    (SELECT MIN(AppointmentDate) FROM Appointment WHERE PatientID = 8);
    
--Activity 5 Query: List AppointmentDate and earliest AppointmentID for patients from Islamabad.
SELECT AppointmentDate, MIN(AppointmentID) AS MinAppointmentID
FROM Appointment
WHERE PatientID IN 
    (SELECT PatientID FROM Patient WHERE Address LIKE '%Islamabad%')
GROUP BY AppointmentDate
HAVING MIN(AppointmentID) = 1;

--Activity 6 Query: Fetch patients sharing the same last name "Malik".
SELECT Name, PatientID 
FROM Patient 
WHERE Name LIKE '%Malik%';

--Activity 7 Query: Retrieve all appointments made before any appointment with a specific DoctorID.
SELECT AppointmentID, PatientID, AppointmentDate
FROM Appointment
WHERE AppointmentDate < ANY
    (SELECT AppointmentDate FROM Appointment WHERE DoctorID = 5)
AND DoctorID <> 5;

--Activity 8 Query: List appointments scheduled after all appointments of a specific patient.
SELECT AppointmentID, PatientID, AppointmentDate
FROM Appointment
WHERE AppointmentDate > ALL
    (SELECT AppointmentDate FROM Appointment WHERE PatientID = 1)
AND PatientID <> 1;

--Activity 9 Query: Check for appointments linked to doctors and patients existing in other tables.
SELECT AppointmentID, PatientID, DoctorID
FROM Appointment A
WHERE EXISTS 
    (SELECT 1 FROM Doctor D WHERE A.DoctorID = D.DoctorID);
    
--Activity 10 Query: Find all appointments that are not linked to any billing entry.
SELECT AppointmentID 
FROM Appointment 
WHERE AppointmentID NOT IN 
    (SELECT AppointmentID FROM Billing WHERE AppointmentID IS NOT NULL);
    
    -----lab Task
---- Lab Task 1:This query finds patients who are not PatientID = 176 and are involved in appointments:
SELECT P.PatientID, P.Email
FROM Patient P
WHERE P.PatientID IN (
    SELECT A.PatientID
    FROM Appointment A
    WHERE A.PatientID != 176
)
AND P.PatientID != 176;
--Lab Task 2:This query finds appointments with a TotalAmount greater than the average:
SELECT A.AppointmentID, B.TotalAmount
FROM Appointment A
JOIN Billing B ON A.AppointmentID = B.AppointmentID
WHERE B.TotalAmount > (
    SELECT AVG(Billing.TotalAmount)
    FROM Billing
)
ORDER BY B.TotalAmount ASC;
--Lab Task 3:This query finds appointments related to doctors who specialize in 'Cardiology':
SELECT A.AppointmentID, A.PatientID
FROM Appointment A
WHERE A.DoctorID IN (
    SELECT D.DoctorID
    FROM Doctor D
    WHERE D.Specialization = 'Cardiology'
);
---Lab Task 4:This query finds appointments for patients with bills higher than 7000:
SELECT A.AppointmentID, A.PatientID
FROM Appointment A
WHERE A.AppointmentID IN (
    SELECT B.AppointmentID
    FROM Billing B
    WHERE B.TotalAmount >= 1000
    GROUP BY B.AppointmentID
    HAVING COUNT(B.BillingID) > 0
);
--Lab Task 5:This query calculates the age of the patient (based on their date of birth) and retrieves those involved in appointments for a specific doctor specialization:
SELECT P.PatientID, P.Email, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, P.DateOfBirth) / 12) AS Age
FROM Patient P
WHERE P.PatientID IN (
    SELECT A.PatientID
    FROM Appointment A
    WHERE A.DoctorID IN (
        SELECT D.DoctorID
        FROM Doctor D
        WHERE D.Specialization = 'Cardiology'
    )
);
--Lab Task 6:This query finds the patient name and the total amount of their bill, joining the relevant tables:
SELECT P.Name AS PatientName, B.TotalAmount
FROM Patient P
JOIN Appointment A ON P.PatientID = A.PatientID
JOIN Billing B ON A.AppointmentID = B.AppointmentID
WHERE A.DoctorID IN (
    SELECT D.DoctorID
    FROM Doctor D
    WHERE D.Specialization = 'Cardiology'
);
--------------------------------------------lab 8-----------------------------------------------
---ACTIVITY 1 UNINON
SELECT BillingID AS ID, PaymentStatus AS Status
FROM Billing
UNION
SELECT PharmacyID AS ID, PrescriptionRequired AS Status
FROM Pharmacy;

---ACTIVITY 2--------- Using the UNION ALL Operator
SELECT BillingID AS RecordID, PaymentStatus AS Status, NULL AS ReferenceID
FROM Billing
UNION ALL
SELECT PharmacyID AS RecordID, PrescriptionRequired AS Status, StaffID AS ReferenceID
FROM Pharmacy
ORDER BY RecordID;

----Activity 3: Using the INTERSECT Operator
SELECT StaffID AS ID
FROM Staff
INTERSECT
SELECT StaffID AS ID
FROM Doctor;

---Activity 4: Using the MINUS Operator
SELECT PatientID AS ID
FROM Billing
INTERSECT
SELECT StaffID AS ID
FROM Pharmacy;

---------Activity 5: Matching the SELECT Statement
SELECT BillingID AS ID, PatientID AS "ID_Type", TotalAmount AS "Amount"
FROM Billing
UNION
SELECT PharmacyID AS ID, StaffID AS "ID_Type", 0 AS "Amount"
FROM Pharmacy;

-----Activity 6: Using the ORDER BY Clause in Set Operations
SELECT BillingID AS ID, PatientID AS "ID_Type", TotalAmount AS "Amount"
FROM Billing
UNION
SELECT PharmacyID AS ID, StaffID AS "ID_Type", 0 AS "Amount"
FROM Pharmacy
ORDER BY 2;
---------lab task -----------------
---- Lab Task 1
---Display the ID and name of staff 
SELECT StaffID, Name
FROM Staff
MINUS
SELECT StaffID, NULL AS Name
FROM Doctor;

---- Lab Task 2
---Display a list of PharmacyID for pharmacies that do not contain the medicine Paracetamol.
SELECT PharmacyID
FROM Pharmacy
MINUS
SELECT PharmacyID
FROM Pharmacy
WHERE MedicineName = 'Paracetamol';

----Lab Task 3
---Display the BillingID and PatientID of billings that belong to patients with IDs 1 and 2.
SELECT BillingID, PatientID
FROM Billing
WHERE PatientID IN (1, 2);

--- Lab Task 4
--Display the StaffID and Staffname of Staff who are not linked to any appointment
SELECT StaffID AS ID, Name
FROM Staff
MINUS
SELECT DoctorID AS ID, TO_CHAR(NULL) AS Name
FROM Appointment;


--- Lab Task 5
---Display the PharmacyID and MedicineName for pharmacies with IDs 1, 5, and 3, in that order.
SELECT PharmacyID, MedicineName
FROM Pharmacy
WHERE PharmacyID IN (1, 5, 3)
ORDER BY PharmacyID;
   
-- Lab Task 6
---Find all the billings that do not have a corresponding appointment.
SELECT BillingID, PatientID, TotalAmount
FROM Billing
MINUS
SELECT BillingID, PatientID, TotalAmount
FROM Billing
WHERE AppointmentID IS  NULL;
-----------------------lab 9--------------------------------------------------------------------
--Activity 1: Inserting New Rows
INSERT INTO patient_payment VALUES (25, 'Maria Saeed', 'RX909', 310,
TO_DATE('12-11-2024', 'DD-MM-YYYY'), 'Credit Card', '6666777788889999', 'Completed', 'Requested private room');

---Activity 2: Inserting Rows with Null Value
INSERT INTO patient_payment VALUES (27, null, 'RX909', 310, 
TO_DATE('12-11-2024', 'DD-MM-YYYY'), 'Credit Card', '6666777788889999', 'Completed', 'Requested private room');

---Activity 3: Inserting Special Values
INSERT INTO patient_payment(payment_id, payment_method, card_number, status, comments) 
VALUES (26, 'Credit Card', '6666777788889999', 'Completed', 'Requested private room');

---Activity 4: Inserting Specific Date and Time Values
INSERT INTO patient_payment 
VALUES (28,'Maria Saeed', 'RX909',310,  TO_DATE('12-11-2024', 'DD-MM-YYYY'),                             
        'Credit Card', '6666777788889999', 'Completed', 'Requested private room');

--Activity 5: Creating a Script
select* from  patient_payment;
INSERT INTO patient_payment(payment_id, payment_method, card_number, status, comments) 
VALUES (&payment_id, &payment_method, &card_number, &status, &comments);

---Activity 6: Copying Rows from Another Table---error
CREATE TABLE patient_payment2 (
    payment_id INT PRIMARY KEY,
    patient_name VARCHAR(20),
    treatment_code VARCHAR(20),
    amount INT,
    payment_date DATE,
    payment_method VARCHAR(20),
    card_number VARCHAR(16),
    status VARCHAR(20),
    comments VARCHAR(255)
);

INSERT INTO patient_payment2
SELECT * FROM patient_payment;
---Activity 7: Updating Rows in a Table
UPDATE patient_payment2 
SET status = 'Not Completed' 
WHERE payment_method = 'Credit Card';

---Activity 8: Updating Two Columns with a Subquery
UPDATE patient_payment2
SET (payment_id, amount) = (
    SELECT payment_id, amount 
    FROM patient_payment 
    WHERE payment_id = 25
)
WHERE payment_id = 25;

----Activity 9: Updating Rows Based on Another Table
UPDATE patient_payment2
SET amount = (
    SELECT amount
    FROM patient_payment
    WHERE payment_id = 5
)
WHERE amount = (
    SELECT amount
    FROM patient_payment
    WHERE payment_id = 8
);

---Activity 10: Deleting a Row from a Table
DELETE FROM patient_payment2
WHERE payment_id = 27;

----Activity 11: Deleting Rows Based on Another Table
DELETE FROM patient_payment2
WHERE payment_id IN (
    SELECT payment_id
    FROM patient_payment
    WHERE payment_method = 'Credit Card'
);

----Activity 12: Efficient Method of Emptying a Table
TRUNCATE TABLE patient_payment2;

---lab task----
CREATE TABLE hospital_feedback (
    feedback_id INT PRIMARY KEY,             -- Unique feedback identifier
    patient_id INT,                          -- ID of the patient providing feedback
    employee_id INT,                         -- ID of the employee (doctor, nurse) who provided care
    department_name VARCHAR(50),             -- Department where care was received (e.g., Cardiology, Orthopedics)
    feedback_date DATE,                      -- Date when feedback was given
    rating INT,                              -- Rating given by the patient (1 to 5)
    comments VARCHAR(255),                   -- Additional comments or feedback
    service_type VARCHAR(50)                 -- Type of service (e.g., "Outpatient", "Emergency")
);
INSERT INTO hospital_feedback (feedback_id, patient_id, employee_id, department_name, feedback_date, rating, comments, service_type)
VALUES (2, 102, 1002, 'Cardiology', TO_DATE('2024-12-21', 'YYYY-MM-DD'), 4, 'Good care, but could improve wait times.', 'Outpatient');
INSERT INTO hospital_feedback (feedback_id, patient_id, employee_id, department_name, feedback_date, rating, comments, service_type)
VALUES (4, 104, 1004, 'Surgery', TO_DATE('2024-12-19', 'YYYY-MM-DD'), 5, 'Outstanding care during surgery and recovery process.', 'Inpatient');
INSERT INTO hospital_feedback (feedback_id, patient_id, employee_id, department_name, feedback_date, rating, comments, service_type)
VALUES (5, 105, 1005, 'Pediatrics', TO_DATE('2024-12-18', 'YYYY-MM-DD'), 4, 'Good care for my child, but the waiting time was long.', 'Outpatient');


---Lab Task 1: Increase Rating for Feedback from Patients in Cardiology by 1 Point
UPDATE hospital_feedback
SET rating = rating + 1
WHERE department_name = 'Cardiology';

--Lab Task 2: Insert Feedback for Yourself as a Patient
--Assuming you want to insert feedback for yourself (as a patient) who was treated in a specific department by a particular employee:
INSERT INTO hospital_feedback (feedback_id, patient_id, employee_id, department_name, feedback_date, rating, comments, service_type)
VALUES (101, 101, 1001, 'Emergency', TO_DATE('2024-12-22', 'YYYY-MM-DD'), 5, 'Excellent care and timely response', 'Emergency');

---Lab Task 3: Insert Feedback for Network Operations Department Located in Africa
--In the context of a hospital, instead of "Network Operations," we might refer to a specific department like "Telemedicine." If the location is Africa, we would insert feedback for patients in that department.
INSERT INTO hospital_feedback (feedback_id, patient_id, employee_id, department_name, feedback_date, rating, comments, service_type)
VALUES (102, 102, 1002, 'Telemedicine', TO_DATE('2024-12-22', 'YYYY-MM-DD'), 4, 
'Good online consultation, needs improvement in response time', 'Outpatient');

--Lab Task 4: Update Feedback for the Surgery Department to "Excellent Service"
UPDATE hospital_feedback
SET comments = 'Excellent service and care during surgery.'
WHERE department_name = 'Surgery' 
AND feedback_date = TO_DATE('2024-12-22', 'YYYY-MM-DD');

---Lab Task 5: Delete All Feedback from Patients Treated by Dr. Steven King---error
--Assuming Dr. Steven King's employee_id is 1001, you can delete feedback for all patients who were treated by him:
DELETE FROM hospital_feedback
WHERE employee_id = 1001;

---Lab Task 6: Delete Your Feedback
--To delete the feedback you (as a patient with ID 101) have provided, use the following query:
DELETE FROM hospital_feedback
WHERE patient_id = 1;
select* from hospital_feedback;

----------------------------------------lab 10-------------
-----ACTIVITY 1,2,3,4-----
CREATE TABLE Docssss1 (
    DoctorID NUMBER (6)CONSTRAINT docs1_doctor_id_pk PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15),
    Salary NUMBER(8,2) CONSTRAINT doctor_salary_min CHECK (Salary > 10000),
    Qualification VARCHAR(50),
    Department VARCHAR(100),
    PatientID INT,
    FOREIGN KEY(PatientID) REFERENCES Patient(PatientID)
);
drop table Docssss1;
INSERT INTO Docssss1 VALUES (01, 'Dr. Abdullah Sheikh', 'Cardiologist', 03211234567,50000, 'MBBS', 'Cardiology',1);
INSERT INTO Docssss1 VALUES (02, 'Dr. Asma Javed', 'Dermatologist', 03021234568,60000, 'MBBS', 'Dermatology',2);
INSERT INTO Docssss1 VALUES (03, 'Dr. Kamran Abbas', 'Neurologist', 03451234569,70000, 'MBBS','Neurology',3);
INSERT INTO Docssss1 VALUES (04, 'Dr. Nadia Aziz', 'Pediatrician', 03121234570,80000, 'MBBS', 'Pediatrics',4);
INSERT INTO Docssss1 VALUES (05, 'Dr. Rizwan Ahmed', 'Orthopedic', 03041234571,90000, 'MBBS','Orthopedics',5);
Select * FROM Docssss1;

-----ACTIVITY 5----
CREATE TABLE DeptSpecialization AS
SELECT 
    DoctorID, 
    DoctorName, 
    Salary * 12 AS AnnualSalary, 
    Qualification
FROM Docs1
WHERE Department = 'Cardiology';

Select * from DeptSpecialization;
-----ACTIVITY 6----
ALTER TABLE DeptSpecialization
ADD (Specialization VARCHAR2(50));

-----ACTIVITY 7-----
ALTER TABLE DeptSpecialization
MODIFY (DoctorName VARCHAR2(50));

-----ACTIVITY 8-----
ALTER TABLE DeptSpecialization
DROP COLUMN Specialization;

----ACTIVITY 9----
DROP TABLE DeptSpecialization;

--------LAB TASKS--------
----Task 1:
CREATE TABLE Dept2 AS
SELECT 
    DoctorID, 
    Department AS DepartmentName
FROM Docs1;

-----Task 2:
CREATE TABLE Doctors5 AS
SELECT 
    DoctorID AS ID, 
    DoctorName AS FIRSTNAME, 
    Salary AS SALARY, 
    Department AS DEPT_ID
FROM Docs1;

-----Task 3:
-----Task 4:
ALTER TABLE Docs1
MODIFY (DoctorName VARCHAR2(50));

  
------------------------------------------------LAB 11-----------------------------------------------------------------------------------------------
CREATE TABLE ward_assistant_ (
    assistant_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender CHAR(1),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert sample data
INSERT INTO ward_assistant_ (assistant_id, first_name, last_name, email, gender, salary, department_id)VALUES(1, 'Javeria', 'Doe', 'john.doe@example.com', 'M', 15000, 101);
INSERT INTO ward_assistant_ (assistant_id, first_name, last_name, email, gender, salary, department_id)VALUES(2, 'Janil', 'Smith', 'jane.smith@example.com', 'F', 25000, 102);
INSERT INTO ward_assistant_ (assistant_id, first_name, last_name, email, gender, salary, department_id)VALUES(3, 'Alina', 'Brown', 'alice.brown@example.com', 'F', 18000, 103);
INSERT INTO ward_assistant_ (assistant_id, first_name, last_name, email, gender, salary, department_id)VALUES(4, 'Bilal', 'White', 'bob.white@example.com', 'M', 30000, 101);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender CHAR(1),
    salary DECIMAL(10, 2),
    department_id INT, -- Foreign key to departments table
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Activity 4: Creating Views
CREATE VIEW lowSalary AS
SELECT *
FROM ward_assistant_
WHERE salary < 20000;

CREATE VIEW allAssistants AS
SELECT first_name, last_name
FROM ward_assistant_;

CREATE VIEW lowSalAssistantList AS
SELECT first_name, last_name
FROM ward_assistant_
WHERE salary < 20000;

CREATE VIEW deptEmployee AS
SELECT departments.department_name, employees.first_name
FROM departments
INNER JOIN employees
ON departments.department_id = employees.department_id;

-- Activity 5: Using and Changing Views
SELECT first_name
FROM allAssistants;

CREATE OR REPLACE VIEW lowSalAssistantList AS
SELECT first_name, last_name
FROM ward_assistant_
WHERE salary < 30000;

-- Activity 6: Dropping Views
DROP VIEW allAssistants;

---------------------lab task---------------------------------
----Create a HospitalGuard table:
CREATE TABLE HospitalGuard (
    GuardID INT PRIMARY KEY,
    Name VARCHAR(50),
    Shift VARCHAR(20),
    AssignedArea VARCHAR(50)
);
---Insert sample data into HospitalGuard:
INSERT INTO HospitalGuard (GuardID, Name, Shift, AssignedArea)VALUES (1, 'Jamil', 'Morning', 'Ward A');
INSERT INTO HospitalGuard (GuardID, Name, Shift, AssignedArea)VALUES (2, 'sameer', 'Evening', 'Main Entrance');
INSERT INTO HospitalGuard (GuardID, Name, Shift, AssignedArea)VALUES(3, 'Mizmil', 'Night', 'ICU');
------------lab  task---------

---Create a view to extract all details of guards working the morning shift:

CREATE VIEW MorningShiftGuards AS
SELECT *
FROM HospitalGuard
WHERE Shift = 'Morning';
--Lab Task 3
---Modify the view created in Lab Task 2 to now extract all details of guards working the evening shift:

CREATE OR REPLACE VIEW MorningShiftGuards AS
SELECT *
FROM HospitalGuard
WHERE Shift = 'Evening';