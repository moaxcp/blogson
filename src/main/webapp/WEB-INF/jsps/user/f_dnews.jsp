<%

try  {

		int newsid = -1;

		if(request.getParameter("newsid") != null)
			newsid = Integer.valueOf(request.getParameter("newsid")).intValue();


	String mess = "DELETE FROM " + dbPrefix + "comment where newsid = " + newsid + " and varsname = '" + site_name + "'";
	int del = stmt.executeUpdate(mess);

	if(del > 0)  {	
	    site_message = "Deleted comments!<br>";

	}
	else  {
	    site_message = "Did not delete any comments<br>";
	}

	mess = "DELETE FROM " + dbPrefix + "news WHERE newsid = " + newsid + " AND uname = '" + logged_uname + "' and varsname = '" + site_name + "'";

	del = stmt.executeUpdate(mess);

	if(del > 0)  {	
	    site_message += "Your delete has been successful!";

	}
	else  {
	    site_message += "Cannot delete messages that are not yours.";
	}
}
catch(Exception e)  {
	    site_message = "There was a problem during deletion: " + e.getMessage();
}
%>