<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET home_nav = '" + utilities.filterForSQL(request.getParameter("home_nav")) + "', " +
		"members_nav = '" + utilities.filterForSQL(request.getParameter("members_nav")) + "', " +
		"guestbook_nav = '" + utilities.filterForSQL(request.getParameter("guestbook_nav")) + "', " +
		"member_nav = '" + utilities.filterForSQL(request.getParameter("member_nav")) + "', " +
		"user_nav = '" + utilities.filterForSQL(request.getParameter("user_nav")) + "', " +
		"admin_nav = '" + utilities.filterForSQL(request.getParameter("admin_nav")) + "', " +
		"welcome_user = '" + utilities.filterForSQL(request.getParameter("welcome_user")) + "', " +
		"stats_title = '" + utilities.filterHTML(request.getParameter("stats_title")) + "', " +
		"categories_title = '" + utilities.filterHTML(request.getParameter("categories_title")) + "', " +
		"news_archives_title = '" + utilities.filterHTML(request.getParameter("news_archives_title")) + "', " +
		"sign_guestbook_link = '" + utilities.filterForSQL(request.getParameter("sign_guestbook_link")) + "', " +
		"comment_title = '" + utilities.filterForSQL(request.getParameter("comment_title")) + "', " +
		"signed_title = '" + utilities.filterForSQL(request.getParameter("signed_title")) + "'" +
		" WHERE varsname = '" + siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your site variables have been saved successfuly!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving site variables: " + e;
}
%>