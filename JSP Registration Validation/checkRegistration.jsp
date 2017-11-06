
<%@ page language="java" import="java.lang.*,java.util.*,java.sql.*,java.sql.ResultSet" %>
<%
String path = request.getContextPath();
String basePath = "http://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//Setup the error flags

	int errors = 0;
	int titleBlank = 0;
	int fNameBlank = 0;
	int lNameBlank = 0;
	int street1Blank = 0;
	int cityBlank = 0;
	int provinceBlank = 0;
	int countryBlank = 0;
	int postalBlank = 0;
	int phoneBlank = 0;
	int emailBlank = 0;
	int emailFormat = 0;
	int passwordBlank = 0;
	int passwordLength = 0;

//Setup string variables to retreive the entered form values

	String title = request.getParameter("dd_title");
	String fName = request.getParameter("fname");
	String lName = request.getParameter("lname");
	String street1 = request.getParameter("street1");
	String street2 = request.getParameter("street2");
	String street3 = request.getParameter("street3");
	String city = request.getParameter("city");
	String province = request.getParameter("dd_province");
	String country = request.getParameter("dd_countries");
	String postal = request.getParameter("postalcode");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	/*Conditions for error flagging. If the fields and drop downs do not have values, flag a main error for the redisplay
	 * and an individual error so that we can display "*Required" next to it in the post back version.
	 */
	
	if (title == null || title.equals("")) {errors++; titleBlank = 1;}
	
	if (fName == "") 	{ errors++; fNameBlank = 1;}
	if (lName == "") 	{ errors++; lNameBlank = 1;}
	if (street1 == "") 	{ errors++; street1Blank = 1;}
	if (city == "")		{ errors++; cityBlank = 1;}
	
	if (province == null || province.equals(""))  {errors++; provinceBlank = 1;}
	
	if (country == null || country.equals(""))  {errors++; countryBlank = 1;}
	
	if (postal == "") { errors++; postalBlank = 1;}
	if (phone == "") { errors++; phoneBlank = 1;}
	
	
	//If the email is blank, flag error, flag blank - display required
					
	if (email == "") { errors++; emailBlank = 1;}
	
	//If the email isn't blank, check the format against a pattern string, if fails, flag error, flag format - display invalid
	
	String emailPattern="^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})";
	
	if (email != "" && email.matches(emailPattern) == false)	{errors++; emailFormat = 1;} 
	 
	
	//If password is blank, flag error, flag blank
	
	if (password == "") { errors++; passwordBlank = 1;}
	
	//If password is not blank, check the length, if length fails, flag error, flag length
	
	if (password != "" && password.length() < 6) {errors++; passwordLength = 1;} 
	

	//IF ERRORS HAVE BEEN FOUND IN THE FORM, REDISPLAY IT WITH ERROR MESSAGES
	
	if (errors > 0)
	{
		%>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
		<HTML>
			<HEAD>
				<TITLE>Registration Form</TITLE>
				<link rel="stylesheet"
				href="registration-styles.css"
				type="text/css" />
			</HEAD>
				<BODY BGCOLOR="#FDF5E6">

					<H1>Check Registration Form</H1>

				<p class="larger">There are <%=errors %> errors. Please re-check all fields and click submit.</p>
				<hr>
				<form action="http://localhost:8080/checkRegistration.jsp" method="POST">
				
				<fieldset>
				<legend><b>Title</b></legend> 
				
				Title: 	<select name="dd_title">
							<option value=""></option>
							<option value="Mr."
								<% if (title != null && title.equals("Mr.")) out.println(" SELECTED ");%>
							>Mr.</option>
							
							<option value="Mrs."
								<% if (title != null && title.equals("Mrs.")) out.println(" SELECTED ");%>
							>Mrs.</option>
							
						</select>
						<% if (titleBlank > 0) out.print("<font color=red>*Required</font>");%><br />				
				</fieldset>
				<br />
				
				<fieldset>
				<legend><b>Address</b></legend> 
				First Name : <input	type="text" name="fname" value="<%=fName %>" /> 
					<% if (fNameBlank > 0) out.print("<font color=red>*Required</font>"); %><br />
				Last Name : <input type="text" name="lname" value="<%=lName %>" />
					<% if (lNameBlank >0) out.print("<font color=red>*Required</font>");  %><br />
				Street Address 1 : <input type="text" name="street1" value="<%=street1 %>" />
					<% if (street1Blank >0) out.print("<font color=red>*Required</font>");  %><br />
				
				Street Address 2 : <input type="text" name="street2" value="<%=street2 %>" /> <br />
				Street Address 3 : <input type="text" name="street3" value="<%=street3 %>" /> <br />
				
				City : <input type="text" name="city" value="<%=city %>" />
					<% if (cityBlank >0) out.print("<font color=red>*Required</font>");  %><br />
				
				Province/State : <select name="dd_province">
									<option value=""></option>
									<option value="AB"
									<% if (province != null && province.equals("AB")) out.println(" SELECTED ");%>
									>Alberta</option>
									<option value="BC"
									<% if (province != null && province.equals("BC")) out.println(" SELECTED ");%>
									>British Columbia</option>
									<option value="MB"
									<% if (province != null && province.equals("MB")) out.println(" SELECTED ");%>
									>Manitoba</option>
									<option value="NB"
									<% if (province != null && province.equals("NB")) out.println(" SELECTED ");%>
									>New Brunswick</option>
									<option value="NF"
									<% if (province != null && province.equals("NF")) out.println(" SELECTED ");%>
									>Newfoundland</option>
									<option value="NT"
									<% if (province != null && province.equals("NT")) out.println(" SELECTED ");%>
									>Northwest Territories</option>
									<option value="NS"
									<% if (province != null && province.equals("NS")) out.println(" SELECTED ");%>
									>Nova Scotia</option>
									<option value="NU"
									<% if (province != null && province.equals("NU")) out.println(" SELECTED ");%>
									>Nunavut</option>
									<option value="ON"
									<% if (province != null && province.equals("ON")) out.println(" SELECTED ");%>
									>Ontario</option>
									<option value="PE"
									<% if (province != null && province.equals("PE")) out.println(" SELECTED ");%>
									>Prince Edward Island</option>
									<option value="QC"
									<% if (province != null && province.equals("QC")) out.println(" SELECTED ");%>
									>Quebec</option>
									<option value="SK"
									<% if (province != null && province.equals("SK")) out.println(" SELECTED ");%>
									>Saskatchewan</option>
									<option value="YT"
									<% if (province != null && province.equals("YT")) out.println(" SELECTED ");%>
									>Yukon</option>
								</select>
								<% if (provinceBlank > 0) out.print("<font color=red>*Required</font>");%>
								<br />
								
				Country : 	<select name="dd_countries">
								<option value=""></option>
								<option value="CA"
								<% if (country != null && country.equals("CA")) out.println(" SELECTED ");%>
								>Canada</option>
								<option value="US"
								<% if (country != null && country.equals("US")) out.println(" SELECTED ");%>
								>United States</option>
							</select> 
							
							<% if (countryBlank > 0) out.print("<font color=red>*Required</font>");%>
							<br />
				
				Postal Code : <input type="text" name="postalcode" value="<%=postal %>" />
					<% if (postalBlank >0) out.print("<font color=red>*Required</font>");%><br />
				Phone Number : <input type="text" name="phone" value="<%=phone %>" />
					<% if (phoneBlank >0) out.print("<font color=red>*Required</font>");%><br />
				E-Mail : <input type="text" name="email" value="<%=email %>" />
					<% 	if (emailBlank >0) out.print("<font color=red>*Required</font>");
						if (emailFormat >0) out.print("<font color=red>*Invalid E-Mail</font>");
					%><br />
				Password : <input type="text" name="password" value="<%=password %>" />
					<% 	if (passwordBlank >0) out.print("<font color=red>*Required</font>");
						if (passwordLength > 0)	out.print("<font color=red>*Password Less Than 6 Characters</font>");
						%><br />
				</fieldset>
				<br />

				<input type="submit" name="submit" value="Save" /></form>

			</BODY>
		</HTML>
		
		<%
			
	}
	//IF FORM VALIDATES, UPDATE THE DATABASE AND FORWARD TO validRegistration SERVLET
	
	else
	{
		try {
			
			
			
			//Load the mysql driver
			Class.forName("org.gjt.mm.mysql.Driver");
			
			//The following sets up a string to make the connection
			String url="jdbc:mysql://127.0.0.1/servlet_db1";
			
			//Connect to the database
			Connection con = DriverManager.getConnection(url,"root","");
			
			//Create statement variable which we will use to send queries
			Statement stmt = con.createStatement();
			
			//Insert our string variables into the database
			
			stmt.execute("INSERT INTO users (title, fname, lname, street1, street2, street3, city, province, country, postalcode, phone, email, password) " +
						"VALUES ('" + title + "', '" + fName + "', '" + lName + "', '" + street1 + "', '" + street2 + "', '" + street3 + "', '" + city + 
						"', '" + province + "', '" + country + "', '" + postal + "', '" + phone + "', '" + email + "', '" + password + "') ");
			
			/*	Since we will be redisplaying the information on the next page, get the single user ID ONLY from the record
			 * 	which has just been entered by re-checking against name and email and then pass that user ID to the validRegistration
			 * 	page we are then redirected to		
			 */
			
			String user_id = "";
			ResultSet rs = stmt.executeQuery("SELECT * from users WHERE fname='" + fName + "' AND lName='" + lName + "' AND email='" + email + "' ORDER BY user_id DESC LIMIT 1");
			
			while(rs.next()) {
				user_id = rs.getString("user_id");
			}
				stmt.close();
				con.close();
			
				response.sendRedirect("validRegistration.jsp?id=" + user_id);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
%>




