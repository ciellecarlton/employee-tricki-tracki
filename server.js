var mysql = require("mysql");
var inquirer = require("inquirer");
// create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",
  // Your port; if not 3306
    port: 3306,
  // Your username
    user: "root",
  // Your password
    password: "cielle13",
    database: "employee-tricki-tracki"
});
// connect to the mysql server and sql database
connection.connect();
initialQuestions();
// function to handle posting new items up for auction
async function initialQuestions() {
  // prompt for info about the item being put up for auction
    let question = new Promise((resolve, reject) => {
        resolve (inquirer
        .prompt([
        {
        name: "membersChoice",
        type: "list",
        message: "What would you like to do?",
        choices:["View All Employees","View All By Department","View All By Manager",
        "Add Employee","Remove Employee","Update Employee Role","Update Employee Manager"]
        }
            ])
        )
    });
    var answer = await question;
    if (answer.membersChoice === "View All Employees"){
        var query = "SELECT * FROM employee";
        connection.query(query, function(err, res) {
            if (err) throw err;
            console.table(res);
        })
    }
}