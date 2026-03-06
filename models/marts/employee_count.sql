with base as (
  select * from {{ ref('stg_employee_count') }}
)
select 
  gender,
  count
from base
