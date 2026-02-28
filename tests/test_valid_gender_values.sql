-- Test to ensure gender values are valid
select *
from {{ ref('employees_by_gender') }}
where gender is null
  or gender not in ('M', 'F', 'Other', 'Male', 'Female')
