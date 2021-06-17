package com.logins.dao;

import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletOutputStream;

import com.logins.store.FruitItems;

public class FruitItemsReceive {
	
	
	FruitItems fs=new FruitItems();
	
	
	ServletOutputStream sos = null;
	Blob image1 = null;
	Connection con = null;
	byte[ ] imgData = null ;
	ResultSet rs = null;
	public  FruitItems getFruitItems(String fruit_name) {
		
		try {
				
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
			PreparedStatement st = con.prepareStatement("select * from fruit_items");
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				
				
				fs.setFruit_name(rs.getString("fruit_name"));
				fs.setFruit_price(rs.getString("fruit_price"));
				fs.setFruit_specific(rs.getNString("fruit_specific"));
				fs.setFruit_image(rs.getBlob("fruit_image"));
				
				
				}
			
			
		} 
		catch (Exception e)
		{
			System.out.println(e);
		}

		return fs;	
}
	
	


}
