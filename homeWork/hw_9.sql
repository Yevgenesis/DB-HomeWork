-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
SELECT department_id, COUNT(*) AS employeesCnt
FROM employees
group by department_id;


-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
SELECT d.department_name, COUNT(*) AS employeesCnt
FROM departments d
         join employees e ON e.department_id = d.department_id
group by d.department_name;


-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
SELECT manager_id, COUNT(*) AS employeesCnt
FROM employees
group by manager_id;


-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt
SELECT e.first_name, e.last_name, managers.cnt AS emplouesCount
From employees e
         join (select manager_id, COUNT(*) cnt
               from employees
               group by manager_id) managers
              on e.manager_id = managers.manager_id;


-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT employees.department_id, MAX(employees.salary) max_salary
from employees
group by employees.department_id;


-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
SELECT employees.first_name,
       employees.last_name,
       employees.salary,
       employees.department_id
FROM employees
         JOIN (SELECT employees.department_id, MAX(employees.salary) max_salary
               from employees
               group by employees.department_id) AS emploue_salary
              on emploue_salary.department_id = employees.department_id
WHERE employees.salary = emploue_salary.max_salary;


-- Найти департаменты, в которых больше 10 сотрудников. Вывести department_name
SELECT departments.department_name, department.cnt AS emploues_count
from departments
         join (SELECT employees.department_id, COUNT(*) cnt
               from employees
               group by employees.department_id) AS department
              on department.department_id = departments.department_id
WHERE department.cnt > 10;
