CREATE DATABASE healthcare_db;
USE healthcare_db;
SET GLOBAL local_infile = 1;
SET SQL_SAFE_UPDATES = 1;

-- ### MASTER DATA IMPORT ### --
CREATE TABLE staging_table (
	Admission_ID INT,
    Patient_ID VARCHAR(255),
    Name VARCHAR(255),
    Age INT,
    Gender VARCHAR(10),
    Blood_Type VARCHAR(5),
    Medical_Condition VARCHAR(255),
    Date_of_Admission DATE,
    Doctor VARCHAR(255),
    Hospital VARCHAR(255),
    Insurance_Provider VARCHAR(255),
    Billing_Amount DECIMAL(10,2),
    Room_Number INT,
    Admission_Type VARCHAR(50),
    Discharge_Date DATE,
    Medication VARCHAR(255),
    Test_Results VARCHAR(255)
);

-- ### 
-- Above step is optional
-- DATA WAS IMPORTED BY: RIGHT CLICKING ON THE TABLE NAME -->> TABLE DATA IMPORT WIZARD -->> SELECT PATH FILE -->> SET TABLE NAME -->> CHECK FIELDS -->> IMPORT




