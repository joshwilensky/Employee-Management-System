// DEPENDENCIES================================================
const mysql = require("mysql");
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
    return inquirer
        .prompt([{
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

            inquirer
                .prompt([{
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