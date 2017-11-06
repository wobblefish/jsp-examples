import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class checkLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public checkLogin() {
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
		
		//Set the user_id variable
		int user_id=0;
		
		String sessionid = null;
		String userid = null;
		
		//Set Flag Variables
		int errors = 0,
			emailBlank = 0,
			emailFormat = 0, 
			passBlank = 0;
		
		//Pull values from previous form
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		
		//Flag errors if 
		if (password == "") { errors++; passBlank = 1;}
		if (email == "") { errors++; emailBlank = 1;}
		
		String emailPattern="^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})";
		
		if (emailBlank == 0) 
		{
			if (email.matches(emailPattern) == false)
			{
				errors++; emailFormat = 1;
			}
							
		}
		
		
		if (errors > 0)
	{
		
		String title = "Check Login";
	      String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n";

	      out.println(docType + "<HTML>\n" + 
	        "<HEAD><TITLE>" + title + "</TITLE>" + 
	        "<link rel=\"stylesheet\" href=\"http://127.0.0.1:8080/servlets-examples/registration-styles.css\" type=\"text/css\" />" + 
	        "</HEAD>\n" + 
	        "<BODY BGCOLOR=\"#FDF5E6\">\n");
	      out.println("<H1>" + title + "</H1>\n");

	      out.println("<p class=\"larger\">Please verify user information and click submit.</p><hr>");

	      out.println("<fieldset>");
	      out.println("<legend><b>Login Here:</b></legend>");

	      out.println("<form action=\"http://127.0.0.1:8080/servlets-examples/servlet/checkLogin\" method=\"POST\">");

	      out.println("E-Mail: <input type=\"text\" name=\"email\" size=\"38\" value=\"" + email + "\" /><br />");

	      out.println("Password: <input type=\"text\" name=\"password\" size=\"38\" value=\"" + password + "\" /><br />");
	      
	      out.println("<input type=\"submit\" name=\"submit\" value=\"Submit\" />");
	      out.println("</form>");

	      out.println("</fieldset>");

	      out.println("\t</body>");
	      out.println("</html>");
		
	}	else {
			
		
		try {			
			//Load the mysql driver
			Class.forName("org.gjt.mm.mysql.Driver");
			
			//The following sets up a string to make the connection
			String url="jdbc:mysql://127.0.0.1/servlet_db1";
			
			//Connect to the database
			Connection con = DriverManager.getConnection(url,"root","");
			
			//Create statement variable which we will use to send queries
			Statement stmt = con.createStatement();
			
			//stmt.execute("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
			ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
			   
			while(rs.next()) {
			         user_id = rs.getInt("user_id");
			} 			                      
			          
			stmt.close();
			con.close();
					
				
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		
			
		
		if (user_id > 0)  
        {             
			
				//Set the session variable to a cookie
			sessionid = generateSessionId();
			Cookie c = new Cookie("sessionid", sessionid);
			c.setMaxAge(60);
			response.addCookie(c);
			out.println("Session cookie created, your current session is " + sessionid);
				
				//Set the userid into a cookie
			Cookie c2 = new Cookie("userid", Integer.toString(user_id));
			c2.setMaxAge(60);
			response.addCookie(c2);
			out.println("UserID cookie created, your current session is " + userid);
			
			HttpSession session = request.getSession();
			session.setAttribute("userid",Integer.toString(user_id));
			session.setAttribute("sessionid",sessionid);
			
				//Redirect to successful login
	  			response.sendRedirect("http://127.0.0.1:8080/servlets-examples/servlet/loginSuccess");				
        }  
        else  //If remains at zero, redirect back to login page
        {
			
        	response.sendRedirect("http://127.0.0.1:8080/servlets-examples/servlet/login");				
        }      
		
	}
	
		      out.flush();
		      out.close();
		      
		      
		}
	
	private String generateSessionId() throws UnsupportedEncodingException {
		String uid = new java.rmi.server.UID().toString();
		return java.net.URLEncoder.encode(uid, "UTF-8");
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
