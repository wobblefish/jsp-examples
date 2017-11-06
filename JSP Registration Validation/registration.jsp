
<%@ page language="java" import="java.lang.*,java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
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

			<H1>Registration Form</H1>

		<p class="larger">Please enter all fields and click submit.</p>
		<hr>
		<form action="http://localhost:8080/checkRegistration.jsp" method="POST">
		
		<fieldset>
		<legend><b>Title</b></legend> 
		
		Title: 	<select name="dd_title">
					<option value=""></option>
					<option value="Mr.">Mr.</option>
					<option value="Mrs.">Mrs.</option>
				</select>
		
		</fieldset>
		<br />
		
		<fieldset>
		<legend><b>Address</b></legend> 
		First Name : <input	type="text" name="fname" value="" /> <br />
		Last Name : <input type="text" name="lname" value="" /> <br />
		Street Address 1 : <input type="text" name="street1" value="" /> <br />
		Street Address 2 : <input type="text" name="street2" value="" /> <br />
		Street Address 3 : <input type="text" name="street3" value="" /> <br />
		City : <input type="text" name="city" value="" /> <br />
		Province/State : <select name="dd_province">
							<option value=""></option>
							<option value="AB">Alberta</option>
							<option value="BC">British Columbia</option>
							<option value="MB">Manitoba</option>
							<option value="NB">New Brunswick</option>
							<option value="NF">Newfoundland</option>
							<option value="NT">Northwest Territories</option>
							<option value="NS">Nova Scotia</option>
							<option value="NU">Nunavut</option>
							<option value="ON">Ontario</option>
							<option value="PE">Prince Edward Island</option>
							<option value="QC">Quebec</option>
							<option value="SK">Saskatchewan</option>
							<option value="YT">Yukon</option>
						</select><br />
						
		Country : 	<select name="dd_countries">
						<option value=""></option>
						<option value="CA">Canada</option>
						<option value="US">United States</option>
					</select> <br />
		
		Postal Code : <input type="text" name="postalcode" value="" /> <br />
		Phone Number : <input type="text" name="phone" value="" /> <br />
		E-Mail : <input type="text" name="email" value="" /> <br />
		Password : <input type="text" name="password" value="" /> <br />

		</fieldset>
		<br />

		<input type="submit" name="submit" value="Save" /></form>

	</BODY>
</HTML>

