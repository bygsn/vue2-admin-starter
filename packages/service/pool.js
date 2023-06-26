const mysql=require("mysql2");

const pool=mysql.createPool({
	host:"localhost",
	port:3306,
	user:"root",
	password:"password",
	database:"vue_admin_base",
	connectionLimit:15
});

module.exports=pool;
