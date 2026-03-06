with source as (
  select * from postgres_employees.employee
),
renamed as (
  select
    id as employee_id,
    first_name,
    last_name,
    gender,
    hire_date,
    department
  from source
)
select * from renamed
