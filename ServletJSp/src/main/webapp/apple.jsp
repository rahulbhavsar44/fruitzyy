<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apple</title>
</head>
<body>

<%try {
	String fruit_name = request.getParameter("fruit-name");
	Blob image1 = null;	
	byte[] f_image = null;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
PreparedStatement st = con.prepareStatement("select * from fruit_database where fruit_name = '" + fruit_name + "'");
ResultSet rs = st.executeQuery();

if(rs.next()) {
		
            	image1 = rs.getBlob("fruit_image");
            	f_image = image1.getBytes(1,(int)image1.length());

            	
            	
                response.setContentType("image/jpg");
                OutputStream o = response.getOutputStream();
                o.write(f_image);
                o.flush();
                o.close();
                
                %>
                
                <%
	


}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
	
 

} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
}
 

 %>

</body>
</html>