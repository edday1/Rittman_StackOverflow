
{{ config(materialized='table') }}

WITH base AS (
    SELECT
        id AS question_id,
        title,
        creation_date,
        answer_count,
        comment_count,
        score,
        view_count,
        body,
        tags,
        owner_user_id AS user_sk
    FROM {{ source('stackoverflow', 'posts_questions') }}
    WHERE answer_count = 0
)

SELECT * FROM base

