-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
WITH categorical_columns AS (
    SELECT DISTINCT
        'practice_stp' AS column_name,
        STPCode AS column_value
    FROM Organisation
    UNION ALL
    SELECT DISTINCT
        'practice_nuts1_region_name' AS column_name,
        Region AS column_value
    FROM Organisation
)

SELECT
    column_name,
    column_value
FROM categorical_columns
ORDER BY column_name, column_value
