{{ config(
    materialized='table',
    schema='analytics'
) }}

SELECT
    employee_id,
    first_name,
    last_name,
    email,
    department,
    hire_date,
    salary,
    manager_id,
    job_title,
    status,
    created_at,
    updated_at
FROM {{ source('postgres__employees', 'employees') }}