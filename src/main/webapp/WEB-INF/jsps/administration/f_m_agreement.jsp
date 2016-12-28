<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET agreement = '" + utilities.filterForSQL(request.getParameter("agreement")) + "'" +
		" WHERE varsname = '"+ siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your agreement has been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving agreement: " + e;
}
%>