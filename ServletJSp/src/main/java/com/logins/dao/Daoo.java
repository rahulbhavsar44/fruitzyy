package com.logins.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Daoo {

	
	static Connection  con = null;
	
	public static Connection getConnection() {
		try {
				
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
			
//			PreparedStatement st = con.prepareStatement(sql);
//			int rs = st.executeUpdate();

//			if(rs>0) {System.out.println("Successfully uploaded");}
				
				
				
		} catch (Exception e) {

			System.out.println("Catch of image");
			System.out.println(e);
		}

		return con;	
	}

}
