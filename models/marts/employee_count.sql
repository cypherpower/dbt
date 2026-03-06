with base as (
  select * from {{ ref('stg_employees') }}
),
aggregated as (
  select
    department,
    count(*) as employee_count,
    avg(salary) as avg_salary
  from base
  group by department
)
select * from aggregated
