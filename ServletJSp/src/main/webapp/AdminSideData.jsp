<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.dao.AddDataDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Admin.css">
    <title>Document</title>
</head>
<body>

<section class="top">
<div class="headline">
    <h2 class="">All Orders</h2>
</div>

<div class="headings">
    
    <table border="0.1px" cellspacing="0">

        <tr>
            <th>Orders id</th>
            <th>Order List</th>
            <th>Address</th>
            <th >Name</th>
            <th >Contact</th>
            <th >Status</th>
            <th >Time</th>
        </tr>

<% 
	Connection con = null;

	con = AddDataDao.getConnection();
	
	
try{

	PreparedStatement st = con.prepareStatement("select * from get_orders");
	ResultSet rs = st.executeQuery();
	
	while(rs.next()){
		
%>

	
        <tr>
            <td width="150" ><%
            try{String order_total = rs.getString("order_id");
            		String orderDivisionTotal[] = order_total.split("&");
            
            		for(int i=0;i<orderDivisionTotal.length;i++){out.println(orderDivisionTotal[i]);
            		%> <br><%}} catch(Exception e){System.out.print(e);}
            		
            
            %></td>
            <td width="340" ><%String ss = rs.getString("order_items");
	String ss2[] = ss.split("}");
	
	for(int i=0;i<ss2.length;i++){out.println(ss2[i]);%> <br><% }
	
	%></td>
            <td width="140" ><%out.print(rs.getString("user_address"));%></td>
            <td width="80"><%out.print(rs.getString("user_name")); %></td>
            <td width="80" style="text-decoration: none;"><%out.print(rs.getString("mobile_no")); %></td>
            <td width="90" ><%out.print(rs.getString("order_status")); %></td>
            <td width="120" ><%String ssTime = rs.getString("order_time");
	String ss3[] = ssTime.split("&");
	
	for(int i=0;i<ss3.length;i++){out.println(ss3[i]);%> <br><% }
	
	%></td>
        </tr>

<%

	}
	
}
catch(Exception e){
	out.print(e);
	out.print("Something went wrong");
	
}

%>

    </table>


</div>


</section>


</body>
</html>