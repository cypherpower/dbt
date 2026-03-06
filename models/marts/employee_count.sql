with base as (
  select * from {{ ref('stg_employees') }}
)
select
  gender,
  count(*) as employee_count
from base
group by gender
