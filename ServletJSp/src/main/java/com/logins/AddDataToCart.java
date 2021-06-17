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

import com.logins.store.ExtraaThings;

/**
 * Servlet implementation class AddDataToCart
 */
public class AddDataToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Connection con = null;
	    String fruit_namec = request.getParameter("f-name");
	    String fruit_specificc = request.getParameter("f-specific");
	    String fruit_weightc = request.getParameter("f-weight");
	    String fruit_pricec = request.getParameter("f-price");
	    String fruit_image = request.getParameter("f-image");
	    FileInputStream fis = new FileInputStream(new File(fruit_image));
	    
	    
	    
		Connection con = ExtraaThings.getList();
	    
		try{

	    PreparedStatement st = con.prepareStatement("insert into fruit_database (fruit_name,fruit_price,fruit_specific,fruit_weight,fruit_image)values(?,?,?,?,?)");
	    st.setString(1,fruit_namec);
	    st.setString(2,fruit_pricec);
	    st.setString(3, fruit_specificc);
	    st.setString(4,fruit_weightc);
	    st.setBinaryStream(5, fis);

		
		int n = st.executeUpdate();
		if(n>0) {response.sendRedirect("AddToServerByAdmin.jsp");}
	    
	    
	    
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		
	}

}
