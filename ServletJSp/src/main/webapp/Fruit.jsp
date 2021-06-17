<%@page import="com.logins.store.OnlyForImages" %>
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type ="text/css" href="Fruit.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>


   
<nav>

<div>

    <ul>

        <li> <a href="#">Menu</a> </li>
        <li> <a href="#">Offers</a> </li>
        <li> <a href="#">Register</a> </li>
        <li> <a href="#">Login</a> </li>
        <li> <a href="#"> <img src="" alt=""> </a> </li> 
        <!-- Cart Image upper -->





    </ul>
</div>

</nav>




    <section class="menu">
    <h1 class="">All Fruits</h1>







        <div class="grid-view">
<div>

<%try {
	String fruit_name = request.getParameter("fruit-name");
	Blob image1 = null;	
	byte[] f_image = null;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruit","root","rdmsql09");
PreparedStatement st = con.prepareStatement("select * from fruit_outlets where fruit_nameo = '" + fruit_name + "'");
ResultSet rs = st.executeQuery();

if(rs.next()) {
	
	String f_name = rs.getString("fruit_nameo");
	String f_price = rs.getString("fruit_priceo");
	String f_specific = rs.getString("fruit_specifico");
	





	%>
	
	
    <img src="" class="image" style="width: 100px; height: 100px;" name="images" alt="">
    <div class="text-center">
        <h2 class="product-text"><%=(String)rs.getString("fruit_nameo") %> HIII</h2>
        <span class="size-text"><% out.print(f_specific);%></span>
        <div class="money-addbtn">
            <span> <span class="money"> <b><% out.print(f_price); %></b></span> Rs/KG</span>
            <button class="add-to-cart">
                <span>+</span>
                <span class="add-text">
                
                
                
                
                
                
                <%
                
            	image1 = rs.getBlob("fruit_imageo");
            	f_image = image1.getBytes(1,(int)image1.length());

                response.setContentType("image/jpg");
                OutputStream o = response.getOutputStream();
                o.write(f_image);
                o.flush();
                o.close();
                
                %></span>
            </button>
        </div>
    </div>
</div>
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
 






    </div>




</section>


</body>
</html>