-- Replicates the Informatica employee_count mapping
-- Counts employees by gender with a representative employee row

{{ config(
    alias='employee_count'
) }}

select
    count(*) over (partition by gender) as count,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
from {{ ref('stg_employees') }}
