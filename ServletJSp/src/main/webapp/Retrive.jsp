<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*"
    import = "java.io.IOException"
     import="java.sql.*"
     import="com.logins.dao.FruitItemsReceive"
     %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<img alt="" src="" value="<%


String gg= request.getParameter("fruit-name");
Blob image1 = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
stmt = con.createStatement();
rs = stmt.executeQuery("select * from ordered_fruits where fruit_name='" + gg + "'");

if (rs.next()) {
image1 = rs.getBlob("fruit_image");
imgData = image1.getBytes(1,(int)image1.length());
}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
// display the image
response.setContentType("image/jpg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} finally {
try {
rs.close();
stmt.close();
con.close();
} catch (SQLException e) {
e.printStackTrace();
}
}
%>" width="200px" height="150px">







<div></div>


</body>
</html>