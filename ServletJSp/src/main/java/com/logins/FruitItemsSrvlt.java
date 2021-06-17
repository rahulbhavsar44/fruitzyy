package com.logins;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logins.dao.FruitItemsReceive;
import com.logins.store.FruitItems;



public class FruitItemsSrvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String fruit_name = request.getParameter("fruit-name");
		

		FruitItemsReceive fdrs = new FruitItemsReceive();
		
		
		FruitItems fss= fdrs.getFruitItems(fruit_name);
			
		request.setAttribute("fruit_list1", fss);
		
		
		
		
		RequestDispatcher rd=request.getRequestDispatcher("FinalFruit.jsp");
		rd.forward(request, response);
						
	}


	

	

}
