<%
String mem_page = new String();

if(request.getParameter("page") != null)
		mem_page = request.getParameter("page");

try  {
	String mess = "update " + dbPrefix + "member set page = '" + mem_page +
		"' where uname = '" + logged_uname + "'";

	stmt.executeUpdate(mess);
	site_message = "Your page has been updated!";

}
catch(SQLException e)  {
	site_message = "There was a problem during editing page: " + e;
}
%>
