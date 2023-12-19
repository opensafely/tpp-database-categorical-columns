-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
WITH categorical_columns AS (
    -- patients
    SELECT DISTINCT
        'Patient' AS table_name,
        'Sex' AS column_name,
        Sex AS column_value
    FROM Patient
    UNION ALL

    -- ons_deaths
    SELECT DISTINCT
        'ONS_Deaths' AS table_name,
        'Place_of_occurrence' AS column_name,
        Place_of_occurrence AS column_value
    FROM ONS_Deaths
)

SELECT
    table_name,
    column_name,
    column_value
FROM categorical_columns
ORDER BY table_name, column_name, column_value
