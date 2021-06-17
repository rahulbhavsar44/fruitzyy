package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class OnlyForImage
 */
public class OnlyForImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		ServletOutputStream sos = null;
		String fruit_name = request.getParameter("fruit-name");
		Connection conn =null;
//		ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
		byte[] img = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
			PreparedStatement st = con.prepareStatement("select * from fruit_items where fruit_name=" + "'" + fruit_name+ "'");
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
			
				img = rs.getBytes("fruit_image");
				
			}
			
			


			sos = response.getOutputStream();
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			System.out.print(e);
		}
	
		RequestDispatcher rd;
		request.setAttribute("file_nameee", img);
		rd=request.getRequestDispatcher("Fruit.jsp");
		rd.forward(request, response);
	}

	

	

}
