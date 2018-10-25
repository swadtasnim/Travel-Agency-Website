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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read Message Page</title>
</head>
<body>
<center>
<table>
<% 
try
{
   String i=(String)request.getSession().getAttribute("Id");
	String query="select * from message where userid=? and subject=?";
	ServletContext sc=super.getServletContext();
	Connection conn=(Connection)sc.getAttribute("myconn");
    PreparedStatement ps=conn.prepareStatement(query);
    ps.setInt(1,Integer.parseInt(i));
    ps.setString(2,request.getParameter("Id") );
	ResultSet rs=ps.executeQuery();
   
	if(rs.next())
	{
		%>

<b>Subject:</b>

<%= rs.getString(2) %>

<br><br>

<%= rs.getString(3) %>

		
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
<br><br>
<a href="client_not.jsp">Go back</a>
</body>
</center>
</html>