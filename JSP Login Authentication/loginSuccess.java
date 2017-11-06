import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginSuccess extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public loginSuccess() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.preventCaching(request, response);
		PrintWriter out = response.getWriter();
		
		//Get the session variables
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("userid");
		String sessionid=(String) session.getAttribute("sessionid");
		
		String email = "";
								
		//Connect to the database to get the email
		try {			
			//Load the mysql driver
			Class.forName("org.gjt.mm.mysql.Driver");
			
			//The following sets up a string to make the connection
			String url="jdbc:mysql://127.0.0.1/servlet_db1";
			
			//Connect to the database
			Connection con = DriverManager.getConnection(url,"root","");
			
			//Create statement variable which we will use to send queries
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE user_id='" + userid + "'");
			   
			while(rs.next()) {
				email = rs.getString("email");
			} 			                      
			          
			stmt.close();
			con.close();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
				
		String title = "Login Success";
	    String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n";

	    out.println(docType + "<HTML>\n" + 
	      "<HEAD><TITLE>" + title + "</TITLE>" + 
	      "<link rel=\"stylesheet\" href=\"http://127.0.0.1:8080/servlets-examples/registration-styles.css\" type=\"text/css\" />" + 
	      "</HEAD>\n" + 
	      "<BODY BGCOLOR=\"#FDF5E6\">\n");
	    out.println("<H1>" + title + "</H1>\n");

	    out.println("<p class=\"larger\">Your login criteria has been accepted. Partytime!</p><hr>");
	    
	    //Display userid, email and session id
	    
	    out.println("<h3>User ID: " + userid + "</h3>");
	    out.println("<h3>Email: " + email + "</h3>");
	    out.println("<h3>Session ID: " + sessionid + "</h3>");
	    
	    out.println("\t</body>");
	    out.println("</html>");
	    out.flush();
	    out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.preventCaching(request, response);
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<html>");
		out.println("  <head>");
		out.println("    <title>A Servlet in POST</title>");
		out.println("  </head>");
		out.println("  <body>");
		out.print("    This is <b>");
		out.print(this.getClass().getName());
		out.println("</b>, using the <b>POST</b> method <br>");
		out.println("  </body>");
		out.println("</html>");
		out.flush();
		out.close();
	}

	/**
	 * Initilaisation of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	/**
	 * Prevents navigator from caching data. 
	 *
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 */
	protected void preventCaching(HttpServletRequest request,
			HttpServletResponse response) {
		// see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
		String protocol = request.getProtocol();
		if ("HTTP/1.0".equalsIgnoreCase(protocol)) {
			response.setHeader("Pragma", "no-cache");
		} else if ("HTTP/1.1".equalsIgnoreCase(protocol)) {
			response.setHeader("Cache-Control", "no-cache"); // "no-store" work also 
		}
		response.setDateHeader("Expires", 0);
	}

}
