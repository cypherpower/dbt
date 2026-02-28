-- This is a staging model that transforms raw employee data
-- The raw data is loaded from MySQL via the mysql-to-redshift Lambda function

select
    employee_id,
    employee_name,
    gender,
    department,
    salary,
    hire_date
from {{ source('raw', 'employees') }}
where employee_id is not null

