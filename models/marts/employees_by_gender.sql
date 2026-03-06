with base as (
  select * from {{ ref('stg_employee') }}
),
final as (
  select
    1 as count,
    gender,
    last_name,
    first_name,
    hire_date,
    birth_date
  from base
)
select * from final
