<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.store.ExtraaThings"%>
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
		String fruit_name = request.getParameter("f-name");
		String mobile_no = (String) session.getAttribute("fruit_list3");
		
		Connection con = ExtraaThings.getList();
		
		try{
			PreparedStatement st = con.prepareStatement("select * from fruit_database where fruit_name='" + fruit_name +  "'");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				
				String fruit_weight = rs.getString("fruit_weight");
				String fruit_specific = rs.getString("fruit_specific");
				String fruit_price = rs.getString("fruit_price");
				Blob fruit_image = rs.getBlob("fruit_image");
				
				try{
					PreparedStatement st1 = con.prepareStatement("insert into ordered_fruits (mobile_no,fruit_name,fruit_weight,fruit_specific,fruit_price,fruit_image)values(?,?,?,?,?,?)");
					st1.setString(1,mobile_no);
					st1.setString(2,fruit_name);
					st1.setString(3,fruit_weight);
					st1.setString(4,fruit_specific);
					st1.setString(5,fruit_price);
					st1.setBlob(6,fruit_image);
					
					st1.executeUpdate();
					response.sendRedirect("FinalFruit.jsp");
					
					
				}
				catch(Exception e){
					System.out.println(e);
					System.out.println("Error in inner try");
				}
				
				
			}
		}
		catch(Exception e){
			System.out.println(e);
			System.out.println("Error in inner try");
		}

%>


</body>
</html>