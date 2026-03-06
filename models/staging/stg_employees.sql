with source as (
  select * from {{ source('postgres__employees', 'employees') }}
),
renamed as (
  select
    id,
    first_name,
    last_name,
    email,
    gender,
    department,
    hire_date,
    salary
  from source
)
select * from renamed
