
{{ config(materialized='table') }}

WITH base AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY tag_name) AS tag_id,
        tag_name
    FROM {{ source('stackoverflow', 'tags') }}
)

SELECT * FROM base

