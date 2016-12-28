<%

try  {
	String a_uname = new String();

	int del = 0;

	if(request.getParameter("a_uname") != null)
		a_uname = request.getParameter("a_uname");

	if(!a_uname.equals(logged_uname))  {
		String mess = "DELETE FROM " + dbPrefix + "member_site WHERE varsname = '" + siteName + "' and uname = '" + a_uname + "'";
		del = stmt.executeUpdate(mess);
	}
	else  {
		del = 0;
	}

	if(del > 0)  {	
	    site_message = "Your delete has been successful!";

	}
	else  {
	    site_message = "Cannot delete " + a_uname + ".";
	}
}
catch(Exception e)  {
	    site_message = "There was a problem during deletion: " + e.getMessage();
}
%>