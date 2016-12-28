<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET title = '" + utilities.filterHTML(request.getParameter("title")) + "', " +
		"header = '" + utilities.filterForSQL(request.getParameter("header")) + "', " +
		"footer = '" + utilities.filterForSQL(request.getParameter("footer")) + "', " +
		"h_news = '" + utilities.filterForSQL(request.getParameter("h_news")) + "', " +
		"m_news = '" + utilities.filterForSQL(request.getParameter("m_news")) + "', " +
		"a_news = '" + utilities.filterForSQL(request.getParameter("a_news")) + "', " +
		"ownername = '" + utilities.filterHTML(request.getParameter("ownername")) + "', " +
		"owneremail = '" + utilities.filterHTML(request.getParameter("owneremail")) + "', " +
		"siteurl = '" + utilities.filterHTML(request.getParameter("siteurl")) + "', " +
		"numnews = " + request.getParameter("numnews") + ", " +
		"numguestbook = " + request.getParameter("numguestbook") + ", " +
		"numcomment = " + request.getParameter("numcomment") + ", " +
		"nummember = " + request.getParameter("nummember") + ", " +
		"gbookquestion = '" + utilities.filterForSQL(request.getParameter("gbookquestion")) + "', " +
		"metatags = '" + utilities.filterForSQL(request.getParameter("metatags")) + "'" +
		" WHERE varsname = '" + site_name + "'";

	stmt.executeUpdate(mess);
	site_message = "Your site variables have been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving site variables: " + e;
}
%>