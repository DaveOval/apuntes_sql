select now();


select CURRENT_DATE;

select CURRENT_TIME;

select TIMESTAMP;


select * from employees
where hire_date > '1998-02-05'
order by hire_date asc
;

select 
	max(hire_date) as mas_nuevo,
	min(hire_date) as primer_empleado
from employees;


SELECT 
	max(hire_date),
	max(hire_date) + INTERVAL '1 days' as days,
	max(hire_date) + INTERVAL '1 month' as months,
	max(hire_date) + INTERVAL '1 year' as years,
	max(hire_date) + INTERVAL '1.1 year' as years,
	
	date_part('year', now()),
	MAKE_INTERVAL( YEARS := 23 )
FROM employees;