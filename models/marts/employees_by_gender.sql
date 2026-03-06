select
  gender,
  first_name,
  last_name,
  birth_date,
  hire_date,
  1 as count
from {{ ref('stg_employee') }}
