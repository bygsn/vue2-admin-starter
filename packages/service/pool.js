const mysql = require("mysql2");

const {
	MYSQL_HOST,
	MYSQL_PORT,
	MYSQL_USER,
	MYSQL_PASSWORD,
	MYSQL_DATABASE,
	MYSQL_CONNECTION_LIMIT,
} = process.env;

const pool = mysql.createPool({
	host: MYSQL_HOST,
	port: MYSQL_PORT,
	user: MYSQL_USER,
	password: MYSQL_PASSWORD,
	database: MYSQL_DATABASE,
	connectionLimit: MYSQL_CONNECTION_LIMIT,
});

module.exports = pool;
