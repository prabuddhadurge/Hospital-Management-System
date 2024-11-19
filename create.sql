USE healthcare_db;

CREATE TABLE PATIENT (
    Patient_ID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Gender VARCHAR(10),
    BloodType VARCHAR(5)
);

CREATE TABLE CONDITIONS (
    Condition_ID INT AUTO_INCREMENT PRIMARY KEY,
    Condition_Name VARCHAR(255)
);

CREATE TABLE HOSPITAL (
    Hospital_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE DOCTOR (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE INSURANCE_PROVIDER (
    Insurance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE ADMISSION (
    Admission_ID INT PRIMARY KEY,
    Patient_ID VARCHAR(50) NOT NULL,
    Doctor_ID INT NOT NULL,
    Hospital_ID INT NOT NULL,
    Room_No VARCHAR(20),
    Date_of_Admission DATE NOT NULL,
    Date_of_Discharge DATE,
    Admission_Type VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Doctor_ID),
    FOREIGN KEY (Hospital_ID) REFERENCES HOSPITAL(Hospital_ID)
);

CREATE TABLE BILLING (
    Billing_ID INT AUTO_INCREMENT PRIMARY KEY,
    Admission_ID INT NOT NULL,
    Provider_ID INT NOT NULL,
    Patient_ID VARCHAR(50) NOT NULL,
    Room_No VARCHAR(20) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Billing_Date DATE NOT NULL,
    FOREIGN KEY (Admission_ID) REFERENCES ADMISSION(Admission_ID),
    FOREIGN KEY (Provider_ID) REFERENCES INSURANCE_PROVIDER(Insurance_ID),
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID)
);