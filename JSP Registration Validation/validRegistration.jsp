
<%@ page language="java" import="java.lang.*,java.util.*,java.sql.*,java.sql.ResultSet" %>
<%
String path = request.getContextPath();
String basePath = "http://"+request.getServerName()+":"+request.getServerPort()+path+"/";

try {
	
	
	
	//Load the mysql driver
	Class.forName("org.gjt.mm.mysql.Driver");
		
	//The following sets up a string to make the connection
	String url="jdbc:mysql://127.0.0.1/servlet_db1";
		
	//Connect to the database
	Connection con = DriverManager.getConnection(url,"root","");
		
	//Create statement variable which we will use to send queries
	Statement stmt = con.createStatement();
	
	//Register the strings that will hold the data we pull from the database
	
	String 	user_id = "",
			title = "",
			fname = "",
			lname = "",
			street1 = "",
			street2 = "",
			street3 = "",
			city = "",
			province = "",
			country = "",
			postalcode = "",
			phone = "",
			email = "",
			password = "";
	
	//SELECT query (Only selects from the user_id that was passed from the previous form)

ResultSet rs = stmt.executeQuery("SELECT * from users");

	//Pull the data in from the database

while(rs.next()) {
	user_id = rs.getString("user_id");
	title = rs.getString("title");
	fname = rs.getString("fname");
	lname = rs.getString("lname");
	street1 = rs.getString("street1");
	street2 = rs.getString("street2");
	street3 = rs.getString("street3");
	city = rs.getString("city");
	province = rs.getString("province");
	country = rs.getString("country");
	postalcode = rs.getString("postalcode");
	phone = rs.getString("phone");
	email = rs.getString("email");
	password = rs.getString("password");
	
	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Registration Complete</title>
    <link rel="stylesheet" href="registration-styles.css" type="text/css" />
  </head>
		<body BGCOLOR="#FDF5E6">
	
		<H1>Registration Complete</H1>
	
		<p class="larger">Here are the details you submitted:.</p>
		<hr>
		
		<table border="1">
			<tr><td>User ID: <%=user_id %> </td></tr>
			<tr><td>Title: <%=title %></td></tr>
			<tr><td>Name: <%=fname + " " + lname%></td></tr>
			<tr><td>Address: <address><%=street1 + "<br />" + street2 + "<br />" + street3 %></address></td></tr>
			<tr><td>City: <%=city%></td></tr>
			<tr><td>Province: <%=province %> </td></tr>
			<tr><td>Country: <%=country %></td></tr>
			<tr><td>Postal Code: <%=postalcode%></td></tr>
			<tr><td>Phone: <%=phone%> </td></tr>
			<tr><td>Email: <%=email%></td></tr>
			<tr><td>Password: <%=password%></td></tr>
			</table>
			<br />
  
			<a href="http://127.0.0.1:8080/registration.jsp">Back To Form</a>
	
	</BODY>
</HTML>

		<%
		 	stmt.close();
			con.close();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
  
		%>
