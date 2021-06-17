package com.logins.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class AddressDao {
	
	
	static Connection con = null;
	
	public static Connection getList() {
		
		
		
		try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address","root","rdmsql09");
				
				
				
		}
		catch(Exception e) 
		{
			
		}
		return con;
	} 
	

}
