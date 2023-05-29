package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {

	private static Connection c;
	// Statement s;

	public static Connection getConn() {

		try {

			// register driver class
			Class.forName("com.mysql.cj.jdbc.Driver");

			// create connection object
			String user = "root";
			String pass = "Sarthaksaxena@#$";
			String url = "jdbc:mysql://localhost:3306/eanime";
			c = DriverManager.getConnection(url, user, pass);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return c;
	}
}
