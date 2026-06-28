CREATE DATABASE Prescription_System;

USE Prescription_System;

CREATE TABLE patients(
UR_Num INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20),
[Address] VARCHAR(20), 
Email VARCHAR(20),
Phone VARCHAR(20),
Age INT,
Medicar_Card_Num INT,
Doctor_ID INT REFERENCES doctor(ID)
);
CREATE TABLE doctor(
ID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20),
Phone VARCHAR(20),
Email VARCHAR(20),
Specialty VARCHAR(20),
Years_Of_Experience INT
);

CREATE TABLE drug(
ID INT IDENTITY PRIMARY KEY,
Trade_Name VARCHAR(20),
Drug_Strength VARCHAR(20),
Company_Name VARCHAR(20) REFERENCES pharmaceutical_company(Company_Name)
);
CREATE TABLE pharmaceutical_company(
Company_Name VARCHAR(20) PRIMARY KEY, 
Phone_Number VARCHAR(20),
[Address] VARCHAR(20)

);

CREATE TABLE Prescription(
Doctor_ID INT REFERENCES doctor (ID),
Drug_ID INT REFERENCES drug (ID),
UR_Num INT REFERENCES patients (UR_Num),
[Date] DATE,
Quantity INT
);

