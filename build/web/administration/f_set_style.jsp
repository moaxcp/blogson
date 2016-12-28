<%
String stylename = new String();
String newstyle = new String();

if(request.getParameter("stylename") != null)
		stylename = request.getParameter("stylename");

rs = stmt.executeQuery("select style from " + dbPrefix + "style where stylename = '" + stylename + "'");

if(rs.first())  {
	newstyle = rs.getString("style");

	try  {
		String mess = "UPDATE " + dbPrefix + "site_vars SET style = '" + utilities.filterForSQL(newstyle) + "'" +
		" WHERE varsname = '" + site_name + "'";

		stmt.executeUpdate(mess);
		site_message = "Your style has been changed to " + stylename + "!";

	}
	catch(SQLException e)  {
		site_message = "There was a problem during saving style: " + e;
	}
}
else {
	site_message = "Could not find style in database.";
}
%>
