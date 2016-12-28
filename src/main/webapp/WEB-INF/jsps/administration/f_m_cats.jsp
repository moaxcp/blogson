<%
try  {
	String mess = "UPDATE " + dbPrefix + "news SET cname = '" + utilities.filterForSQL(request.getParameter("new_category")) + "'" +
		" where varsname = '" + site_name + "' and cname = '" + utilities.filterForSQL(request.getParameter("category")) + "'";

	stmt.executeUpdate(mess);
	site_message = "Your category has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving category: " + e;
}
%>