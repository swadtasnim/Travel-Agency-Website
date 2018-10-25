<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.ServletContext" %>
<%@page import="javax.servlet.ServletConfig" %>
<%@page import="javax.servlet.ServletException" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Package Page</title>
</head>
<body>
<form action="pack2" method="post">
<table>
<tr>
<td><b>UserID:</b></td>
<td><input type=text  name="username" value="<%= request.getAttribute("username") %>" >
</td>
</tr>
<tr>
<td><b>Starting Point City:</b></td>
<td><input type=text  name="city" value="<%= request.getAttribute("city") %>" >
</td>
</tr>
<tr>
<td><b>Phone No:</b></td>
<td><input type=text  name="phno" value="<%= request.getAttribute("phno") %>" >
</td>
</tr>
<tr>
<td><b>Your Destination:</b></td>
<td><input type=text  name="dest" value="<%= request.getAttribute("dest") %>" >
</td>
</tr>
<tr>
<td><b>Your Holiday Package:</b></td>
<td><input type=text  name="types" value="<%= request.getAttribute("types") %>" >
</td>
</tr>
<tr>
<td><b>Your Hotel Catagory:</b></td>
<td><input type=text  name="hotels" value="<%= request.getAttribute("hotels") %>" >
</td>
</tr>
<tr>
<td><b>Your Hotel Price:</b></td>
<td><input type=text  name="price" value="<%= request.getAttribute("price") %>" > BDT
</td>
</tr>
<tr>
<td><b>Your Ticket Booking Cost:</b></td>
<td><input type=text  name="book" value="<%= request.getAttribute("book") %>" > BDT
</td>
</tr>
<tr>
<td><b>No of Member:</b></td>
<td><input type=text  name="member" value="<%= request.getAttribute("member") %>" >
</td>
</tr>
<tr>
<td><b>Date to Start Journey:</b></td>
<td><input type=text  name="date" value="<%= request.getAttribute("date") %>" >
</td>
</tr>
<tr>
<td><b>Tour Guide Charge:</b></td>
<td><input type=text  name="guide" value="<%= request.getAttribute("guide") %>" > BDT
</td>
</tr>
<tr>
<td><b>Total Price:</b></td>
<td><input type=text  name="tprice" value="<%= request.getAttribute("tprice") %>" > BDT
</td>
</tr>
</table>

<table>
<tr>
<td><b>Choose Hotels:</b></td></tr>
<%
List<String> array =(List<String>)request.getAttribute("list"); 
if(!array.isEmpty()){
    for(int i = 0; i<array.size(); i++){
        %>
        <tr><td><input type=checkbox  name="llist" value="<%= array.get(i) %>" ><%= array.get(i)%></td></tr>
        
        
<%}%><br>
    <%}%> 
</table>
<input type="submit" value="Submit">
</form>

</body>
</html>