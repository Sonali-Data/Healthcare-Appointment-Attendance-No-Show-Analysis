CREATE TABLE HEALTHCARE_ANALYSIS (
    PatientId BIGINT,
    AppointmentID BIGINT PRIMARY KEY,
    Gender VARCHAR(10),
    ScheduledDay DATETIME,
    AppointmentDay DATETIME,
    Age INT,
    Scholarship BOOLEAN,
    Hipertension BOOLEAN,
    Diabetes BOOLEAN,
    Alcoholism BOOLEAN,
    Handcap BOOLEAN,
    SMS_received BOOLEAN,
    Showed_up BOOLEAN,
    Date_diff INT
);
LOAD DATA LOCAL INFILE 'C:/Users/Hp/Downloads/HEALTHCARE_ANALYSIS.csv'
INTO TABLE HEALTHCARE_ANALYSIS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PatientId, AppointmentID, Gender, ScheduledDay, AppointmentDay,
 Age, Scholarship, Hipertension, Diabetes, Alcoholism,
 Handcap, SMS_received, Showed_up, Date_diff);
 USE healthcare;

DESCRIBE HEALTHCARE_ANALYSIS;
SELECT COUNT(*) AS Total_Rows
FROM HEALTHCARE_ANALYSIS;
SELECT COUNT(*) AS Total_Appointments
FROM HEALTHCARE_ANALYSIS;
SELECT
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY Showed_up;
SELECT
    Showed_up,
    COUNT(*) AS Appointment_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM HEALTHCARE_ANALYSIS),
        2
    ) AS Percentage
FROM HEALTHCARE_ANALYSIS
GROUP BY Showed_up;
SELECT
    Gender,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY Gender, Showed_up
ORDER BY Gender, Showed_up;
SELECT
    SMS_received,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY SMS_received, Showed_up
ORDER BY SMS_received, Showed_up;
SELECT
    CASE
        WHEN Age <= 18 THEN '0-18'
        WHEN Age <= 35 THEN '19-35'
        WHEN Age <= 50 THEN '36-50'
        WHEN Age <= 65 THEN '51-65'
        ELSE '65+'
    END AS Age_Group,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY
    CASE
        WHEN Age <= 18 THEN '0-18'
        WHEN Age <= 35 THEN '19-35'
        WHEN Age <= 50 THEN '36-50'
        WHEN Age <= 65 THEN '51-65'
        ELSE '65+'
    END,
    Showed_up
ORDER BY Age_Group, Showed_up;
SELECT
    Showed_up,
    ROUND(AVG('Date.diff'), 2) AS Avg_Appointment_Gap
FROM HEALTHCARE_ANALYSIS
GROUP BY Showed_up;
SELECT
    Scholarship,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY Scholarship, Showed_up
ORDER BY Scholarship, Showed_up;
SELECT
    Hipertension,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY Hipertension, Showed_up
ORDER BY Hipertension, Showed_up;
SELECT
    DATE_FORMAT(AppointmentDay, '%Y-%m') AS Appointment_Month,
    Showed_up,
    COUNT(*) AS Appointment_Count
FROM HEALTHCARE_ANALYSIS
GROUP BY
    DATE_FORMAT(AppointmentDay, '%Y-%m'),
    Showed_up
ORDER BY Appointment_Month, Showed_up;
