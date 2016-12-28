<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET right_side = '" + utilities.filterForSQL(request.getParameter("right_side")) + "'" +
		" WHERE varsname = '" + site_name + "'";

	stmt.executeUpdate(mess);
	site_message = "Your right side has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving right side: " + e;
}
%>