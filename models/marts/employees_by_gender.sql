-- Replicates the Informatica employee_count mapping
-- Counts employees grouped by gender

{{ config(
    alias='employee_count'
) }}

select
    count(id) as count,
    gender
from {{ ref('stg_employees') }}
group by gender