package com.cmc.fase2.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionBDD {
	public static Connection connect(String host, int port, String user,String pwd,String database){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String connectionUrl = "jdbc:sqlserver://"+host+":"+port+";" 
				+ "database="+database+";" 
				+ "user="+user
				+ ";password="+pwd+";" 
				+ "encrypt=false;" 
				+ "trustServerCertificate=false;" 
				+ "loginTimeout=10;";
		Connection con = null; 
		try {
			con = DriverManager.getConnection(connectionUrl);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
