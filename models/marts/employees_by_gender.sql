with base as (
  select * from {{ ref('stg_employee') }}
)
select
  gender,
  first_name,
  last_name,
  birth_date,
  hire_date,
  count
from base
