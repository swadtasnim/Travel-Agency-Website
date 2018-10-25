

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pack
 */
@WebServlet("/pack")
public class pack extends HttpServlet {
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
	ServletConfig cfg=super.getServletConfig();
	String qry=cfg.getInitParameter("qry");
	ps=conn.prepareStatement(qry);
	ps2=conn.prepareStatement("select * from hotels where city=?");
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
		String username=request.getParameter("username");
		String city=request.getParameter("usercity");
		String phno=request.getParameter("userphno");
		String dest=request.getParameter("dest");
		System.out.println(dest);
		String types=request.getParameter("types");
		String hotels=request.getParameter("hotels");
		
		String book=request.getParameter("book");
		String date=request.getParameter("date");
		String member=request.getParameter("member");
		String guide=request.getParameter("guide");
		if(username.equals("") || city.equals("")|| phno.equals("")|| member.equals(""))
			pw.println("<b>Cannot leave any field blank");
		else
		{
			try
			{
			ps.setString(1,types);
			ps.setString(2,hotels);
			ps2.setString(1, dest);
			ResultSet rs=ps.executeQuery();
			ResultSet rs2=ps2.executeQuery();
			List<String> list = new ArrayList<String>();
			
			while(rs2.next())
			{
				list.add(rs2.getString(2));
			}
			if(rs.next())
			{
				/*pw.println("<b>UserID</b>"+ " : "+username+"<br>");
				pw.println("<b>City</b>"+ " : "+city+"<br>");
				pw.println("<b>Phone</b>"+ " : "+phno+"<br>");
				pw.println("<b>Your Destination</b>"+ " : "+dest+"<br>");
				pw.println("<b>Your Holiday Package</b>"+ " : "+types+"<br>");
				pw.println("<b>Hotel Catagory</b>"+ " : "+hotels+"<br>");
				pw.println("<b>Booking Ticket Price</b>"+ " : "+book+" BDT"+"<br>");
				pw.println("<b>No. of Member</b>"+ " : "+member+"<br>");
				
				pw.println("<b>Tour Guide Charge</b>"+ " : "+guide+"<br>");
				
				pw.println("<b>Hotel Rate</b>"+ " : "+rs.getString(3)+" BDT"+"<br>");
				int p=Integer.parseInt(guide)+Integer.parseInt(member)*Integer.parseInt(book)+rs.getInt(3);
				pw.println("<b>Total Price</b>"+ " : "+p+" BDT"+"<br>");
				*/
				request.setAttribute("username",username);
				request.setAttribute("city",city);
				request.setAttribute("phno",phno);
				request.setAttribute("dest",dest);
				request.setAttribute("types",types);
				request.setAttribute("hotels",hotels);
				request.setAttribute("book",book);
				request.setAttribute("date",date);
				request.setAttribute("member",member);
				request.setAttribute("guide",guide);
				request.setAttribute("price",rs.getString(3));
				request.setAttribute("list",list);
				int p=Integer.parseInt(guide)+Integer.parseInt(member)*Integer.parseInt(book)+rs.getInt(3);
				request.setAttribute("tprice",Integer.toString(p));
				RequestDispatcher rd = request.getRequestDispatcher("pack2.jsp");
				rd.forward(request,response);
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
