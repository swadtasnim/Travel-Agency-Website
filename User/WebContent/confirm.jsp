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
<title>Confirmation</title>
</head>
<body>
<% PrintWriter pw =response.getWriter(); 
  

 
 try
 {
	 String query="Insert into message values(?,?,?)";
		ServletContext sc=super.getServletContext();
		Connection conn=(Connection)sc.getAttribute("myconn");
	  PreparedStatement ps=conn.prepareStatement(query);
	  
	  int userid=Integer.parseInt(request.getParameter("userid"));
	  String subject=request.getParameter("subject");
	  String text=request.getParameter("text");
	  
	  ps.setInt(1,userid);
		ps.setString(2,subject);
		ps.setString(3,text);
		
		int result=ps.executeUpdate();
		if(result==1)
		{
			pw.println("<b>Successfully Sent to "+userid+"</b>");
			pw.println("<br><a href='admin_not.jsp'>Goto Notification </a>");
		}
		else
		{
			pw.println("<b>Your registration could not be done</b>");
			pw.println("<br><a href='admin_not.html'>Please try again </a>");
		}
 }
 
 catch(SQLException sq)
	{
		System.out.println("Sql Error:"+sq);
		throw new ServletException("Sql Error:"+sq);
	}
%>

</body>
</html>