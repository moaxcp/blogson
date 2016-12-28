<%
if(!logged)  {


	try  {

		String mess = "INSERT INTO " + dbPrefix + "member VALUES(" +
			"'" + utilities.filterHTML(request.getParameter("FirstName")) +
			"', '" + utilities.filterHTML(request.getParameter("LastName")) +
			"', '" + utilities.filterHTML(request.getParameter("MiddleInit")) +
			"', '" + utilities.filterHTML(request.getParameter("UserName")) +
			"', '" + utilities.filterHTML(request.getParameter("Password")) +
			"', '" + utilities.filterHTML(request.getParameter("Email")) +
			"', '" + utilities.filterHTML(request.getParameter("Website")) +
			"', '" + utilities.filterForSQL(request.getParameter("info")) +
			"', DATE'" + request.getParameter("BirthYear") +
			"-" + request.getParameter("BirthMonth") +
			"-" + request.getParameter("BirthDay") +
			"', '" + request.getParameter("Gender") +
			"', NULL)";

		stmt.executeUpdate(mess);

		mess = "Insert Into " + dbPrefix + "member_site values('" + utilities.filterHTML(request.getParameter("UserName")) +
			"', '" + siteName +
			"', 'Member', false, current_timestamp)";

		stmt.executeUpdate(mess);

		site_message = "You have been registered successfuly!";
	}
	catch(SQLException e)  {
		site_message = "There was a problem during registration: " + e;
	}
}
else  {
	site_message = "You are already registered.";
}

%>
