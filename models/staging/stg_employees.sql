with source as (
  select * from postgres__employees.employees
),
renamed as (
  select * from source
)
select * from renamed
