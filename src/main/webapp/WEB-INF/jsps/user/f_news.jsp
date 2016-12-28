<%

try  {

	if(news_cat == null || news_cat.equals(""))  {
		news_cat = "Posts";
	}

	String mess = "INSERT INTO " + dbPrefix + "news VALUES(nextval('" + dbPrefix + "news_seq')" +
		", '" + utilities.filterHTML(request.getParameter("title")) +
		"', '" + utilities.filterForSQL(request.getParameter("news")) +
		"', current_timestamp, '" + logged_uname + 
		"', '" + utilities.filterHTML(news_cat) + "', '" + siteName + "')";

	stmt.executeUpdate(mess);
	site_message = "Your post has been successful!";
}
catch(SQLException e)  {
	site_message = "There was a problem during posting: " + e;
}
%>
