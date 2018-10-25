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
<title>Notification</title>
</head>
<body>
<center>
<br><br><br>
<table border="2">
<%
try
{
   String i=(String)request.getSession().getAttribute("Id");
	String query="select * from message where userid=?";
	ServletContext sc=super.getServletContext();
	Connection conn=(Connection)sc.getAttribute("myconn");
    PreparedStatement ps=conn.prepareStatement(query);
    ps.setInt(1,Integer.parseInt(i));
	ResultSet rs=ps.executeQuery();

	
	if (!rs.next() ) {
		%>
	    <tr>
<td><b>You have no new notification</b></td>
</tr>
	    <% 
	} else {

	    do {%>
	    
<tr>
<td><b>Subject: </b></td>
<td><a href="read_msg.jsp?Id=<%=rs.getString(2)%>" ><%= rs.getString(2) %></a></td>
</tr>	    
	     <% 
	    } while (rs.next());
	}

 


}
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