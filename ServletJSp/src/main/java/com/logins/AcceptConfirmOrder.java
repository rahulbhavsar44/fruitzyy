package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logins.dao.AddressDao;


public class AcceptConfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection con = null;
		
		String mobile_no = request.getParameter("");
		String address = request.getParameter("");
		
		
		con = AddressDao.getList();
		try {
			PreparedStatement st = con.prepareStatement("insert into final_orderData");
			st.setString(1, mobile_no);
			st.setString(2, address);
			
			int n = st.executeUpdate();
			if(n>0) {
				response.sendRedirect("Home,jsp");
				System.out.println("Successfully Ordered");
			}
		}
		catch(Exception e) {}
	
	}

}
