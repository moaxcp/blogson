<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET style = '" + utilities.filterForSQL(request.getParameter("style")) + "'" +
		" WHERE varsname = '" + site_name + "'";

	stmt.executeUpdate(mess);
	site_message = "Your style has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving style: " + e;
}
%>