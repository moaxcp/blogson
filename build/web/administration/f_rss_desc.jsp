<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET rss_description = '" + utilities.filterForSQL(request.getParameter("desc")) + "'" +
		" WHERE varsname = '" + site_name + "'";

	stmt.executeUpdate(mess);
	site_message = "Your rss description has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving rss description: " + e;
}
%>