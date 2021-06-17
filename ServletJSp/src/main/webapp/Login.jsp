<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link rel="stylesheet" href="Login.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    
<title>Insert title here</title>
</head>
<body>



<section class="login flex justify-center pt-24">

<div class="box-card">
    <form class="form-style" action="GetAddrsEmailPhone.jsp" method="post">
        <div class="user-box">
            <label class="user-label"  for="username">Phone No</label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-light 
            focus:outline-none focus:shadow-outline" name="mobile-no" placeholder="Username">
        </div>

        <div class="mb-6">
            <label for="password" class="block text-gray-700 text-sm font-bold mb-2" >Password</label>
            <input class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 mb-2" name="pass" placeholder="***********">
            <p class="text-red-500 text-xs italic">Please Choose a password.</p>
        </div>

        <div class="flex items-center justify-between">
            <button class="btn-primary rounded-full">Log In</button>
            <a href="" class="inline-block align-baseline font-bold text-sm text-blue-500">Forgot Password?</a>
        </div>

    </form>
    <p class="text-center text-gray-500 text-xs">
        
    </p>

</div>

</section>




</body>
</html>