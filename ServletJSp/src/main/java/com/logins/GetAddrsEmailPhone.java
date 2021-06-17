package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.logins.dao.AddressDao;
import com.logins.store.ExtraaThings;

/**
 * Servlet implementation class GetAddrsEmailPhone
 */
public class GetAddrsEmailPhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String mobile_no = request.getParameter("mobile-no")  ;
		String address = request.getParameter("confirm-address");
		String name = request.getParameter("customer-name");
		String area = request.getParameter("area");
		String password = request.getParameter("pass");
		
		Connection con = null;
		con = AddressDao.getList();
		

		try {
				PreparedStatement st = con.prepareStatement("select * from customer_info where mobile_no =" + mobile_no + " and email_id ='" + password +"'");
				

				ResultSet rs = st.executeQuery();
				if(rs.next()) {
					
					
					HttpSession reqSess = request.getSession();
					reqSess.setAttribute("mobileno", mobile_no);
					request.setAttribute("user_name", name);
					RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
					rd.forward(request, response);
					
				}
				else {
					

					try 
					{
						PreparedStatement st1 = con.prepareStatement("insert into customer_info (mobile_no, customer_name, delivery_area, email_id, destination_address) values (?,?,?,?,?)");
						st1.setString(1, mobile_no);
						st1.setString(2, name);
						st1.setString(3, area);
						st1.setString(4, password);
						st1.setString(5, address);
						int rs1 = st1.executeUpdate();
						
						if(rs1>0) {
							
							request.setAttribute("mobileno", mobile_no);
							request.setAttribute("user_name", name);
							response.sendRedirect("Login.jsp");
							
						}
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.print("Error during adding customer personal data");
						System.out.print(e);
					}
					
				}
				
				
			}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		
	}

}
