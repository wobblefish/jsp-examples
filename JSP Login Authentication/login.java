import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login() {
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

		
		
		//Set the user_id and session_id variable
				
		String sessionid = null;
		String userid = null;
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				
				//Check if a sessionid cookie exists and take the value into sessionid variable
				if (cookies[i].getName().equals("sessionid")) {
					sessionid = cookies[i].getValue();
				}
				
				//Check if a userid cookie exists and take the value into userid variable
				if (cookies[i].getName().equals("userid")) {
					userid = cookies[i].getValue();
				}
				
			}
		}
		
		if (sessionid == null || userid == null)
		{
				
		
		String title = "Login";
		String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
			"Transitional//EN\">\n";
		
		out.println(docType + "<HTML>\n" +
				"<HEAD><TITLE>" + title + "</TITLE>" + 
				"<link rel=\"stylesheet\" href=\"http://127.0.0.1:8080/servlets-examples/registration-styles.css\" type=\"text/css\" />" + 
				"</HEAD>\n" +					
				"<BODY BGCOLOR=\"#FDF5E6\">\n");
		out.println("<H1>" + title + "</H1>\n");
				
				
		out.println("<p class=\"larger\">Please enter all fields and click submit.</p>" + "<hr>");
				
		out.println("<form action=\"http://127.0.0.1:8080/servlets-examples/servlet/checkLogin\" method=\"POST\">");
		out.println("<fieldset>");
		out.println("<legend><b>Login Here:</b></legend>");
		
		out.println("E-Mail :	<input type=\"text\" name=\"email\" value=\"\" /><br />"); 
		out.println("Password :	<input type=\"text\" name=\"password\" value=\"\" /><br />"); 
		
		out.println("<input type=\"submit\" name=\"submit\" value=\"Submit\" />");
		out.println("</form>");
		out.println("</fieldset>");
		
		out.println("  </body>");
		out.println("</html>");
		}
		else
		{
			response.sendRedirect("http://127.0.0.1:8080/servlets-examples/servlet/loginSuccess");
		}
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
