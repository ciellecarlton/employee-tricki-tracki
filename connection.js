const util = require ("util");
const mysql = require("mysql");

const connection = mysql.createConnection({
    host: "localhost",
    // your name 
    user: "root",
    // password 
    password: "",
    // mySQL filename
    database: "employee-tricki-tracki_db"
});

connection.connect();

connection.query = util.promisify(connection.query);

module.exports = connection;