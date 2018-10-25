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
<title>Notifications</title>
</head>
<body>
<center>
<br><br><br><br>
<table border="2">
<tr>
<td>userID</td>
<td>Destination</td>
<td>Package Type</td>
<td>Date</td>
</tr>

<%
try
{

	String query="select * from app";
	ServletContext sc=super.getServletContext();
	Connection conn=(Connection)sc.getAttribute("myconn");
    PreparedStatement stmt=conn.prepareStatement(query);
	ResultSet rs=stmt.executeQuery();



while(rs.next()){
%>
<tr>
<td><a href="app_profile.jsp?Id=<%=rs.getInt(1)%>" ><%= rs.getInt(1) %></a></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(8) %></td>
</tr>
<%} 
%>

<%  }
catch(SQLException sq)
{
	System.out.println("Sql Error:"+sq);
	throw new ServletException("Sql Error:"+sq);
}

%>

</table>
</center>
</body>
</html>