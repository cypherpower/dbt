select
  gender,
  count(*) as employee_count
from postgres_employees.employee
group by gender
