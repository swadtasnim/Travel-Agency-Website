import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyDbListenerClass implements ServletContextListener{
	private Connection conn;
	@Override
	public void contextInitialized(ServletContextEvent e) {
		ServletContext sc=e.getServletContext();
		String driverclass=sc.getInitParameter("driverclass");
		String dsn=sc.getInitParameter("dsn");
		String user=sc.getInitParameter("dbuser");
		String pass=sc.getInitParameter("dbpass");
		sc.setAttribute("driver",driverclass);
		sc.setAttribute("url",dsn);
		sc.setAttribute("user",user);
		sc.setAttribute("pwd",pass);
		try
		{
			Class.forName(driverclass);
		}
		catch(ClassNotFoundException cnf)
		{
		System.out.println("Cannot load the driver class");
		return;
		}
		try
		{
		conn=DriverManager.getConnection(dsn,user,pass);	
		sc.setAttribute("myconn",conn);
		}
		catch(SQLException sq)
		{
			System.out.println("Cannot open connection");
		}
		
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		try
		{
			conn.close();
		}
		catch(SQLException sq)
		{
			System.out.println("Error closing connection");
		
		}
		
	}

	

}
