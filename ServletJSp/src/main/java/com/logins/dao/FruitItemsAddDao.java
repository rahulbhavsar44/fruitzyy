package com.logins.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import com.logins.store.FruitItems;

public class FruitItemsAddDao {

	
	static Connection  con = null;
	
	public static Connection getConnection() {
		try {
				
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
				
		} 
		catch (Exception e)
		{
			System.out.println(e);
		}

		return con;	
}
}