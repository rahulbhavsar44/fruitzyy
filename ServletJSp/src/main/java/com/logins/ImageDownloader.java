package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logins.dao.Daoo;


public class ImageDownloader extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		byte[] img = null;
//		ServletOutputStream sos = null;
//		String f_name = request.getParameter("fruit-name");
		try {
//			Connection con = Daoo.getConnection();
//			PreparedStatement st = con.prepareStatement("select * from fruit_list where fruit_name='Apples'");
//			ResultSet rs = st.executeQuery();

		
//			if(rs.next()) {img = rs.getBytes("fruit_image");}
			
			RequestDispatcher rd;
			rd=request.getRequestDispatcher("Fruit.jsp");
			rd.forward(request, response);
//			sos = response.getOutputStream();
//			sos.write(img);
			
			
		}
		 catch (Exception e) {

				e.printStackTrace();
				System.out.println(e);
			}
		
		
	}
	
}
