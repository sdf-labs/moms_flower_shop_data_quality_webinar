SELECT
    DISTINCT c.table_name AS "table_name",
    c.table_id AS "table_id",
    c.column_name AS "column_name"
FROM
    sdf.information_schema.columns c
WHERE
    CONTAINS_ARRAY_VARCHAR(c.classifiers, 'PII') 
    AND LOWER(c.schema_name) = 'analytics'