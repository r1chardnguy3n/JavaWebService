package com.webservice.Util;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class DatabaseConnection {
	
	ResultSet myResult;
	
	public DatabaseConnection() {
		
		try {
			//connection to database
			Class.forName("com.mysql.jdbc.Driver");
			String usr = "root";
			String psw = "";
			String url = "jdbc:mysql://localhost:3306/vehicle";
			Connection myConn = (Connection) DriverManager.getConnection(url, usr, psw);
			
			//statement
			Statement myState = (Statement) myConn.createStatement();
			
			//Execute SQL query
			myResult = (ResultSet) myState.executeQuery("select * from vehicle");
			
		}
		catch(Exception exc) {
			exc.printStackTrace();
		}
		
	}
	
	public ResultSet getResult() {
		return myResult;
	}

}
