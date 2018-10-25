

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet1
 */
@WebServlet("/LoginServlet1")
public class LoginServlet1 extends HttpServlet {
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
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String username=request.getParameter("username");
		String pwd=request.getParameter("userpwd");
		if(username.equals("") || pwd.equals(""))
			pw.println("<b>Cannot leave username or password blank");
		else
		{
			try
			{
			ps.setInt(1,Integer.parseInt(username));
			ps.setString(2,pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				request.getSession().setAttribute("Id", username);
				pw.println("<b>Welcome back</b>");
				pw.println("<br><a href='pack.jsp'>Get an Exciting Holidys with packages!!!</a>");
				pw.println("<br><a href='client_not.jsp'>Notification</a>");
			}
			else
			{
				pw.println("<b>You are not registered</b>");
				pw.println("<br><a href='home.html'>Try again</a>");
			}
			}
			catch(SQLException sq)
			{
				System.out.println("Sql Error:"+sq);
				throw new ServletException("Sql Error:"+sq);
			}	
			}
		pw.close();
	}

}
