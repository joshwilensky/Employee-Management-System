# Employee Management System [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Table of Contents

---

### [Description](#Descriptions)

### [Screenshots](#Screenshots)

### [Installation](#Installations)

### [Usage](#Usages)

### [License](#License)

### [Contributing](#Contributions)

### [Tests](#Tests)

### [Questions](#Questions)

### [GitHub](#GitHub)

---

### <a name="Description"></a>Descriptions:

Developers are often tasked with creating interfaces that make it easy for non-developers to view and interact with information stored in databases. Often these interfaces are known as **C**ontent **M**anagement **S**ystems. In this mission, I architected and built a solution for managing a company's employees using node, inquirer, and MySQL.

---

### <a name="Screenshots"></a>Screenshots:

---

### <a name="Installation"></a>Installations:

I created the Employee Management System with npm packages: **MySQL**, **Node**, **Inquirer**, and **console.table** design pattern.

---

### <a name="Usage"></a>Usages:

Designed the following database schema containing three tables:

- **Department**:

  - **id** - INT PRIMARY KEY
  - **name** - VARCHAR(30) to hold department name

- **Role**:

  - **id** - INT PRIMARY KEY
  - **title** - VARCHAR(30) to hold role title
  - **salary** - DECIMAL to hold role salary
  - **department_id** - INT to hold reference to department role belongs to

- **Employee**:

  - **id** - INT PRIMARY KEY
  - **first_name** - VARCHAR(30) to hold employee first name
  - **last_name** - VARCHAR(30) to hold employee last name
  - **role_id** - INT to hold reference to role employee has
  - **manager_id** - INT to hold reference to another employee that manager of the current employee. This field may be null if the employee has no manager

---

### <a name="License"></a>License:

**MIT License Copyright (c) 2020 Joshua Wilensky**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

### <a name="Contributing"></a>Contributions:

- Ben Wright
- Justin Pinero
- Benjamin Benson

---

### <a name="Tests"></a>Tests:

- [x] nodemon
- [x] MySQL

---

### <a name="Questions"></a>Email the Author:

joshwilensky@gmail.com

---

### <a name="Github"></a>GitHub Account:

http://github.com/joshwilensky
