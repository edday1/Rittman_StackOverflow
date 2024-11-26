
{{ config(materialized='table') }}

WITH base AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY id) AS user_sk,
        id AS user_id,
        display_name,
        reputation,
        location
    FROM {{ source('stackoverflow', 'users') }}
)

SELECT * FROM base

