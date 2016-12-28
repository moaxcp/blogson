<%
String site_action = new String("");

if(request.getParameter("action") != null)
	site_action = request.getParameter("action");

if(site_action.equals("logout") && (logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="../actions/logout.jsp" %>
	<%
}
else if(nav.equals("Home") && site_action.equals("f_create_blog"))  {
	%>
	<%@ include file="../actions/f_create_blog.jsp" %>
	<%
}
%>