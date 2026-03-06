select
  gender,
  count(*) as employee_count
from {{ ref('stg_employee') }}
group by gender
