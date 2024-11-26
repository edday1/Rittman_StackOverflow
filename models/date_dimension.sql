{{ config(materialized='table') }}

WITH base AS (
    SELECT
        day AS calendar_date,
        EXTRACT(YEAR FROM day) AS year,
        EXTRACT(QUARTER FROM day) AS quarter,
        EXTRACT(MONTH FROM day) AS month,
        EXTRACT(DAYOFWEEK FROM day) AS day_of_week
    FROM UNNEST(GENERATE_DATE_ARRAY('2008-01-01', '2024-12-31')) AS day
)

SELECT
    ROW_NUMBER() OVER (ORDER BY calendar_date) AS date_id,
    calendar_date,
    year,
    quarter,
    month,
    day_of_week
FROM base
