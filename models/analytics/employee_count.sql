{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

SELECT
    id,
    employee_id,
    department,
    count_value,
    created_at,
    updated_at
FROM {{ source('postgres__employees', 'employee_count') }}
