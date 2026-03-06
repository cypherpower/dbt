with base as (
  select * from {{ ref('stg_employees') }}
)
select
  count(*) as employee_count
from base
