// DEPENDENCIES================================================
const mysql = require("mysql");
const inquirer = require("inquirer");
const fs = require("fs");
const cTable = require("console.table");
const sqlite = require("sql-formatter");
const dotenv = require('dotenv');
const {
    exit
} = require("process");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "Chopper11",
    database: "employee_tracker_db",
});

// CHECKING FOR A CONNECTION===================================
connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
    mainMenu();
});

// TEST IF THE DB IS WORKING===================================
function mainMenu() {
    connection.query("SELECT * FROM employee", function (err, res) {
        if (err) throw err;
        console.table(res);
        connection.end();
    });
}

// MAIN SECTION QUESTIONS======================================
function mainMenu(response) {
    return inquirer.prompt([{
                type: "list",
                message: "What would you like to do?",
                name: "action",
                choices: [
                    "View All Employees",
                    "View All Roles",
                    "View All Departments",
                    "Add an Employee",
                    "Add a Role",
                    "Add a Department",
                    "View All Employees by Department",
                    "Update an Employee's Role",
                    "Exit",
                ]
            },

        ])

        // CHOICE OF QUESTIONS=========================================
        .then(function (reply) {
            if (reply.action === "View All Employees") {
                viewAllEmployees();
            } else if (reply.action === "View All Roles") {
                viewAllRoles();
            } else if (reply.action === "View All Departments") {
                viewAllDepartments();
            } else if (reply.action === "Add an Employee") {
                addEmployee();
            } else if (reply.action === "Add a Role") {
                addRole();
            } else if (reply.action === "Add a Department") {
                addDepartment();
            } else if (reply.action === "View All Employees by Department") {
                viewEmployeesByDepartment();
            } else if (reply.action === "Update an Employee's Role") {
                updateEmployeeRole();
            } else if (reply.action === "Exit") {
                connection.end();
            }
        })

        .catch(function (err) {
            console.log(err);
        });
}

function viewAllEmployees() {
    connection.query("SELECT * FROM employee", function (err, res) {
        if (err) throw err;
        console.table(res);
        mainMenu();
    });
}

function viewAllDepartments() {
    connection.query("SELECT * FROM department", function (err, res) {
        if (err) throw err;
        console.table(res);
        mainMenu();
    });
}

// EMPLOYEES=====================================================
function addEmployee() {
    let roleArray = [];
    connection.query(
        "SELECT id, title FROM roles",
        function (err, roles) {
            if (err) throw err;
            for (var i = 0; i < roles.length; i++) {
                roleArray.push(roles[i].title);
            }
            console.log(roles);

            inquirer.prompt([{
                        name: "firstname",
                        type: "input",
                        message: "Enter employee's first name:",
                    },
                    {
                        name: "lastname",
                        type: "input",
                        message: "Enter employee's last name:",
                    },
                    {
                        name: "role",
                        type: "rawlist",
                        message: "Choose a role for the employee:",
                        choices: roleArray,
                    },
                ])

                // QUESTIONS ARRAY TO ADD EMPLOYEES=====================
                .then(function (reply) {
                    let deptId;
                    res.forEach((department => {
                        if (department.department_name === reply.department_id) {
                            console.log(department.id);
                        }
                        deptId = department.id;
                    }));
                    connection.query(
                        "INSERT INTO roles SET ?", {
                            first_name: reply.first_name,
                            lastname: reply.last_name,
                            role_id: role_id,
                        },
                        function (err, res) {
                            if (err) throw err;
                            console.table(res.affectedRows + "employee added" + "\n");
                            mainMenu();
                        }
                    );
                });
        }
    );
}

// ROLES=========================================================
function addRole() {
    let departmentsArray = [];
    connection.query("SELECT * FROM department", function (err, res) {
        if (err) throw err;
        for (var i = 0; i < res.length; i++) {
            departmentsArray.push(res[i].department_name);
        }

        inquirer.prompt([{
                    type: "input",
                    name: "role",
                    message: "Enter a new role:",
                },
                {
                    type: "input",
                    name: "salary",
                    message: "Enter the salary for this role:",
                },
                {
                    type: "list",
                    name: "department_id",
                    message: "Which department is this role in?",
                    choices: departmentsArray,
                },
            ])

            .then(function (reply) {
                let deptId;
                res.forEach((department) => {
                    if (department_name === reply.department_id) {
                        console.log(department.id);
                    }
                    deptId = department.id;
                });
                connection.query(
                    "INSERT INTO roles SET ?", {
                        title: reply.role,
                        salary: reply.salary,
                        department_id: deptId,
                    },
                    function (err, res) {
                        if (err) throw err;
                        console.table("New role added.");
                    }
                );
                mainMenu();
            });
    });
}

// DEPARTMENTS================================================
function addDepartments() {
    inquirer.prompt([{
            name: "newDepartment",
            message: "Enter new department name:",
            type: "input",
        }])

        .then(function (reply) {
            let newDepartment = [];
            console.log("Adding a new department... \n");
            newDepartment.push(reply.newDepartment);
            connection.query(
                "INSERT INTO department SET ?", {
                    department_name: reply.newDepartment
                },
                function (err, res) {
                    if (err) throw err;
                    console.table(res.affectedRows + " department added \n");
                    mainMenu();
                }
            );
        });
}

// VIEW ALL EMPLOYEES FUNCTION=======================================
function viewEmployeesByDepartment() {
    let departmentArray = [];
    connection.query("SELECT * FROM department", function (err, res) {
        if (err) throw err;
        for (var i = 0; i < res.length; i++) {
            departmentArray.push(res[i].department_name);
        }
        console.log(departmentArray);
        inquirer
            .prompt([{
                type: "list",
                message: "Which department's employee would you like to see?",
                choices: departmentArray,
                name: "department",
            }, ])
            .then(function (reply) {
                const departmentChoice = reply.department;
                console.log(departmentChoice);
                connection.query(
                    `SELECT department_name, first_name, last_name FROM employee, department, roles WHERE department.id = department_id AND roles.id = role_id`,
                    function (err, res) {
                        if (err) throw err;
                        const departmentName = [];
                        for (i = 0; i < res.length; i++) {
                            if (res[i].department_name === departmentChoice) {
                                departmentName.push(res[i].first_name + " " + res[i].last_name);
                            }
                        }
                        console.table(departmentName);
                        mainMenu();
                    }
                );
            });
    });
}

function viewEmployeesByManager() {}

function updateEmployeeRole() {
    mainMenu();
}