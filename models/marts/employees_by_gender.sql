with base as (
  select * from {{ ref('stg_employee') }}
)
select
  gender,
  birth_date,
  first_name,
  last_name,
  hire_date,
  count(*) as count
from base
group by 
  gender,
  birth_date,
  first_name,
  last_name,
  hire_date
