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
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="HomeAddByAdmin.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>


<section class="login flex pt-24">

<div class="w-full container">
    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" action="HomeDataAdding" method="post">

        
        <label class="block text-gray-700 text-lg text-center font-bold mb-2"  for="message"> <h1>Add Fruits To Home Page</h1></label><br><br>
<div class="flex justify-between">
        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2"  for="username">Fruit Name</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" placeholder="Enter Fruit Name" name="fruit-nameo" type="text">
        </div>


        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2"  for="username">Fruit Price</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" type="text" placeholder="Only number allowed Ex: 200"  name="fruit-priceo">
        </div>
    



    <!-- <div class="flex justify-between"> -->
        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2"  for="username">Fruit Specific</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" placeholder="Enter Specific Of Fruit" type="text"  name="fruit-specifico">
        </div>
    </div>


    <div class="flex mt-8">
        <div class="mb-4">
            <div class="flex justify-between">
            <label class="block text-gray-700 text-sm font-bold mb-2"   for="email">Fruit Weight/Price</label>

        </div>

            <select class="long-type shadow border rounded w-full  px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" name="fruit-weighto">
                
                <option value="3 K.G.">12 PCS</option>
                <option value="4 K.G.">250Gm/Packet</option>
                <option value="5 K.G.">500Gm/Packet</option>
                <option value="1 K.G.">1 K.G.</option>
                <option value="1.5 K.G.">1.5 K.G.</option>
                <option value="2 K.G.">2 K.G.</option>
                <option value="2.5 K.G.">2.5 K.G.</option>
                <option value="3 K.G.">3 K.G.</option>
                <option value="4 K.G.">4 K.G.</option>
                <option value="5 K.G.">5 K.G.</option>
            </select>


        </div>
    <!-- </div> -->


    <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2 ml-28"  for="email">Upload Image</label>
        <input id="file" class="input-data focus:outline-none focus:shadow-outline" type="file"  name="fruit-imageo" accept="image/*">
        <label for="file" class="image-label">
            
        </label>
    </div></div>



        <div class="flex  mt-8 items-center justify-between">
            <button class="btn-primary center rounded-full text-white font-bold py-2 px-3 rounded" type="submit" value="upload"/>Submit</button>
        </div>
        

    </form>
    <p class="text-center text-gray-500 text-xs">
        
    </p>

</div>


<div>
    
    <div class="flex  mt-8 items-center justify-between">
        <a href="AddToServerByAdmin.jsp"><button class="btn-primary center w-40 rounded-full text-white font-bold py-2 px-3 rounded">Add To Server</button></a>
    </div>
    <div class="flex  mt-8 items-center justify-between">
        <a href="Home.jsp"><button class="btn-primary center w-40 rounded-full text-white font-bold py-2 px-3 rounded">Home Page</button></a>
    </div>
    <div class="flex  mt-8 items-center justify-between">
        <a href="AdminSideData.jsp"><button class="btn-primary center w-40 rounded-full text-white font-bold py-2 px-3 rounded">Order Page</button></a>
    </div>
</div>

</section>

<%
	
	Connection con = ExtraaThings.getList();
	
	try{
	PreparedStatement st = con.prepareStatement("select * from fruit_outlets");
	ResultSet rs= st.executeQuery();
	


	
	

	%>




<section class="top">
    <div class="headline">
        <h2 class="">All Orders</h2>
    </div>
    
    <div class="headings">
        
        <table border="0.1px" cellspacing="0">
    
            <tr>
                <th >Fruit</th>
                <th >Fruit Name</th>
                <th >Fruit Weight</th>
                <th >Fruit Price</th>
                <th >Fruit Specific</th>
                <th >Fruit Remove</th>
            </tr>
    
    <%
	while (rs.next()){
		


%>            
    
    
            <tr>
                <td style="width: 100px;"><img src="http://localhost:9898/ServletJSp/ImageDownloader?fruit-name=<%out.print(rs.getString("fruit_nameo"));%>" alt=""></td>
                <td align= center colspan=""><%out.print(rs.getString("fruit_nameo"));%></td>
                <td align= center colspan=""><%out.print(rs.getString("fruit_weighto"));%></td>
                <td align= center colspan=""><%out.print(rs.getString("fruit_priceo"));%> RS</td>
                <td align= center><%out.print(rs.getString("fruit_specifico"));%></td>
                <td align= center> <button> <a href="deleteData.jsp?home_data=<%out.print(rs.getString("fruit_nameo")); %>"> <i class="las la-trash-alt" style="font-size: 25px"></i></a></button></td>
            </tr>
    
    <% }}catch(Exception e){System.out.print(e);}
	%>    
        </table>
    
    
    </div>
    
    
    </section>





</body>
</html>