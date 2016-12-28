<%
String stylename = new String();
String newstyle = new String();

if(request.getParameter("stylename") != null)
		stylename = request.getParameter("stylename");

if(request.getParameter("style") != null)
		newstyle = request.getParameter("style");

	try  {
		String mess = "update " + dbPrefix + "style set style = '" + newstyle +
			"' where stylename = '" + stylename + "' and varsname = '" + site_name + "'";

		stmt.executeUpdate(mess);
		site_message = "Style has been edited " + stylename + "!";

	}
	catch(SQLException e)  {
		site_message = "There was a problem during editing style: " + e;
	}
%>
