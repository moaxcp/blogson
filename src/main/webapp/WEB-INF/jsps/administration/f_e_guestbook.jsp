<%
try  {
	String gid = new String();

	if(request.getParameter("guestid") != null)
		gid = request.getParameter("guestid");

	String mess = "UPDATE " + dbPrefix + "guestbook SET name = '" + utilities.filterHTML(request.getParameter("name")) + "', " +
		"email = '" + utilities.filterHTML(request.getParameter("email")) + "', " +
		"website = '" + utilities.filterHTML(request.getParameter("website")) + "', " +
		"comment = '" + utilities.filterHTML(request.getParameter("comment")) + "', " +
		"answer = '" + utilities.filterHTML(request.getParameter("answer")) + "' " +
		" WHERE varsname = '" + siteName + "' and guestid = " + gid;
	System.out.println(mess);
	stmt.executeUpdate(mess);
	site_message = "The guestbook has been updated!";
}
catch(SQLException e)  {
	site_message = "There was a problem during saving changes: " + e;
}
%>