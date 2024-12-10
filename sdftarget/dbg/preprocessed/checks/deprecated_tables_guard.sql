WITH
deprecated_tables AS (
    SELECT
        table_id
    FROM sdf.information_schema.tables 
    WHERE 
        CONTAINS(classifiers, 'TABLE_STATUS.deprecated')
),
downstream_deprecated_tables AS (
    SELECT 
        to_table_id AS table_id, 
        from_table_id AS upstream_deprecated_table_id
    FROM sdf.information_schema.table_lineage
    WHERE from_table_id IN (SELECT table_id FROM deprecated_tables)
        AND to_table_id IS NOT NULL
)

SELECT * FROM downstream_deprecated_tables
WHERE (SELECT COUNT(*) FROM downstream_deprecated_tables) > 1