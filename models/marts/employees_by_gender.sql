with source_data as (
    select
        id,
        birth_date,
        first_name,
        last_name,
        gender,
        hire_date
    from {{ ref('stg_employee') }}
),

aggregated as (
    select
        count(id) as count,
        cast(id as integer) as emp_no,
        birth_date,
        first_name,
        last_name,
        gender,
        hire_date
    from source_data
    group by
        gender,
        id,
        birth_date,
        first_name,
        last_name,
        hire_date
)

select
    count,
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
from aggregated