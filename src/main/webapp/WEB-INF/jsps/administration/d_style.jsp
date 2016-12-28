<%

try  {
	String stylename = new String();

	int del = 0;

	if(request.getParameter("stylename") != null)
		stylename = request.getParameter("stylename");

	rs = stmt.executeQuery("select * from " + dbPrefix + "style where stylename = '" + stylename + "'");

	if(rs.first() && site_name.equals(rs.getString("varsname")))  {
		String mess = "DELETE FROM " + dbPrefix + "style WHERE stylename = '" + stylename + "'";
		del = stmt.executeUpdate(mess);
	}
	else  {
		del = 0;
	}

	if(del > 0)  {	
	    site_message = "Your delete has been successful!";

	}
	else  {
	    site_message = "Cannot delete " + stylename + ".";
	}
}
catch(Exception e)  {
	    site_message = "There was a problem during deletion: " + e.getMessage();
}
%>