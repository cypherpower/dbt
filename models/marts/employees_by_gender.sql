with base as (
  select * from {{ ref('stg_employee') }}
)
select
  gender,
  count(*) as employee_count
from base
group by gender
