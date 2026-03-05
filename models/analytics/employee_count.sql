{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

-- Employee count model migrated from postgres__employees schema
SELECT
  *
FROM {{ source('postgres__employees', 'employee_count') }}
