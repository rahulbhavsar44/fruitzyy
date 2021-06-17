<%@page import="com.logins.dao.AddressDao"%>
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

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Fruit/css/fruitlist.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<body>

    
    <section class="empty-cart py-16">
<form action="Adminreceive.jsp" method="post">

            <div class="flex items-center justify-between mx-auto border-b border-gray-300 pb-4 w-1/2">
            <div class="flex">
			<i class="las la-shopping-cart" style="font-size: 50px"></i>
                <h1 class="font-bold ml-4 mt-2 text-2xl">Order Summary</h1>
                </div>
                <div> <a href="FinalFruit.jsp" class="btn-primary px-6 py-2 rounded-full text-white font-bold" style="color: black; background:orange; "> Add More</a></div>
</div>


        <div class="order container mx-auto w-1/2">
                <%
                int total_price =  0;
                
                Connection con = ExtraaThings.getList();
                
                

				int total = 0;
                String mobile_no = (String) session.getAttribute("fruit_list2");
                
                
                try{
                PreparedStatement st = con.prepareStatement("select * from ordered_fruits where mobile_no="+ mobile_no );
                ResultSet rs = st.executeQuery();
                
                
                	
                while(rs.next()){
                	
		
                int price =	Integer.parseInt(rs.getString("fruit_price"));
                total = total + price;
                
                session.setAttribute("final_total", total);
            
                    %>         





               
                
                
            
            
            <div class="fruit-list">
            
                <div class="flex items-center my-8">
                    <img src="http://localhost:9898/ServletJSp/Retrive.jsp?fruit-name=<%out.print(rs.getString("fruit_name"));%>" class="w-24" alt="">
                    <div class="ml-40 flex-1">
                        <h1><%out.print(rs.getString("fruit_name"));%></h1>
                        <span class="text-sm"><%out.print(rs.getString("fruit_specific"));%></span>
                    </div>

                    <span class="flex-1"><%out.print(rs.getString("fruit_weight"));%></span>
                    <span class="font-bold text-lg">Rs <%out.print(rs.getString("fruit_price")); %></span>
                     <button style="margin-left:25px"> <a href="deleteData.jsp?fruit_cart=<%out.print(rs.getString("fruit_name")); %>"> <i class="las la-trash-alt" style="font-size: 25px"></i></a></button>
                </div>


            </div>
            
<hr>
<% }%>
<div>
    <div class="total text-right py-4">
        <span class="text-lg font-bold">Total Amount:</span>
        <span class="amount text-2xl font-bold ml-2">Rs <% out.print(total); %></span>
    </div>
    <% 
                
                }
                
                catch(Exception e){
                	System.out.println("Error in big try");
                	System.out.println(e);
                }
                %>
    <div class="text-right">
        
            <input type="text" class="border border-gray-400 p-2 w-1/2 text-sm mt-12 mb-6" name="phone_no" placeholder="Phone-number">
            <input type="text" class="border border-gray-400 p-2 w-1/2 text-sm" name="destination_address" placeholder="Address"> 
           <div> <button class="btn-primary px-6 py-2 rounded-full text-white font-bold mt-6" type="submit" style="color: black; background:orange; ">Order Now</button></div>
        </form>
    </div>

    <!-- <a href="" class="">Login to Continue</a> -->
    <!-- If user not login then show him to login -->
</div>

        </div>





    </section>


</body>
</html>