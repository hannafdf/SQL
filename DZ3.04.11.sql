select * from salary 

insert into salary (id, monthly_salary)
values (default, 2600)

select * from employees 

select * from employee_salary 

select * from roles 

select * from roles_employee  


--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary 
from employees e
join employee_salary es on e.id = es.employee_id 
inner join salary s on es.salary_id = s.id

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary 
from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on s.id = es.salary_id
where s.monthly_salary <2000


--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary_id, monthly_salary  
from employees 
right join employee_salary on employees.id = employee_salary.employee_id 
right join salary on employee_salary.salary_id = salary.id 
where employee_name is null;
 

--4.Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary_id, monthly_salary  
from employees 
right join employee_salary on employees.id = employee_salary.employee_id 
right join salary on employee_salary.salary_id = salary.id 
where employee_name is null
and salary.monthly_salary < 2000


--5.Найти всех работников кому не начислена ЗП. 
select employee_name, monthly_salary
from employees 
left join employee_salary es on employee_id = employees.id 
left join salary on salary_id = salary.monthly_salary 
where monthly_salary is null

--6.Вывести всех работников с названиями их должности.
select employee_name, r.role_name 
from employees e 
full outer join roles_employee on roles_employee.employee_id = e.id
full outer join roles r on roles_employee.roles_id = r.id


--7. Вывести имена и должность только Java разработчиков.
select employee_name, r.role_name 
from employees e 
join roles_employee on employee_id = e.id
join roles r on roles_employee.roles_id =r.id
where role_name like '%Java developer%'

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name 
from employees e 
inner join roles_employee on roles_employee.employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Python developer%'


---9. Вывести имена и должность всех QA инженеров.
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%QA engineer%'

--10 Вывести имена и должность ручных QA инженеров.
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Manual QA engineer%'

--11. Вывести имена и должность автоматизаторов QA
select employee_name, r.role_name 
from employees e 
inner join roles_employee on employee_id = e.id
inner join roles r on roles_employee.roles_id =r.id
where role_name like '%Automation QA%'

--12. Вывести имена и зарплаты Junior специалистов
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%'


-- 13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Middle%'


-- 14. Вывести имена и зарплаты Senior специалистов
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Senior%'

-- 15. Вывести зарплаты Java разработчиков
select  e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Java developer%'

-- 16. Вывести зарплаты Python разработчиков
select  e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Python developer%'


-- 17. Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior Python developer%'

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
left join employees e on re.employee_id = e.id 
left join employee_salary es on e.id = es.employee_id 
Left join salary s on es.salary_id = s.id 
where r.role_name like '%Middle JavaScript%'


-- 19. Вывести имена и зарплаты Senior Java разработчиков
select  employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
left join employees e on re.employee_id = e.id 
left join employee_salary es on e.id = es.employee_id 
left join salary s on es.salary_id = s.id 
where r.role_name like '%Senior Java%'


-- 20. Вывести зарплаты Junior QA инженеров
--такая должность не назначена. 
select employee_name, s.monthly_salary
from roles r join roles_employee re on r.id = re.roles_id 
right join employees e on re.employee_id = e.id 
right join employee_salary es on e.id = es.employee_id 
right join salary s on es.salary_id = s.id 
where r.role_name like '%Junior QA%'


-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%'

-- 22. Вывести сумму зарплат JS разработчиков
--здесь наверное неправильно.  
select sum(s.monthly_salary) 
from roles r join roles_employee re on r.id = re.roles_id 
right join employees e on re.employee_id = e.id 
right join employee_salary es on e.id = es.employee_id 
right join salary s on es.salary_id = s.id 
where role_name like '%JavaScript developer%'



-- 23. Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%QA engineer%'

-- 24. Вывести максимальную ЗП QA инженеров
select max(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%QA engineer%'

-- 25. Вывести количество QA инженеров
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%QA engineer%'

-- 26. Вывести количество Middle специалистов.
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%Middle%'

-- 27. Вывести количество разработчиков
select count(e.employee_name)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
where r.role_name like '%developer%'


-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary)
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where r.role_name like '%developer%'

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
order by s.monthly_salary 

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary between 1700 and 2300
order by s.monthly_salary 


-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary < 2300
order by s.monthly_salary 


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary 
from roles r join roles_employee re on r.id = re.roles_id 
join employees e on re.employee_id = e.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary 

