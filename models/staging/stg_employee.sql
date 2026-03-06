with source as (
  select * from postgres_employees.employees
),
renamed as (
  select
    employee_id,
    first_name,
    last_name,
    gender,
    hire_date,
    birth_date,
    department_id
  from source
)
select * from renamed
