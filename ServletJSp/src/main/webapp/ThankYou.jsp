<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="com.logins.dao.AddDataDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You!</title>
    <link rel="stylesheet" href="ThankYou.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

</head>
<body>

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
            <li class="offer-bar mr-4 ml-4"> <a href="Home.jsp">Offers</a> </li>
            <li class="register-bar mr-4 ml-4"> <a href="Register.jsp">Register</a> </li>
            <li class="menu-bar mr-4 ml-4"> <a href="FinalFruit.jsp">Menu</a> </li>
            <li class="login-bar mr-4 ml-4"> <a href="Login.jsp">Login</a> </li>
            <li class="cart-bar mr-4 ml-4"> <a href="VerifyingCart.jsp" method="post"> <img src="icons/cart-2.svg"  style="width: 27px;" class="cart" alt=""></a> </li> 
        </div>
        <!-- <img class="menu-bar-cart inline-block px-4 py-2" src="..//icons/shopping-cart-solid.svg" alt=""> -->
        </ul>
    
    </div>
    </nav>
    <br><br>

    
<section class="order-part mt-12">
    <div class="container">
        <div class="cb1">
          <div class="row text-center">
              <span class="icon icon-xl icon-success">
                <i class=""></i>
                
                
                      <%
      
      int total_amount = (Integer) session.getAttribute("final_amount");
      String mobile_no = (String) session.getAttribute("fruit_list2");
      
     String dat = LocalDate.now().toString();
     String tme = LocalTime.now().toString();




     
     
     String mno = (String) session.getAttribute("reverse_mno");
     String o_id = "ORD" + mno;
     int total = 0;
     

      
      Connection con = null;
      con = ExtraaThings.getList(); 
          
      %>
              </span>
              <h1>Thank You For Order!</h1>
              <h4>You will receive it in between <%out.print("18:54"); %> to <%out.print("19:54"); %></h4>                 
        </div>
        </div>
      </div>
            
      

      
      <div class="sticky-order col-lg-12 col-md-12 col-sm-12 mt-4 col-xs-12">
        <div class="accordion active" id="Details">
          <h4 class="accordion-toggle"> <span> Detailed Order Receipt <i class="las la-file-alt"></i></span></h4>
          <div><h6 class="ml-48">Order id : <%out.print(o_id); %></h6></div>
          <div> <h6 class="ml-48">Order Date : <%out.print(dat); %></h6></div>
          <div> <h6 class="ml-48">Order Time : <%out.print(tme); %></h6></div>
          
        </div>
      </div>
    </section>


      <section class="empty-cart">

        <div class="order container w-1/2">
            <div class="flex items-center border-gray-300 pb-4">

            </div>
            
            
            <div class="fruit-list">
              <% try{
                PreparedStatement st = con.prepareStatement("select * from ordered_fruits where mobile_no="+ mobile_no );
                ResultSet rs = st.executeQuery();
                
                
                	
                while(rs.next()){
                	
		
                int price =	Integer.parseInt(rs.getString("fruit_price"));
                total = total + price;
               
                %>
                
                
                <div class="flex items-center my-8">
                    <img src="http://localhost:9898/ServletJSp/Retrive.jsp?fruit-name=<%out.print(rs.getString("fruit_name"));%>" class="w-24" alt="">
                    <div class="ml-40 flex-1">
                        <h1><%out.print(rs.getString("fruit_name"));%></h1>
                        <span class="text-sm"><%out.print(rs.getString("fruit_specific"));%></span>
                    </div>

                    <span class="flex-1"><%out.print(rs.getString("fruit_weight"));%></span>
                    <span class="font-bold text-lg"> <%out.print(rs.getString("fruit_price"));%></span>
                </div>
                
                
                <% }%>
            </div>
<hr>


<div>
    <div class="total text-right py-4">
        <span class="text-lg font-bold">Total Amount:</span>
        <span class="amount text-2xl font-bold ml-2"> <%out.print(total); %></span>
    </div>
<% 
                
                }
                
                catch(Exception e){
                	System.out.println("Error in big try");
                	System.out.println(e);
                }
                %>

</div>

        </div>





    </section>


</body>
</html>