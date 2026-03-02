{{ config(
    materialized='table',
    schema='analytics'
) }}

select
    count(id) as count,
    cast(id as integer) as emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
from {{ ref('stg_employee') }}
group by
    gender,
    id,
    birth_date,
    first_name,
    last_name,
    hire_date