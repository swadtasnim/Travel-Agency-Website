

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet1
 */
@WebServlet("/RegistrationServlet1")
public class RegistrationServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection conn;
	private PreparedStatement ps;
	public void init() throws ServletException
	{
		ServletContext sc=super.getServletContext();
		conn=(Connection)sc.getAttribute("myconn");
		try
		{
		ServletConfig cfg=super.getServletConfig();
		String qry=cfg.getInitParameter("qry");
		ps=conn.prepareStatement(qry);
		}
		catch(SQLException sq)
		{
			System.out.println("Sql Error:"+sq);
			throw new ServletException("Sql Error:"+sq);
		}
//	String driver=(String)sc.getAttribute("driver");
//	System.out.println(driver);
//	String url=(String)sc.getAttribute("url");
//	String user=(String)sc.getAttribute("user");
//	String pwd=(String)sc.getAttribute("pwd");
//	conn=(Connection)sc.getAttribute("myconn");
//		try
//		{
//			Class.forName(driver);
//		}
//		catch(ClassNotFoundException cnf)
//		{
//		System.out.println("Cannot load the driver class");
//		return;
//		}
//		try
//		{
//		conn=DriverManager.getConnection(url,user,pwd);	
//		ServletConfig cfg=super.getServletConfig();
//		String qry=cfg.getInitParameter("qry");
//		ps=conn.prepareStatement(qry);
//		}
//		catch(SQLException sq)
//		{
//			System.out.println("Cannot open connection");
//		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String username=request.getParameter("username");
		String pwd=request.getParameter("userpwd");
		String city=request.getParameter("usercity");
		String phno=request.getParameter("userphno");
			try
			{
			ps.setInt(1,Integer.parseInt(username));
			ps.setString(2,pwd);
			ps.setString(3,city);
			ps.setInt(4,Integer.parseInt(phno));
			int result=ps.executeUpdate();
			if(result==1)
			{
				pw.println("<b>Thank u for registration</b>");
				pw.println("<br><a href='home.html'>Please login yourself </a>");
			}
			else
			{
				pw.println("<b>Your registration could not be done</b>");
				pw.println("<br><a href='register.html'>Please try again </a>");
			}
			}
			catch(SQLException sq)
			{
				System.out.println("Sql Error:"+sq);
				throw new ServletException("Sql Error:"+sq);
			}	
			
		pw.close();
	}

}
