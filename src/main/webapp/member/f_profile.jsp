<%
try  {
	String mess = "UPDATE " + dbPrefix + "member SET fname = '" + utilities.filterHTML(request.getParameter("FirstName")) + "', " +
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
		"WHERE uname = '" + logged_uname + "'";
System.out.println(mess);
	stmt.executeUpdate(mess);
	site_message = "Your profile has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving: " + e;
}
%>