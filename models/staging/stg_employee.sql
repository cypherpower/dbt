with source as (
  select * from postgres_employees.employee
),
renamed as (
  select
    employee_id,
    first_name,
    last_name,
    gender,
    hire_date,
    department
  from source
)
select * from renamed
