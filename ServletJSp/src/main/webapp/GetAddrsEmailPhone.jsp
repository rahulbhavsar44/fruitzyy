<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.dao.AddressDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	
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
			
			try{
			
			String name2 = rs.getString("customer_name");
			
			session.setAttribute("user_name", name2);
			session.setAttribute("mobileno", mobile_no);
			response.sendRedirect("Home.jsp");
			}catch(Exception e){System.out.print(e);}
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
					
					session.setAttribute("mobileno", mobile_no);
					session.setAttribute("user_name", name);
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





%>

</body>
</html>