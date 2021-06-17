package com.logins;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logins.dao.FruitItemsAddDao;


public class DataAdding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		String fruit_name=request.getParameter("fruit-name");
		String fruit_price=request.getParameter("fruit-price");
		String fruit_specific=request.getParameter("fruit-specific");
		String fruit_weight=request.getParameter("fruit-weight");
		String fruit_image=request.getParameter("fruit-image");
		FileInputStream fis = new FileInputStream(new File(fruit_image));
		con = FruitItemsAddDao.getConnection();
		
		try {
		PreparedStatement st = con.prepareStatement("insert into fruit_products(fruit_name,fruit_price,fruit_specific,fruit_weight,fruit_image)values(?,?,?,?,?)");
		st.setString(1, fruit_name);
		st.setString(2, fruit_price);
		st.setString(3, fruit_specific);
		st.setString(4, fruit_weight);
		st.setBinaryStream(5, fis);
		
		
		int n = st.executeUpdate();

		
			if(n>0) {response.getWriter().print("Successfully uploaded");}
		}
		 catch (Exception e) {
			 	System.out.println(e);
				e.printStackTrace();
			}
		
	
	}

}
