package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logins.dao.AddDataDao;
import com.logins.dao.FruitItemsAddDao;


public class RegistrationData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		
		String customer_name=request.getParameter("customer-name");
		String specified_area=request.getParameter("area");
		String mobile_no=request.getParameter("mobile-no");
		String email_id=request.getParameter("email-id");
		String pure_address=request.getParameter("confirm-address");
	
		
		con = AddDataDao.getConnection();
		
		try {
			PreparedStatement pst= con.prepareStatement("insert into customer_info(customer_name,delivery_area,mobile_no,email_id,destination_address) values (?,?,?,?,?)");
			pst.setString(1, customer_name);
			pst.setString(2, specified_area);
			pst.setString(3, mobile_no);
			pst.setString(4, email_id);
			pst.setString(5, pure_address);
			
			int n = pst.executeUpdate();
			
			if(n>0) {response.getWriter().print("Uploaded Succesfully");}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.out.print(e);
		}
	}

}
