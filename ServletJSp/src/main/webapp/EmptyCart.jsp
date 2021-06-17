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
    <link rel="stylesheet" href="cs.css">
    
</head>
<body>

 <section class="empty-cart py-16">
         <div class="container mx-auto text-center">
            <h1 class="text-3xl font-bold mb-2">Cart Empty</h1>
            <p class="text-gray-500 text-lg mb-12">You probably haven't ordered any Fruit yet. <br>
                To order a Fruit, go to the main page.</p>

                <img src="Image/empty-cart.png" class="w-2/5 mx-auto" alt="empty-cart">
                <a href="Home.jsp" class="inline-block px-6 py-2 rounded-full order-btn text-black-500 text-lg mt-12" style="background: orangered; font-weight: 500;">Order Now</a>
        </div>



    </section>

</body>
</html>