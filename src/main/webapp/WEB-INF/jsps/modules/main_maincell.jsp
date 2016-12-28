<%
/***********************************************************
 * MAIN CELL VARS
 **********************************************************/
String view = new String("");

if(request.getParameter("view") != null)
	view = request.getParameter("view");


//END MAIN CELL VARS **************************************




if(!site_message.equals(""))  {
	%>
	<table class="siteMessage">
	  <tr>
	    <td class="siteMessageTitle">Message</td>
	  </tr>
	  <tr>
	    <td class="siteMessageContent">
		<%= site_message %>
	    </td>
	  </tr>
	</table>
	<br>
	<%
}

%>
<%@ include file="news_header.jsp" %>
<br>
<%
if(nav.equals("Home"))  {

	if(view.equals(""))
		view = "news";

	if(view.equals("news"))  {
		%>
		<%@ include file="news_dl.jsp" %>
		<%
	}
	else if(view.equals("create_blog"))  {
		%>
		<%@ include file="create_blog.jsp" %>
		<%
	}
}
%>