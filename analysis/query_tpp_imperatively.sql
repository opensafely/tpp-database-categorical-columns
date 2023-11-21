-- This query is for a data development project that doesn't include T1OO data.
-- Consequently, this query doesn't reference the PatientsWithTypeOneDissent table.
DECLARE @id AS INT
DECLARE @ehrql_table_name AS VARCHAR(MAX)
DECLARE @ehrql_column_name AS VARCHAR(MAX)
DECLARE @db_table_name AS VARCHAR(MAX)
DECLARE @db_column_name AS VARCHAR(MAX)

DECLARE
    @tmp TABLE (
        id INT,
        ehrql_table_name VARCHAR(MAX),
        ehrql_column_name VARCHAR(MAX),
        db_table_name VARCHAR(MAX),
        db_column_name VARCHAR(MAX)
    )

INSERT INTO @tmp VALUES (1, 'patients', 'sex', 'Patient', 'Sex')
INSERT INTO @tmp VALUES (1, 'ons_deaths', 'place', 'ONS_Deaths', 'Place_of_occurrence')

SELECT TOP 1
    @id = id,
    @ehrql_table_name = ehrql_table_name,
    @ehrql_column_name = ehrql_column_name,
    @db_table_name = db_table_name,
    @db_column_name = db_column_name
FROM @tmp

WHILE (@@rowcount > 0)
    BEGIN
        DECLARE @sql NVARCHAR(MAX)
        SET
            @sql
            = 'SELECT DISTINCT '''
            + @ehrql_table_name
            + ''' AS table_name, '''
            + @ehrql_column_name
            + ''' AS column_name, '
            + @db_column_name
            + ' AS column_value FROM '
            + @db_table_name
        EXECUTE sp_executesql @sql
        DELETE FROM @tmp WHERE id = @id
        SELECT TOP 1
            @id = id,
            @ehrql_table_name = ehrql_table_name,
            @ehrql_column_name = ehrql_column_name,
            @db_table_name = db_table_name,
            @db_column_name = db_column_name
        FROM @tmp
    END
