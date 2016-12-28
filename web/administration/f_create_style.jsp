<%
String stylename = new String();
String newstyle = new String();

if(request.getParameter("stylename") != null)
		stylename = request.getParameter("stylename");

if(request.getParameter("style") != null)
		newstyle = request.getParameter("style");

	try  {
		String mess = "insert into " + dbPrefix + "style values('" + stylename +
			"', '" + newstyle +
			"', '" + site_name + "')";

		stmt.executeUpdate(mess);
		site_message = "Style has been created: " + stylename + "!";

	}
	catch(SQLException e)  {
		site_message = "There was a problem during creating style: " + e;
	}
%>
