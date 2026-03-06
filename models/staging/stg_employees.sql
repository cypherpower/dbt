with source as (
  select * from {{ source('postgres__employees', 'employees') }}
),
renamed as (
  select
    id,
    first_name,
    last_name,
    gender,
    department,
    salary,
    hire_date
  from source
)
select * from renamed
