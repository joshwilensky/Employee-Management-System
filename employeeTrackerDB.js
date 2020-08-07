// DEPENDENCIES================================================
const mysql = require("mysql");
const fs = require("fs");
const cTable = require("console.table");
const sqlite = require("sql-formatter");
const dotenv = require('dotenv');

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
                "Add Role",
                "Add Department",
                "View All Employees by Department",
                "Update an Employee's Role",
                "Exit",
            ]
        },

    ])
}