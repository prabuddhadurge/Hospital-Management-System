USE healthcare_db;

-- PATIENTS TABLE --
INSERT INTO PATIENT (Patient_ID, Name, Age, Gender, BloodType)
SELECT 
    Patient_ID,
    Name,
    Age,
    Gender,
    Blood_Type
FROM staging_table;


-- CONDITIONS TABLE --
INSERT INTO CONDITIONS(Condition_Name)
SELECT DISTINCT(Medical_Condition)
FROM staging_table;


-- HOSPITAL TABLE --
INSERT INTO HOSPITAL (Name)
SELECT DISTINCT(Hospital) AS Name
FROM staging_table;


-- DOCTORS TABLE --
INSERT INTO DOCTOR (Name)
SELECT DISTINCT(s.Doctor) AS Name
FROM staging_table s;


-- INSURANCE PROVIDER 
INSERT INTO INSURANCE_PROVIDER (Name)
SELECT DISTINCT(Insurance_Provider)
FROM staging_table;


-- ADMISSION DATA
INSERT INTO ADMISSION (
    Admission_ID, Patient_ID, Doctor_ID, Hospital_ID, Room_No, 
    Date_of_Admission, Date_of_Discharge, Admission_Type
)
SELECT 
    s.Admission_ID,
    s.Patient_ID,
    d.Doctor_ID,
    h.Hospital_ID,
    s.Room_Number,
    s.Date_of_Admission,
    s.Discharge_Date,
    s.Admission_Type
FROM staging_table s
JOIN DOCTOR d ON d.Name = s.Doctor
JOIN HOSPITAL h ON h.Name = s.Hospital;


-- BILLING DATA
INSERT INTO BILLING (Admission_ID, Provider_ID, Patient_ID, Room_No, Amount, Billing_Date)
SELECT 
    s.Admission_ID,
    ip.Insurance_ID AS Provider_ID,
    s.Patient_ID,
    s.Room_Number,
    s.Billing_Amount AS Amount,
    s.Discharge_Date AS Billing_Date
FROM staging_table s
JOIN INSURANCE_PROVIDER ip ON s.Insurance_Provider = ip.Name;