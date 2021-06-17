package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.logins.dao.AddDataDao;
import com.logins.store.ExtraaThings;



/**
 * Servlet implementation class AddMobileNo
 */
public class AddMobileNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static Connection con = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession obj = request.getSession();
//		String mnoo = (String) obj.getAttribute("fruit_list2");
			
		String mnoo = (String) request.getAttribute("mobileno");
		con = ExtraaThings.getList();
		
		
		try {
			PreparedStatement st = con.prepareStatement("select * from ordered_fruits where mobile_no=" + mnoo);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				HttpSession reqSess = request.getSession();
				reqSess.setAttribute("fruit_list0", mnoo);
				response.sendRedirect("FinalCart.jsp");
			}
			else {response.sendRedirect("EmptyCart.jsp");}
		}catch(Exception e) {}
		
		
//		HttpSession reqSess = request.getSession();
//		reqSess.setAttribute("fruit_list0", mnoo);
//		response.sendRedirect("FinalCart.jsp");
//		
		
		
		
//		RequestDispatcher rd=request.getRequestDispatcher("FinalCart.jsp");
//		rd.forward(request, response);
		
		
	}

}
