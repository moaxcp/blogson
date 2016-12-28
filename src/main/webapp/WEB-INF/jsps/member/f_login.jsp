<%

String log_pass = new String();

if(request.getParameter("user_name") != null)
	logged_uname = utilities.filterHTML(request.getParameter("user_name"));

if(request.getParameter("password") != null)
	log_pass = utilities.filterHTML(request.getParameter("password"));

try  {

	rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site WHERE uname = '" + logged_uname + "' AND passw = '" + log_pass + "' AND activated = true and varsname = '" + site_name + "'");

	if(rs.first())  {
		logged_position = rs.getString("job");
		logged = true;

		session.setAttribute("uname", logged_uname);
		stmt.executeUpdate("UPDATE " + dbPrefix + "member SET sessionid = '" + session.getId() + "' WHERE uname = '" + logged_uname + "'");
		site_message = "You have been logged in as " + logged_uname;
	}
	else  {
		site_message = "User name or password could not be found in database";
	}
}
catch(Exception e)  {
	site_message = "Could not be logged in: " + e;
}


%>