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


public class HomeDataAdding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con= null;
		String f_nameo=request.getParameter("fruit-nameo");
		String f_weighto=request.getParameter("fruit-weighto");
		String f_specifico=request.getParameter("fruit-specifico");
		String f_priceo=request.getParameter("fruit-priceo");
		String f_imageo=request.getParameter("fruit-imageo");
		FileInputStream fhof = new FileInputStream(new File(f_imageo));
		
		con = FruitItemsAddDao.getConnection();
		
		try {
			PreparedStatement pst= con.prepareStatement("insert into fruit_outlets(fruit_nameo,fruit_weighto,fruit_specifico,fruit_priceo,fruit_imageo) values (?,?,?,?,?)");
			pst.setString(1, f_nameo);
			pst.setString(2, f_weighto);
			pst.setString(3, f_specifico);
			pst.setString(4, f_priceo);
			pst.setBinaryStream(5, fhof);
			
			int n = pst.executeUpdate();
			
			if(n>0) {response.sendRedirect("AddToHomeByAdmin.jsp");}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.out.print(e);
		}
	}

}
