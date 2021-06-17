<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.dao.AddDataDao"%>
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
String mnoo = (String) session.getAttribute("mobileno");
Connection con = ExtraaThings.getList();


try {
	PreparedStatement st = con.prepareStatement("select * from ordered_fruits where mobile_no=" + mnoo);
	ResultSet rs = st.executeQuery();
	if(rs.next()) {
		HttpSession reqSess = request.getSession();
		reqSess.setAttribute("fruit_list0", mnoo);
		response.sendRedirect("FinalCart.jsp");
	}
	else {response.sendRedirect("EmptyCart.jsp");}
}catch(Exception e) {
	System.out.print(e);
	
}

%>

</body>
</html>