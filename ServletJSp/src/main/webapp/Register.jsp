<%@page import="com.logins.store.FruitItems" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="Register.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>


<section class="login flex justify-center pt-24">

<div class="w-full container">
    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" action="GetAddrsEmailPhone.jsp" method="post">

        
        <label class="block text-gray-700 text-lg font-bold mb-2"  for="message">Register and Get Verified With US First</label><br><br>
<div class="flex justify-between">
        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Name</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" type="text" name="customer-name" placeholder="Enter Your Name">
        </div>


        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2"   for="address">Area</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" type="text" name="area" placeholder="Area or Street Name">
        </div>
    </div>



    <div class="flex justify-between">
        <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2"  for="phone number">Phone</label>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" type="text" name="mobile-no" placeholder="Enter Your 10 digit Number">
        </div>


        <div class="mb-4">
            <div class="flex justify-between">
            <label class="block text-gray-700 text-sm font-bold mb-2"   for="password">Password</label>
            <label class="block text-gray-400 text-sm font-bold mb-2 mr-4" >(5-8 Characters)</label>
        </div>
            <input class="long-type shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" type="password" name="pass" placeholder="Enter Your Password">
        </div>
    </div>


    <div class="mb-4">
        <div class="flex justify-between">
        <label class="block text-gray-700 text-sm font-bold mb-2"  for="address">Address</label>
        <label class="block text-gray-400 text-sm font-bold mb-2"  for="email">Max. 100 Characters</label>
    </div>
        <input class="long-input shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
        focus:outline-none focus:shadow-outline" type="text" name="confirm-address" placeholder="Enter Your Proper Address">
    </div>



        <div class="flex items-center justify-between">
            <button class="btn-primary center rounded-full text-white  font-bold py-2 px-3 rounded">Submit</button>
        </div>

    </form>
    <p class="text-center text-gray-500 text-xs">
        
    </p>

</div>

</section>




</body>
</html>