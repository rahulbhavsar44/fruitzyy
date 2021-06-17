<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="com.logins.store.FruitItems"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" type ="text/css" href="Fruit.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>

<div>
<%
FruitItems fss  = (FruitItems)request.getAttribute("fruit_list1");
ExtraaThings ets = new ExtraaThings();
Connection con = ExtraaThings.getList();

PreparedStatement st = con.prepareStatement("select * from fruit_items");
ResultSet rs = st.executeQuery();

while(rs.next()) {
	
	
	
%>


    <img src="http://localhost:9898/ServletJSp/ImageDownloader?fruit-name=<%out.println(rs.getString("fruit_name")); %>" style="width: 100px; height:100px" class="image" alt="">
    <div class="text-center">
        <h2 class="product-text" name=""><%out.println(rs.getString("fruit_name")); %></h2>
        <span class="size-text" name=""><%out.println(rs.getString("fruit_price"));%></span>
        <div class="money-addbtn">
            <span  name="df"><%out.println(rs.getNString("fruit_specific")); %></span>
            <button class="add-to-cart">
                <span>+</span>
                <span class="add-text">Add</span>
            </button>
        </div>
    </div>
</div>

<%

}
 %>


</body>
</html>