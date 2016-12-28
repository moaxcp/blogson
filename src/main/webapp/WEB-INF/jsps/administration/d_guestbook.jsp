<%

try  {
	String g_id = new String();

	int del = 0;

	if(request.getParameter("g_id") != null)
		g_id = request.getParameter("g_id");

	String mess = "DELETE FROM " + dbPrefix + "guestbook WHERE varsname = '" + siteName + "' and guestid = '" + g_id + "'";
	del = stmt.executeUpdate(mess);

	if(del > 0)  {	
	    site_message = "Your delete has been successful!";

	}
	else  {
	    site_message = "Cannot delete " + g_id + ".";
	}
}
catch(Exception e)  {
	    site_message = "There was a problem during deletion: " + e.getMessage();
}
%>