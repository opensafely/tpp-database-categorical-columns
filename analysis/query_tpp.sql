-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
WITH categorical_columns AS (
    -- addresses
    SELECT DISTINCT
        'PatientAddress' AS table_name,
        'AddressType' AS column_name,
        CAST(AddressType AS VARCHAR(MAX)) AS column_value
    FROM PatientAddress
    UNION ALL
    SELECT DISTINCT
        'PatientAddress' AS table_name,
        'RuralUrbanClassificationCode' AS column_name,
        CAST(RuralUrbanClassificationCode AS VARCHAR(MAX)) AS column_value
    FROM PatientAddress
    UNION ALL

    -- appointments
    SELECT DISTINCT
        'Appointment' AS table_name,
        'Status' AS column_name,
        CAST(Status AS VARCHAR(MAX)) AS column_value
    FROM Appointment
    UNION ALL

    -- ec
    SELECT DISTINCT
        'EC' AS table_name,
        'SUS_HRG_Code' AS column_name,
        SUS_HRG_Code AS column_value
    FROM EC
    UNION ALL

    -- hospital_admissions
    SELECT DISTINCT
        'APCS' AS table_name,
        'Admission_Method' AS column_name,
        Admission_Method AS column_value
    FROM APCS
    UNION ALL
    SELECT DISTINCT
        'APCS' AS table_name,
        'Patient_Classification' AS column_name,
        Patient_Classification AS column_value
    FROM APCS
    UNION ALL

    -- opa
    SELECT DISTINCT
        'OPA' AS table_name,
        'Attendance_Status' AS column_name,
        Attendance_Status AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'OPA' AS table_name,
        'Consultation_Medium_Used' AS column_name,
        Consultation_Medium_Used AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'OPA' AS table_name,
        'First_Attendance' AS column_name,
        First_Attendance AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'OPA' AS table_name,
        'HRG_Code' AS column_name,
        HRG_Code AS column_value
    FROM OPA
    UNION ALL

    -- practice_registrations
    SELECT DISTINCT
        'Organisation' AS table_name,
        'STPCode' AS column_name,
        STPCode AS column_value
    FROM Organisation
    UNION ALL
    SELECT DISTINCT
        'Organisation' AS table_name,
        'Region' AS column_name,
        Region AS column_value
    FROM Organisation
    UNION ALL

    -- sgss_covid_all_tests
    SELECT DISTINCT
        'SGSS_AllTests_Positive' AS table_name,
        'SGTF' AS column_name,
        SGTF AS column_value
    FROM SGSS_AllTests_Positive -- No SGSS_AllTests_Negative equivalent
    UNION ALL
    SELECT DISTINCT
        'SGSS_AllTests_Positive' AS table_name,
        'VariantDetectionMethod' AS column_name,
        VariantDetectionMethod AS column_value
    FROM SGSS_AllTests_Positive -- No SGSS_AllTests_Negative equivalent
    UNION ALL

    -- vaccinations
    SELECT DISTINCT
        'VaccinationReference' AS table_name,
        'VaccinationContent' AS column_name,
        VaccinationContent AS column_value
    FROM VaccinationReference
    UNION ALL

    -- wl_clockstops
    SELECT DISTINCT
        'WL_ClockStops' AS table_name,
        'PRIORITY_TYPE_CODE' AS column_name,
        PRIORITY_TYPE_CODE AS column_value
    FROM WL_ClockStops
    UNION ALL
    SELECT DISTINCT
        'WL_ClockStops' AS table_name,
        'Waiting_List_Type' AS column_name,
        Waiting_List_Type AS column_value
    FROM WL_ClockStops
    UNION ALL

    -- wl_openpathways
    SELECT DISTINCT
        'WL_OpenPathways' AS table_name,
        'PRIORITY_TYPE_CODE' AS column_name,
        PRIORITY_TYPE_CODE AS column_value
    FROM WL_OpenPathways
    UNION ALL
    SELECT DISTINCT
        'WL_OpenPathways' AS table_name,
        'Waiting_List_Type' AS column_name,
        Waiting_List_Type AS column_value
    FROM WL_OpenPathways
)

SELECT
    table_name,
    column_name,
    column_value
FROM categorical_columns
ORDER BY table_name, column_name, column_value
