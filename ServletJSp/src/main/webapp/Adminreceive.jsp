<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.logins.store.ExtraaThings"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logins.dao.AddDataDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String mobile_no = request.getParameter("phone_no");
String destination = request.getParameter("destination_address");
String user_name = (String) session.getAttribute("user_name");
int total_amount = (Integer) session.getAttribute("final_total");

Connection con = ExtraaThings.getList();

String d = LocalDate.now().toString();
String t = LocalTime.now().toString();

String dt = d + " & " + t;
Collection<String> values = new ArrayList();

String original ="";
int lengt = mobile_no.length();

for(int i = lengt-1;i>=0;i--){
original = original + mobile_no.charAt(i);
}

session.setAttribute("reverse_mno", original);

String final_orderId_withTotal = original + "& Total Amount : " + total_amount + " Rs ";

String str1 = " ";
String order_id = "ORD" + final_orderId_withTotal; 
try{
	int order_no = 1;
	PreparedStatement st = con.prepareStatement("select * from ordered_fruits where mobile_no=" + mobile_no);
	ResultSet rs = st.executeQuery();

	
	while(rs.next()){
		
	String fruit_name = rs.getString("fruit_name");
	String fruit_weight = rs.getString("fruit_weight");
	String fruit_specific = rs.getString("fruit_specific");
	String fruit_price = rs.getString("fruit_price");

	
	String str =   order_no + "    [" + fruit_name + " - " + fruit_weight + " - " + fruit_specific + " - " + "Rs  " +fruit_price + "] }    " ;   
	
	
	values.add(str);
	order_no++;
	
	 	
	}

		Iterator it = values.iterator();
		while(it.hasNext())
				{
		
		str1 = str1 + it.next();
	}


	try{
		
		Connection con2 = AddDataDao.getConnection(); 
		
		PreparedStatement st1 = con2.prepareStatement("insert into get_orders (mobile_no, order_id, order_items, user_address, user_name, order_status, order_time) values (?,?,?,?,?,?,?)");
		st1.setString(1, mobile_no);
		st1.setString(2, order_id);
		st1.setString(3, str1);
		st1.setString(4, destination);
		st1.setString(5, user_name);
		st1.setString(6, "order-placed");
		st1.setString(7, dt);
		

		
		int n = st1.executeUpdate();
		if(n>0){response.sendRedirect("ThankYou.jsp");}
		
	}
	catch(Exception e){
		out.print(e);
		System.out.print("Error in second try");
	}
	
	
	
	
	
	
	
}
catch(Exception e){
	System.out.println(e);
	System.out.println("Error during adding data into admin portal");
	
}
%>



</body>
</html>