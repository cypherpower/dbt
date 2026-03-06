with source as (
  select * from postgres_employees.employees
),
renamed as (
  select
    first_name,
    last_name,
    gender,
    hire_date,
    birth_date
  from source
)
select * from renamed
