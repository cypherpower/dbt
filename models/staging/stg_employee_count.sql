with source as (
  select * from {{ source('postgres__employees', 'employee_count') }}
),
renamed as (
  select
    gender,
    count
  from source
)
select * from renamed
