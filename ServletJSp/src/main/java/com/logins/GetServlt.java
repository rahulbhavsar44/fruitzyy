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

import com.logins.dao.Daoo;




public class GetServlt extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String image=request.getParameter("image");
		System.out.println("path" + image);
		FileInputStream fis = new FileInputStream(new File(image));
		Connection con = Daoo.getConnection();
		
		try {
		PreparedStatement st = con.prepareStatement("insert into imageuploadd(id,name,image)values(?,?,?)");
		st.setString(1, id);
		st.setString(2, name);
		st.setBinaryStream(3, fis);
		int n = st.executeUpdate();
		
			if(n>0) {response.getWriter().println("Successfully uploaded");}
		}
		 catch (Exception e) {

//				e.printStackTrace();
				System.out.println(con);
			}

	}

}
