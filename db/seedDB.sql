INSERT into
  department (name)
VALUES
  ("Executive");
INSERT into
  department (name)
VALUES
  ("Marketing");
INSERT into
  department (name)
VALUES
  ("IT");
INSERT into
  role (title, salary, department_id)
VALUES
  ("President", 500000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("CEO", 450000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("COO", 400000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("CFO", 400000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("CTO", 400000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("CIO", 400000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("CMO", 300000, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Executive Vice President", 250000, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Dom", "Porterboy", 1, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Bob", "Slydell", 2, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Bob", "Porter", 3, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Stacey", "Greer", 4, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Douglas", "Gueneer", 5, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Greg", "Sample", 5, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Dan", "Gustafson", 6, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("William", "King", 6, 1);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Bill", "Lumbergh", 7, 1);
INSERT into
  role (title, salary, department_id)
VALUES
  ("VP Operations", 200000, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("VP Event Manager", 150000, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Marketing Manager", 100000, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Box Office Director", 80000, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Marketing Associate", 80000, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Event Coordinator", 60000, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Tom", "Smykowski", 8, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Nina", "Day", 9, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Brian", "Duffey", 10, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Colleen", "Quiter", 10, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Jim", "Bartender", 11, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Jack", "Olegvasher", 12, 2);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Dan", "Templeton", 13, 2);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Tech Operations Director", 200000, 3);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Tech Information Manager", 150000, 3);
INSERT into
  role (title, salary, department_id)
VALUES
  ("System Administrator", 100000, 3);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Network Administrator", 80000, 3);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Tech Operations Analyst", 80000, 3);
INSERT into
  role (title, salary, department_id)
VALUES
  ("Help Desk Coordinator", 60000, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Peter", "Gibbons", 14, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Milton", "Waddams", 15, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Michael", "Bolton", 16, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Samir", "Nagheenanajar", 16, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Josh", "Clammer", 17, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Lily", "Santa-Monica", 18, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Ray", "Mustbeirish", 19, 3);
INSERT into
  employee (first_name, last_name, role_id, manager_id)
VALUES
  ("Derrick", "Avenguard", 19, 3);
SELECT
  R.id as role_id,
  D.id as department_id,
  R.title as Role,
  R.salary,
  D.name as Department_name,
FROM
  Roles R,
  JOIN Departments D,
  ON R.department_id = D.id;