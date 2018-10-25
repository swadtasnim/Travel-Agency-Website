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
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application</title>
</head>
<body>
<center>
<table>
<% PrintWriter pw =response.getWriter(); 
  int userid=Integer.parseInt(request.getParameter("Id"));
  try
	{String query="select * from app where userid=?";
	ServletContext sc=super.getServletContext();
	Connection conn=(Connection)sc.getAttribute("myconn");
  PreparedStatement stmt=conn.prepareStatement(query);
  stmt.setInt(1,userid);
	ResultSet rs=stmt.executeQuery();
	
	if(rs.next())
	{
%>		
<tr>
<td><b>UserID: </b></td>
<td><%=rs.getInt(1) %></td>
</tr>
<tr>
<td><b>Starting Point City: </b></td>
<td><%=rs.getString(2) %></td>
</tr>
<tr>
<td><b>User Phone No:</b></td>
<td><%=rs.getInt(3) %></td>
</tr>
<tr>
<td><b>User Destination:</b></td>
<td><%=rs.getString(4) %></td>
</tr>
<tr>
<td><b>Package Type:</b></td>
<td><%=rs.getString(5) %></td>
</tr>
<tr>
<td><b>Hotel Catagory:</b></td>
<td><%=rs.getString(6) %></td>
</tr>
<tr>
<td><b>Ticket Booking Charge:</b></td>
<td> <%=rs.getString(7) %> By <% if(rs.getInt(7)==1000){%>Bus<%} else{ %> Plane<%} %></td>
</tr>
<tr>
<td><b>Date to Start:</b></td>
<td><%=rs.getString(8) %></td>
</tr>
<tr>
<td><b>No of Member:</b></td>
<td><%=rs.getString(9) %></td>
</tr>
<tr>
<td><b>Tour Guide Charge:</b></td>
<td><%=rs.getString(10) %></td>
</tr>
<tr>
<td><b>Hotel Charge:</b></td>
<td><%=rs.getString(11) %></td>
</tr>
<tr>
<td><b>Total Price:</b></td>
<td><%=rs.getString(12) %></td>
</tr>
<tr>
<td><b>Choosen Hotels:</b></td>
<td><%=rs.getString(13) %></td>
</tr>
<%		
	}
	
	}
  catch(SQLException sq)
  {
  	System.out.println("Sql Error:"+sq);
  	throw new ServletException("Sql Error:"+sq);
  }
%>
</table>
<a href="admin_not.jsp">Go Back</a>
<br><br>
Sent Confirmation Message<br>
<form action="Message.jsp" method="post">
<select name="msg">
<option value="Payment">Payment Confirm</option>
<option value="Booking">Booking Confirm</option>
<option value="Customised">Customised</option>
</select>
<input type="hidden" name="userid"  value=<%= userid %>>
<input type="submit" value="Sent"> 
</form>
</center>
</body>
</html>