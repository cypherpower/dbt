with base as (
  select * from {{ ref('stg_employee_count') }}
)
select * from base
