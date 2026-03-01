with source as (
    select
        id,
        birth_date,
        first_name,
        last_name,
        gender,
        hire_date
    from {{ source('employees', 'employee') }}
)

select
    id,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
from source