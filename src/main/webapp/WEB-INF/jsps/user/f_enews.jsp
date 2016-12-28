<%

		int newsid = -1;

		if(request.getParameter("newsid") != null)
			newsid = Integer.valueOf(request.getParameter("newsid")).intValue();

		if(logged_position.equals("Administrator"))  {
			rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "news JOIN " + dbPrefix + "member ON " + dbPrefix + "news.uname = " + dbPrefix + "member.uname WHERE newsid = " + newsid);
			if(rs.first())  {
				logged_uname = rs.getString("uname");
			}
		}
try  {

	String mess = "update " + dbPrefix + "news set title='" + utilities.filterHTML(request.getParameter("title")) +
		"', content='" + utilities.filterForSQL(request.getParameter("news")) +
		"', cname='" + utilities.filterHTML(request.getParameter("category")) +
		"' where newsid=" + newsid + " and uname = '" + logged_uname + "' and varsname = '" + site_name + "'";

	stmt.executeUpdate(mess);
	site_message = "Your edit has been successful!";
}
catch(SQLException e)  {
	site_message = "There was a problem during edit: " + e.getErrorCode();
}
%>