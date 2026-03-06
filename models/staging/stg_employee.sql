with source as (
  select * from postgres_employees.employee
),
renamed as (
  select
    *
  from source
)
select * from renamed
