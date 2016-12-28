<%
try  {
	String comid = new String();

	if(request.getParameter("comid") != null)
		comid = request.getParameter("comid");

	String mess = "UPDATE " + dbPrefix + "comment SET name = '" + utilities.filterHTML(request.getParameter("name")) + "', " +
		"email = '" + utilities.filterHTML(request.getParameter("email")) + "', " +
		"homepage = '" + utilities.filterHTML(request.getParameter("homepage")) + "', " +
		"comment = '" + utilities.filterForSQL(request.getParameter("comment")) + "'" +
		" WHERE varsname = '" + siteName + "' and comid = " + comid;
	stmt.executeUpdate(mess);
	site_message = "The comment has been updated!";
}
catch(Exception e)  {
	site_message = "There was a problem during saving changes: " + e;
}
%>