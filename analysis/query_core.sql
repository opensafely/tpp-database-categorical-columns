-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
WITH categorical_columns AS (
    -- patients
    SELECT DISTINCT
        'Patient' AS table_name,
        'Sex' AS column_name,
        Sex AS category_code
    FROM Patient
    UNION ALL

    -- ons_deaths
    SELECT DISTINCT
        'ONS_Deaths' AS table_name,
        'Place_of_occurrence' AS column_name,
        Place_of_occurrence AS category_code
    FROM ONS_Deaths
),

data_dictionary AS (
    SELECT
        [Table] AS table_name,
        Type AS column_name,
        Code AS category_code,
        Description AS category_name
    FROM DataDictionary
)

SELECT
    cc.table_name,
    cc.column_name,
    cc.category_code,
    dd.category_name
FROM categorical_columns AS cc
LEFT OUTER JOIN
    data_dictionary AS dd
    ON
        cc.table_name = dd.table_name
        AND cc.column_name = dd.column_name
        AND cc.category_code = dd.category_code
ORDER BY cc.table_name, cc.column_name, cc.category_code
