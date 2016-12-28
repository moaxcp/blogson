<%
try  {
	String a_uname = new String();
	String mess = new String();

	if(request.getParameter("a_uname") != null)
		a_uname = request.getParameter("a_uname");

	if(!a_uname.equals(logged_uname))  {
		mess = "UPDATE " + dbPrefix + "member SET fname = '" + utilities.filterHTML(request.getParameter("FirstName")) + "', " +
		"lname = '" + utilities.filterHTML(request.getParameter("LastName")) + "', " +
		"minit = '" + utilities.filterHTML(request.getParameter("MiddleInit")) + "', " +
		"passw = '" + utilities.filterHTML(request.getParameter("Password")) + "', " +
		"email = '" + utilities.filterHTML(request.getParameter("Email")) + "', " +
		"website = '" + utilities.filterHTML(request.getParameter("Website")) + "', " +
		"info = '" + utilities.filterForSQL(request.getParameter("info")) + "', " +
		"bday = DATE'" + request.getParameter("BirthYear") +
		"-" + request.getParameter("BirthMonth") +
		"-" + request.getParameter("BirthDay") + "', " +
		"gender = '" + request.getParameter("Gender") + "' " +
		"WHERE uname = '" + a_uname + "'";

		stmt.executeUpdate(mess);

		mess = "UPDATE " + dbPrefix + "member_site set job = '" + request.getParameter("position") +
		"', activated = " + request.getParameter("activated") + " " +
		"where uname = '" + a_uname + "' and varsname = '" + site_name + "'";
		stmt.executeUpdate(mess);

		site_message = "The profile(" + a_uname + ") has been saved successfuly!";
	}
	else  {
		mess = "UPDATE " + dbPrefix + "member SET fname = '" + utilities.filterHTML(request.getParameter("FirstName")) + "', " +
		"lname = '" + utilities.filterHTML(request.getParameter("LastName")) + "', " +
		"minit = '" + utilities.filterHTML(request.getParameter("MiddleInit")) + "', " +
		"passw = '" + utilities.filterHTML(request.getParameter("Password")) + "', " +
		"email = '" + utilities.filterHTML(request.getParameter("Email")) + "', " +
		"website = '" + utilities.filterHTML(request.getParameter("Website")) + "', " +
		"info = '" + utilities.filterForSQL(request.getParameter("info")) + "', " +
		"bday = DATE'" + request.getParameter("BirthYear") +
		"-" + request.getParameter("BirthMonth") +
		"-" + request.getParameter("BirthDay") + "', " +
		"gender = '" + request.getParameter("Gender") + "' " +
		"WHERE uname = '" + a_uname + "'";

		stmt.executeUpdate(mess);
		site_message = "The profile(" + a_uname + ") has been saved but the position and activation could not be changed.";
	}
	System.out.println(mess);

}
catch(SQLException e)  {
	site_message = "There was a problem during saving: " + e;
}
%>