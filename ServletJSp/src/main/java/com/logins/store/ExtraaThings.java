package com.logins.store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ExtraaThings {
	
	static Connection con = null;
	public static Connection getList() {
	
	try {

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
	
	}
	catch (Exception e) 
	{
		
	}
	return con;

}}
