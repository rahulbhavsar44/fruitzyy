<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruit Store</title>

    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="Home.css">

    
    
    
    

</head>
<body>


<header class="topbar header">
    
    <div class="top-border">

        <div class="contaner22 flex justify-between items-center">
            <div class="icons">
<%
	
	Connection con = ExtraaThings.getList();
	
	
	PreparedStatement st = con.prepareStatement("select * from fruit_outlets");
	ResultSet rs= st.executeQuery();
	String mno = (String) session.getAttribute("mobileno");
	String user_name = (String) session.getAttribute("user_name");
	
	HttpSession reqSess = request.getSession();
	reqSess.setAttribute("fruit_list2", mno);


	
	

	%>

                <a href="#"><img src="Image/fruitzy.png" class="image" alt=""></a>

                
            </div>

                <div class="locate-search">

                    <div class="flex search-container items-center">
                    

                        <input type="text" class="search-tab" placeholder="Search your fruits here">

                        <div class="search-icon">
                        <a href="#">
                            <img src="icons/search_white_24dp.svg" alt="">
                        
                        </a>
                    </div>
                    </div>

                </div>


            

            <div class="auth">
                <div>

                    <a class="my-account" href="Login.jsp">My Account</a>
                </div>
 
        <div class="login-creds flex">
                <div>
                    <a href="Login.jsp" class="login-creds">Log in</a>
                </div>


                <div>

                    <a href="Register.jsp" class="login-creds">Sign up</a>
                </div>
            </div>

            </div>

            <div class="cart-info ">
                <div class="cart-card">
                   <a href="VerifyingCart.jsp" method="post"> <img src="icons/cart-2.svg" class="cart" alt=""></a>
                </div>
                <div class="money"></div>
            </div>

        </div>

</div>
   
    
</header>


<br><br>

<nav>

    <div class="top">
        <div class="contaner22 flex justify-between">

            <div class="contact flex items-center">
                <!-- phone icon image -->
                <div class="flex">
                <img src="icons/phone.svg"  alt="">
                <div class="call-time-mail">
                    <h5>Call Us: (+91) 884 961 2660</h5>
                    <h6>E-mail : fruitzy@gmail.com</h6>
                </div></div>
            </div>

            <div class="branding">
                <h1> <span class="fruitzyy"> Fruitzy</span></h1>
                <span class="market">fresh fruit market</span>
                <!-- image of logo -->
            </div>

            <div class="time flex items-center">
                <!-- clock icon image -->
                <div class="flex">
                <img src="icons/clock.svg"  alt="">
                <div class="call-time-mail">
                    <h5>Working Hours</h5>
                    <h6>Mon - Sat (8:00am - 12:00am)</h6>
                </div></div>
            </div>

        </div>
    </div>


</nav>



<nav class="nav-2">
    <div class="nav1">
    <div class="hero flex items-center">
<div class="contaner22 flex">
	<div class="intro-left">
	
    <div class="welcome flex items-center">
        <span>Welcome to <span class="fruitzyy-small"> Fruitzy</span> </span>
       <!-- <img src="fruits-macro-wallpaper2.jpg" alt="" class="back-image"> -->
    </div>
    <h1>Order Your <span>Fruits </span> Now</h1>
    <p>A fruitzy is simply online market to order any fruit anytime </p>
    <div>
        <button class="btn btn-primary">Read More</button>
        <a href="FinalFruit.jsp"><button class="btn btn-secondary">Shop now</button></a>
    </div>
    </div>

<div class="straw-class">
    <div class="hero-image">
        <img src="Image/straw.png" alt="">
    </div>
    </div>
</div>
    </div>
</div>
</nav>


<!-- style="overflow: hidden; position: relative;" -->


<section class="top-products">
    
<div class="contaner22">

    <h2 class="section-heading">Top products</h2>
<div class="top-sym">
    <img src="icons/hr.svg"  alt="">
</div>
    
    <div class="slider">
        
        
        <span><img class="slider-btn prev-btn" src="icons/left-arrow2.svg" alt=""></span>
        <span><img class="slider-btn next-btn" src="icons/right-arrow2.svg" alt=""></span>
        
        
        <div class="food-slider">

	<%
	while (rs.next()){
		
%>            
                
            
            <div class="food-card">
                <div class="product-image flex items-center justify-center">
                    <img src="http://localhost:9898/ServletJSp/ImageDownloader?fruit-name=<%out.print(rs.getString("fruit_nameo"));%>" alt="">
                </div>
                <hr>
                <div>
                    <h2 class="text-center" value="f-name"><%out.print(rs.getString("fruit_nameo")); %></h2>
                    <!-- <h3>12pieces</h3> -->
                    <div class="stars">
                        <!-- stars-Images -->
                    </div>
                    <div class="price text-center flex justify-between">
                        <!-- <div class="price m-15">Rs  240</div> -->
                        <div class="weight m-15" name="f-weight"><%out.print(rs.getString("fruit_weighto")); %>/<%out.print(rs.getString("fruit_specifico")); %></div>
                    </div>
                    <div class="money-cart flex justify-center ml-15">
                        <div class="price" name="f-price"> <b>Rs <%out.print(rs.getString("fruit_priceo")); %></b></div>
                        
                        
                    <a href="Cart.jsp?f-name=<%out.print(rs.getString("fruit_nameo")); %>"  style="text-decoration: none;"><button class="btn-box flex">
                        <img src="icons/shopping-cart-solid.svg"  alt="">
                       <span style="font-size:16px;"> + Add</span>
                    </button></a>
                </div>
                </div>
            </div>

      <%} %>  
        
        
        
        </div>
    
</div>
    
<div class="text-center1 btn-wrapper justify-between">
     <a href="FinalFruit.jsp"> <button class="btn btn-secondary"> View More </button> </a>

</div>

</div>
</div>
</section>
<section class="about-meal">
    <div class="contaner22">


        <h2 class="section-heading">About Fresh Fruits</h2>
        
        <div class="top-sym2">
    		<img src="icons/hr.svg"  alt="">
		</div>
        <div class="about-meal-wrap flex">
            <div class="flex-1">
                 <img src="Image/Mango-Fresh.png" class="all-fruits" alt="">  

            </div>

            <div class="flex-1">
                <h2>Fresh Fruit always looks delicious and very healthy for body</h2>
                <p>
                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident tenetur officiis repellat accusamus necessitatibus unde ratione dolore dolorum velit, voluptas consequuntur enim. Maiores numquam ut iure voluptas, vero officia tenetur.
                </p>
                <button class="btn btn-secondary">Read More</button>
            </div>

        </div>
    
</section>

<section class="our-services">
    <div class="contaner22">
        <h2 class="section-heading">Our Services</h2>
<div class="top-sym3">
    <img src="icons/hr.svg"  alt="">
</div>
        <div class="card-wrapper flex">
            <div class="service-card">
                <img class="icon" src="icons/transport.svg" alt="">
                <h3>Free Home Delivery</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odio cum tempore et corporis voluptatibus adipisci </p>
                <button class="btn btn-secondary">Read More</button>
            </div>

            <div class="service-card">
                <img class="icon" src="icons/bag.svg" alt="">
                <h3 class="text-primary">12 Hours ReturnServices</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odio cum tempore et corporis voluptatibus adipisci </p>
                <button class="btn btn-primary">Read More</button>
            </div>

            <div class="service-card">
                <img class="icon" src="icons/usd.svg" alt="">
                <h3>Money Back Guaranted</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odio cum tempore et corporis voluptatibus adipisci </p>
                <button class="btn btn-secondary">Read More</button>
            </div>
        </div>
    </div>
</section>


<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="Home.js"></script>


</body>
</html>