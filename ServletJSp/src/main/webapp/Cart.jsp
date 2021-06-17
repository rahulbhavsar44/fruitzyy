<%@page import="java.sql.Blob"%>
<%@page import="javax.websocket.Decoder.BinaryStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Fruit/css/fruitlist.css">
</head>
<body>



    
    <section class="empty-cart py-16">

        <div class="order container mx-auto w-1/2">
            <div class="flex items-center border-b border-gray-300 pb-4">
                <img src="C:/html/Fruit/images/cart-black.png" alt="">
                <h1 class="font-bold ml-4 text-2xl">Order Summary</h1>
                
                <%
                String fruit_name = request.getParameter("f-name");
        
                String mobileno = (String)session.getAttribute("fruit_list2");
                
                int total_price =  0;
                
                Connection con = ExtraaThings.getList();
                
                try{
                PreparedStatement st = con.prepareStatement("select * from fruit_outlets where fruit_nameo='" + fruit_name + "'");
                ResultSet rs = st.executeQuery();
                while(rs.next()){
		
                	String fruit_specific = rs.getString("fruit_specifico"); 
                    String fruit_weight =  rs.getString("fruit_weighto");
                    String fruit_price =  rs.getString("fruit_priceo");
                    Blob image = rs.getBlob("fruit_imageo");
                    
            
                    
                    
                    try{
                        PreparedStatement st1 = con.prepareStatement("insert into ordered_fruits (mobile_no,fruit_name,fruit_weight,fruit_specific,fruit_price,fruit_image)values(?,?,?,?,?,?)");
                        
                        	st1.setString(1, mobileno);
                        	st1.setString(2, fruit_name);
                        	st1.setString(3, fruit_weight);
                        	st1.setString(4, fruit_specific);
                            st1.setString(5, fruit_price);
                            st1.setBlob(6, image);
                            
						int n = st1.executeUpdate();
						
						response.sendRedirect("Home.jsp");
                                	
                    }
                    catch(Exception e){
                    	
                    	System.out.println("Error In Adding during cart");
                    }
                    
                }
                
            
                
                
                }
                catch(Exception e){
                	System.out.println("Error in big try");
                	System.out.println(e);
                }
            
                
                %>

            </div>
            <div class="fruit-list">
                <div class="flex items-center my-8">
                    <img src="C:/html/Fruit/images/Apple.jpg" class="w-24" alt="">
                    <div class="ml-40 flex-1">
                        <h1>Apples</h1>
                        <span class="text-sm">Medium</span>
                    </div>

                    <span class="flex-1">1 KG</span>
                    <span class="font-bold text-lg">Rs 240</span>
                </div>


            </div>
<hr>

<div>
    <div class="total text-right py-4">
        <span class="text-lg font-bold">Total Amount:</span>
        <span class="amount text-2xl font-bold ml-2">Rs 300</span>
    </div>

    <div class="text-right">
        <form action="">
            <input type="text" class="border border-gray-400 p-2 w-1/2 text-sm mt-12 mb-6" placeholder="Phone-number">
            <input type="text" class="border border-gray-400 p-2 w-1/2 text-sm" placeholder="Address"> 
           <div> <button class="btn-primary px-6 py-2 rounded-full text-white font-bold mt-6" type="submit">Order Now</button></div>
        </form>
    </div>

    <!-- <a href="" class="">Login to Continue</a> -->
    <!-- If user not login then show him to login -->
</div>

        </div>


        <!-- <div class="container mx-auto text-center">
            <h1 class="text-3xl font-bold mb-2">Cart Empty</h1>
            <p class="text-gray-500 text-lg mb-12">You probably haven't ordered a pizza yet. <br>
                To order a pizza, go to the main page.</p>

                <img src="/Fruit/images/empty-cart.png" class="w-2/5 mx-auto" alt="empty-cart">
                <a href="/" class="inline-block px-6 py-2 rounded-full btn-primary text-white font-bold mt-12">Go Back</a>
        </div> -->



    </section>

</body>
</html>