with base as (
  select * from {{ ref('stg_employees') }}
)
select
  gender,
  count(*) as count
from base
group by gender
