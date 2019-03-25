<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonObjectBuilder"%>
<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonObject"%>
<%@page import="com.webservice.Entity.Vehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.webservice.Util.DatabaseConnection"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String usr = "root";
		String psw = "";
		String url = "jdbc:mysql://localhost:3306/douglasvehicles";
		Connection myConn = (Connection) DriverManager.getConnection(url, usr, psw);
		
		//statement
		Statement myState = (Statement) myConn.createStatement();
		
		//Execute SQL query
		ResultSet myResult = (ResultSet) myState.executeQuery("select * from vehicle");

		Vehicle vehicle = new Vehicle();
		ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		
		while(myResult.next()){
			String id		= myResult.getString("id");
			String make 	= myResult.getString("make");
			String model 	= myResult.getString("model");
			String year 	= myResult.getString("year");
			String type 	= myResult.getString("type");
			String price 	= myResult.getString("price");
			
			vehicleList.add(new Vehicle(id, make, model, year, type, price));
		}
		
		JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
		
		JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
		
		for(Vehicle vehicleData : vehicleList){
			JsonObjectBuilder vehicleBuilder = Json.createObjectBuilder();
			JsonObject vehicleJson = vehicleBuilder.add("make", vehicleData.getMake())
					.add("model", vehicleData.getModel())
					.add("type", vehicleData.getType())
					.add("year", vehicleData.getYear())
					.add("price", vehicleData.getPrice()).build();
			
			arrayBuilder.add(vehicleJson);
		}
		
		JsonObject root = jsonBuilder.add("vehicle",arrayBuilder).build();
		//jsonBuilder.add("vehicle",arrayBuilder).build();
	    out.print(root);
	    out.flush();
		
	}catch(Exception exc){
		exc.printStackTrace();
	}
%>
