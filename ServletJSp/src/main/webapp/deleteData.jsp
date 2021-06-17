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



String fruit_cart = request.getParameter("fruit_cart");
String home_data = request.getParameter("home_data");
String server_data = request.getParameter("server_data");

Connection con = ExtraaThings.getList();

if(fruit_cart != null){

try{
	PreparedStatement st = con.prepareStatement("delete from ordered_fruits where fruit_name='"+ fruit_cart +"'");
	int n = st.executeUpdate();
	
	if(n>0){
		n--;
		fruit_cart = "";
		response.sendRedirect("FinalCart.jsp");
	}
	
	
}catch(Exception e){
	System.out.println(e);
	System.out.println("Error During Deleting From Fruit Cart");
	
}
}


else if(home_data != null){
try{
	PreparedStatement st1 = con.prepareStatement("delete from fruit_outlets where fruit_nameo='" + home_data +"'");
int n2 = st1.executeUpdate();
	
	if(n2>0){
		n2--;
		fruit_cart = "";
		response.sendRedirect("AddToHomeByAdmin.jsp");
	}
	
}catch(Exception e){
	System.out.println(e);
	System.out.println("Error During Deleting From Admin Home Page");
	
}
}

else if(server_data != null){
try{
	PreparedStatement st2 = con.prepareStatement("delete from fruit_database where fruit_name='" + server_data + "'");
int n3 = st2.executeUpdate();
	
	if(n3>0){
		n3--;
		fruit_cart = "";
		response.sendRedirect("AddToServerByAdmin.jsp");
	}
	
}catch(Exception e){
	System.out.println(e);
	System.out.println("Error During Deleting From Admin Server Side");
}
}

%>

</body>
</html>