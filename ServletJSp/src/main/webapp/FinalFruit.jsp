<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.dao.FruitItemsReceive"%>
<%@page import="com.logins.store.FruitItems"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Document</title>
    <link rel="stylesheet" href="Free.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>



<div>



<nav class="container mx-auto flex items-center justify-between">
    <div class="flex">

        <div>
        <img src="Image/Apple-Fruit-PNG-Image.png" class="All-fruit" alt="">
    </div>
        <div class="fruitzyy"> Fruitzy</div>
</div>     

<div>

    <ul class="Menu-clicks flex justify-between items-center">
        <div class="mr-6 flex justify-between items-center">
        <li class="offer-bar ml-6"> <a href="#">Offers</a> </li>
        <li class="register-bar ml-6"> <a href="Register.jsp">Register</a> </li>
        <li class="menu-bar ml-6"> <a href="Home.jsp">Menu</a> </li>
        <li class="login-bar ml-6"> <a href="Login.jsp">Login</a> </li>
        <li class="cart-bar ml-6"> <a href="VerifyingCart.jsp" method="post"> <img src="icons/cart-2.svg"  style="width: 27px;" class="cart" alt=""></a> </li> 
    </div>

    </ul>

</div>
</nav>
<br><br>

<!-- <script src="C:/html/Fruit/js/fruit.js"></script> -->


    <section class="menu">
    <h1 class="text-center">All Fruits</h1>
        <div class="grid-view">
			


<%


ExtraaThings ets = new ExtraaThings();
Connection con = ExtraaThings.getList();

try{


PreparedStatement st = con.prepareStatement("select * from fruit_database");
ResultSet rs = st.executeQuery();

String mno = (String) session.getAttribute("fruit_list2");

HttpSession reqSess = request.getSession();
reqSess.setAttribute("fruit_list3", mno);


while(rs.next()) {
	
	
	
%>
<div class="card-box">
    <img src="http://localhost:9898/ServletJSp/apple.jsp?fruit-name=<%out.print(rs.getString("fruit_name"));%>" class="image">
    <div class="text-center"><hr>
        <h2 class="product-text"><%out.print(rs.getString("fruit_name")); %></h2>
        <span class="size-text"><%out.print(rs.getString("fruit_specific")); %></span>
        <div class="money-addbtn">
            <span> <span class="money"> <b> <%out.print(rs.getString("fruit_price")); %> Rs</b></span>/<%out.print(rs.getString("fruit_weight")); %></span>
            <button class="add-to-cart"><a href="MoreItemsAddingCart.jsp?f-name=<%out.print(rs.getString("fruit_name")); %>">
                <span>+</span>
                <span class="add-text">Add</span></a>
            </button>
        </div>
    </div>
</div>

<%
}
}
catch(Exception e){
	out.print(e);
	out.print("In Final retriving fruit list");
}%>




    </div>




</section>





</body>
</html>