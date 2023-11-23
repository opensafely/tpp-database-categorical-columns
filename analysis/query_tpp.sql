-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
WITH categorical_columns AS (
    -- addresses
    SELECT DISTINCT
        'addresses' AS table_name,
        'address_type' AS column_name,
        CAST(AddressType AS VARCHAR(MAX)) AS column_value
    FROM PatientAddress
    UNION ALL
    SELECT DISTINCT
        'addresses' AS table_name,
        'rural_urban_classification' AS column_name,
        CAST(RuralUrbanClassificationCode AS VARCHAR(MAX)) AS column_value
    FROM PatientAddress
    UNION ALL

    -- appointments
    SELECT DISTINCT
        'appointments' AS table_name,
        'status' AS column_name,
        CAST(Status AS VARCHAR(MAX)) AS column_value
    FROM Appointment
    UNION ALL

    -- ec
    SELECT DISTINCT
        'ec' AS table_name,
        'sus_hrg_code' AS column_name,
        SUS_HRG_Code AS column_value
    FROM EC
    UNION ALL

    -- hospital_admissions
    SELECT DISTINCT
        'hospital_admissions' AS table_name,
        'admission_method' AS column_name,
        Admission_Method AS column_value
    FROM APCS
    UNION ALL
    SELECT DISTINCT
        'hospital_admissions' AS table_name,
        'patient_classification' AS column_name,
        Patient_Classification AS column_value
    FROM APCS
    UNION ALL

    -- opa
    SELECT DISTINCT
        'opa' AS table_name,
        'attendance_status' AS column_name,
        Attendance_Status AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'opa' AS table_name,
        'consultation_medium_used' AS column_name,
        Consultation_Medium_Used AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'opa' AS table_name,
        'first_attendance' AS column_name,
        First_Attendance AS column_value
    FROM OPA
    UNION ALL
    SELECT DISTINCT
        'opa' AS table_name,
        'hrg_code' AS column_name,
        HRG_Code AS column_value
    FROM OPA
    UNION ALL

    -- practice_registrations
    SELECT DISTINCT
        'practice_registrations' AS table_name,
        'practice_stp' AS column_name,
        STPCode AS column_value
    FROM Organisation
    UNION ALL
    SELECT DISTINCT
        'practice_registrations' AS table_name,
        'practice_nuts1_region_name' AS column_name,
        Region AS column_value
    FROM Organisation
    UNION ALL

    -- sgss_covid_all_tests
    SELECT
        'sgss_covid_all_tests' AS table_name,
        'sgtf_status' AS column_name,
        SGTF AS column_value
    FROM SGSS_AllTests_Positive -- No SGSS_AllTests_Negative equivalent
    UNION ALL
    SELECT
        'sgss_covid_all_tests' AS table_name,
        'variant_detection_method' AS column_name,
        VariantDetectionMethod AS column_value
    FROM SGSS_AllTests_Positive -- No SGSS_AllTests_Negative equivalent
    UNION ALL

    -- vaccinations
    SELECT
        'vaccinations' AS table_name,
        'target_disease' AS column_name,
        VaccinationContent AS column_value
    FROM VaccinationReference
    UNION ALL

    -- wl_clockstops
    SELECT
        'wl_clockstops' AS table_name,
        'priority_type_code' AS column_name,
        PRIORITY_TYPE_CODE AS column_value
    FROM WL_ClockStops
    UNION ALL
    SELECT
        'wl_clockstops' AS table_name,
        'waiting_list_type' AS column_name,
        Waiting_List_Type AS column_value
    FROM WL_ClockStops
    UNION ALL

    -- wl_openpathways
    SELECT
        'wl_openpathways' AS table_name,
        'priority_type_code' AS column_name,
        PRIORITY_TYPE_CODE AS column_value
    FROM WL_OpenPathways
    UNION ALL
    SELECT
        'wl_openpathways' AS table_name,
        'waiting_list_type' AS column_name,
        Waiting_List_Type AS column_value
    FROM WL_OpenPathways
)

SELECT
    table_name,
    column_name,
    column_value
FROM categorical_columns
ORDER BY table_name, column_name, column_value
