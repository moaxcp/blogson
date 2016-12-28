<%
String mem_page = new String();
String mem_uname = new String();

if(request.getParameter("page") != null)
	mem_page = request.getParameter("page");
if(request.getParameter("mem_uname") != null)
	mem_uname = request.getParameter("mem_uname");

try  {
	String mess = "update " + dbPrefix + "member set page = '" + mem_page +
		"' where uname = '" + mem_uname + "'";

	stmt.executeUpdate(mess);
	site_message = "Page has been updated!";

}
catch(SQLException e)  {
	site_message = "There was a problem during editing page: " + e;
}
%>
