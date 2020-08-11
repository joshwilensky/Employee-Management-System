INSERT into
  department (department_name)
VALUES
  ('Executive'),
  ('Sales'),
  ('Finance'),
  ('Legal'),
  ('Marketing'),
  ('IT'),
  ('HR');
  
  
INSERT into
  roles (title, salary, department_id)
VALUES ('President', 400000, 1),
('CEO', 400000, 1),
('COO', 400000, 1),
('CFO', 400000, 1),
('Executive VP', 250000, 1),
  ('Director of HR', 400000, 1),
  ('Director of Sales', 250000, 1),
  ('Director of Marketing', 250000, 1),
  ('General Counsel', 250000, 1),
  ('Executive Assistant', 100000, 1),
  ('Sales Director', 100000, 2),
  ('Sales Manager', 100000, 2),
  ('Salesperson', 60000, 2),
  ('Sales Assistant', 50000, 2),
  ('Lead Architect', 175000, 3),
  ("Tech Consultant", 90000, 3),
  ("Computer Programmer", 25000, 3),
  ('Lawyer', 130000, 4),
  ('Legal Assistant', 60000, 4),
  ('Accountant', 130000, 5),
  ('HR Manager', 120000, 6),
  ('Marketing Manager', 120000, 7),
  ('Marketing Assistant', 45000, 7),
  ('Secretary', 400000, 7);
  
  
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Dom", "Porterboy", 1, 1),
  ("Bob", "Slydell", 2, 1),
  ("Bob", "Porter", 3, 1),
  ("Stacey", "Greer", 4, 1),
  ("Douglas", "Gueneer", 5, 1),
  ("Greg", "Sample", 5, 1),
  ("Dan", "Gustafson", 6, 1),
  ("William", "King", 6, 1),
  ("Bill", "Lumbergh", 7, 1),
  ("Tom", "Smykowski", 8, 2),
  ("Nina", "Day", 9, 2),
  ("Brian", "Duffey", 10, 2),
  ("Colleen", "Quiter", 10, 2),
  ("Jim", "Bartender", 11, 2),
  ("Jack", "Olegvasher", 12, 2),
  ("Dan", "Templeton", 13, 2),
  ("Peter", "Gibbons", 14, 3),
  ("Milton", "Waddams", 15, 3),
  ("Michael", "Bolton", 16, 3),
  ("Samir", "Nagheenanajar", 16, 3),
  ("Josh", "Clammer", 17, 3),
  ("Lily", "Santa-Monica", 18, 3),
  ("Ray", "Mustbeirish", 19, 3),
  ("Derrick", "Avenguard", 19, 3);
Select
  employee.first_name,
  employee.last_name,
  roles.title,
  roles.salary,
  department.department_name,
  employee_m.first_name as manager_firstname,
  employee_m.last_name as manager_lastname
from
  employee
  join roles on employee.role_id = roles.id
  join department on roles.department_id = department.id
  Left join employee as employee_m on employee.manager_id = employee_m.id;
select
  *
from
  department;
select
  *
from
  roles;
select
  *
from
  employee;