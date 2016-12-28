<%

try  {
	String comid = new String();

	int del = 0;

	if(request.getParameter("comid") != null)
		comid = request.getParameter("comid");

	String mess = "DELETE FROM " + dbPrefix + "comment WHERE varsname = '" + site_name + "' and comid = '" + comid + "'";
	del = stmt.executeUpdate(mess);

	if(del > 0)  {	
	    site_message = "Your delete has been successful!";

	}
	else  {
	    site_message = "Cannot delete " + comid + ".";
	}
}
catch(Exception e)  {
	    site_message = "There was a problem during deletion: " + e.getMessage();
}
%>