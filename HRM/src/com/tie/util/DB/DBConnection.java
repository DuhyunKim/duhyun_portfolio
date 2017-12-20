package com.tie.util.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection makeConnection() throws SQLException {
//		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kitri", "kitri");
//		return DriverManager.getConnection("jdbc:oracle:thin:@192.168.12.28:1521:xe", "hrm", "hrm");
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrm", "hrm");
	}
}