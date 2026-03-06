with source as (
  select * from postgres_employees.employees
),
renamed as (
  select
    employee_id,
    first_name,
    last_name,
    department,
    hire_date,
    salary
  from source
)
select * from renamed
