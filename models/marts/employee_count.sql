with base as (
  select * from {{ ref('stg_employees') }}
),
aggregated as (
  select
    gender,
    count(*) as employee_count
  from base
  group by gender
)
select * from aggregated
