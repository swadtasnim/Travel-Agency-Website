

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pack2
 */
@WebServlet("/pack2")
public class pack2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private Connection conn;
	private PreparedStatement ps,ps2;
	public void init() throws ServletException
	{
	ServletContext sc=super.getServletContext();
	conn=(Connection)sc.getAttribute("myconn");
	try
	{
	//ServletConfig cfg=super.getServletConfig();
	//String qry=cfg.getInitParameter("qry");
	ps=conn.prepareStatement("Insert into app values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	//ps=conn.prepareStatement("Select * from hotels where city=?");
	
	}
	catch(SQLException sq)
	{
		System.out.println("Sql Error:"+sq);
		throw new ServletException("Sql Error:"+sq);
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		String username=(String)request.getParameter("username");
		String city=(String)request.getParameter("city");
		String phno=(String)request.getParameter("phno");
		String dest=(String)request.getParameter("dest");
		String types=(String)request.getParameter("types");
		String hotels=(String)request.getParameter("hotels");
		
		String book=(String)request.getParameter("book");
		String date=(String)request.getParameter("date");
		String member=(String)request.getParameter("member");
		String guide=(String)request.getParameter("guide");
		String price=(String)request.getParameter("price");
		String tprice=(String)request.getParameter("tprice");
		
			try
			{
			ps.setInt(1,Integer.parseInt(username));
			ps.setString(2,city);
			
			ps.setInt(3,Integer.parseInt(phno));
			ps.setString(4,dest);
			ps.setString(5,types);
			ps.setString(6,hotels);
			ps.setString(7,book);
			ps.setString(8,date);
			ps.setString(9,member);
			ps.setString(10,guide);
			ps.setString(11,price);
			ps.setString(12,tprice);
			
			String a[]=request.getParameterValues("llist");
			String llist="";
			for(int i=0; i<a.length; i++)
			{
				llist+=a[i]+"  ";
			}
			
			ps.setString(13,llist);
			int result=ps.executeUpdate();
			if(result==1)
			{
				pw.println("<b>Your Application for Package Has been submitted!</b><br>");
				pw.println("You will get the confirmation message soon!!</a>");
			}
			else
			{
				pw.println("<b>Your registration could not be done</b>");
				pw.println("<br><a href='pack.jsp'>Please try again </a>");
			}
			}
			catch(SQLException sq)
			{
				System.out.println("Sql Error:"+sq);
				throw new ServletException("Sql Error:"+sq);
			}	
		/*
		pw.println("<b>UserID</b>"+ " : "+username+"<br>");
		pw.println("<b>City</b>"+ " : "+city+"<br>");
		pw.println("<b>Phone</b>"+ " : "+phno+"<br>");
		pw.println("<b>Your Destination</b>"+ " : "+dest+"<br>");
		pw.println("<b>Your Holiday Package</b>"+ " : "+types+"<br>");
		pw.println("<b>Hotel Catagory</b>"+ " : "+hotels+"<br>");
		pw.println("<b>Booking Ticket Price</b>"+ " : "+book+" BDT"+"<br>");
		pw.println("<b>No. of Member</b>"+ " : "+member+"<br>");
		
		pw.println("<b>Tour Guide Charge</b>"+ " : "+guide+"<br>");
		
		pw.println("<b>Hotel Rate</b>"+ " : "+price+" BDT"+"<br>");
		//int p=Integer.parseInt(guide)+Integer.parseInt(member)*Integer.parseInt(book)+rs.getInt(3);
		pw.println("<b>Total Price</b>"+ " : "+tprice+" BDT"+"<br>");
		*/
		
	}

}
