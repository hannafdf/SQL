select * from salary 

insert into salary (id, monthly_salary)
values (default, 2600)

select * from employees 

select * from employee_salary 

select * from roles 

select * from roles_employee  


--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select e.employee_name, s.monthly_salary 
from employees e
join employee_salary es on e.id = es.employee_id 
inner join salary s on es.salary_id = s.id

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select e.employee_name, s.monthly_salary 
from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on s.id = es.salary_id
where s.monthly_salary <2000


--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select salary_id, monthly_salary  
from employees 
right join employee_salary on employees.id = employee_salary.employee_id 
right join salary on employee_salary.salary_id = salary.id 
where employee_name is null;
 

--4.������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select salary_id, monthly_salary  
from employees 
right join employee_salary on employees.id = employee_salary.employee_id 
right join salary on employee_salary.salary_id = salary.id 
where employee_name is null
and salary.monthly_salary < 2000


--5.����� ���� ���������� ���� �� ��������� ��. 
select employee_name, monthly_salary
from employees 
left join employee_salary es on employee_id = employees.id 
left join salary on salary_id = salary.monthly_salary 
where monthly_salary is null

--6.������� ���� ���������� � ���������� �� ���������.
select employee_name, r.role_name 
from employees e 
full outer join roles_employee on roles_employee.employee_id = e.id
full outer join roles r on roles_employee.roles_id = r.id


--7. ������� ����� � ��������� ������ Java �������������.
select employee_name, r.role_name 
from employees e 
join roles_employee on employee_id = e.id
join roles r on roles_employee.roles_id =r.id
where role_name like '%Java developer%'

-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name 
from employees e 
inner join roles_employee on roles_employee.employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Python developer%'


---9. ������� ����� � ��������� ���� QA ���������.
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%QA engineer%'

--10 ������� ����� � ��������� ������ QA ���������.
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Manual QA engineer%'

--11. ������� ����� � ��������� ��������������� QA
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Automation QA%'

--12. ������� ����� � �������� Junior ������������
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%'


-- 13. ������� ����� � �������� Middle ������������
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Middle%'


-- 14. ������� ����� � �������� Senior ������������
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Senior%'

-- 15. ������� �������� Java �������������
select  e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Java developer%'

-- 16. ������� �������� Python �������������
select  e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Python developer%'


-- 17. ������� ����� � �������� Junior Python �������������
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior Python developer%'

-- 18. ������� ����� � �������� Middle JS �������������
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
left join employees e on re.employee_id = e.id 
left join employee_salary es on e.id = es.employee_id 
Left join salary s on es.salary_id = s.id 
where r.role_name like '%Middle JavaScript%'


-- 19. ������� ����� � �������� Senior Java �������������
select  employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
left join employees e on re.employee_id = e.id 
left join employee_salary es on e.id = es.employee_id 
left join salary s on es.salary_id = s.id 
where r.role_name like '%Senior Java%'


-- 20. ������� �������� Junior QA ���������
--����� ��������� �� ���������. 
select employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
right join employees e on re.employee_id = e.id 
right join employee_salary es on e.id = es.employee_id 
right join salary s on es.salary_id = s.id 
where r.role_name like '%Junior QA%'


-- 21. ������� ������� �������� ���� Junior ������������
select avg(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%'

-- 22. ������� ����� ������� JS �������������
--����� �������� �����������.  
select sum(s.monthly_salary) 
from roles r join roles_employee re on r.id = re.roles_id 
right join employees e on re.employee_id = e.id 
right join employee_salary es on e.id = es.employee_id 
right join salary s on es.salary_id = s.id 
where role_name like '%JavaScript developer%'



-- 23. ������� ����������� �� QA ���������
select min(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%QA engineer%'

-- 24. ������� ������������ �� QA ���������
select max(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%QA engineer%'

-- 25. ������� ���������� QA ���������
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%QA engineer%'

-- 26. ������� ���������� Middle ������������.
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%Middle%'

-- 27. ������� ���������� �������������
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%developer%'


-- 28. ������� ���� (�����) �������� �������������.
select sum(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%developer%'

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
order by s.monthly_salary 

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary between 1700 and 2300
order by s.monthly_salary 


-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary < 2300
order by s.monthly_salary 


-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary 

