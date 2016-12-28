<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET left_side = '" + utilities.filterForSQL(request.getParameter("left_side")) + "'" +
		" WHERE varsname = '" + siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your left side has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving left side: " + e;
}
%>