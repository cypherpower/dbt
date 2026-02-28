-- This model aggregates employees data by gender
-- It calculates count, average salary, and other metrics grouped by gender

select
    gender,
    count(*) as employee_count,
    round(avg(salary), 2) as avg_salary,
    min(salary) as min_salary,
    max(salary) as max_salary,
    round(sum(salary), 2) as total_salary,
    count(distinct department) as distinct_departments,
    min(hire_date) as earliest_hire_date,
    max(hire_date) as latest_hire_date
from {{ ref('stg_employees') }}
group by gender
order by employee_count desc
