<%
try  {

	String mess = "INSERT INTO " + dbPrefix + "comment VALUES(nextval('" + dbPrefix + "comment_seq')" +
		", '" + utilities.filterHTML(request.getParameter("name")) +
		"', '" + utilities.filterHTML(request.getParameter("email")) +
		"', '" + utilities.filterHTML(request.getParameter("homepage")) +
		"', '" + utilities.filterForSQL(request.getParameter("comment")) +
		"', current_timestamp, " + request.getParameter("news_id") +
		", '" + siteName + "')";

	stmt.executeUpdate(mess);
	site_message = "Your comment has been successful!";
}
catch(Exception e)  {
	site_message = "There was a problem during commenting: " + e;
}
%>