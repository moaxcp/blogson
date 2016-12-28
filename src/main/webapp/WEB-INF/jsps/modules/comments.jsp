<%

/*******************************************
 * COMMENT VARS
 ******************************************/

int start = 0;
int inc = 10;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + siteName + "'");
if(rs.first())  {
	inc = rs.getInt("numcomment");
}
else  {
	%>
	A record in site_vars is not defined as use. ie. attribute: use = true.
	<%
	return;
}


rs = stmt.executeQuery("Select c.comid, c.name, c.email, c.homepage, c.comment, EXTRACT(DAY FROM c.comdate) as d, EXTRACT(MONTH FROM c.comdate) as m, EXTRACT(HOUR FROM c.comdate) as h, EXTRACT(MINUTE FROM c.comdate) as min, EXTRACT(YEAR FROM c.comdate) as y, c.newsid FROM " + dbPrefix + "comment AS c where varsname = '" + siteName + "' ORDER BY c.comdate desc limit " + inc + " offset " + start);

String comment_comid, comment_name, comment_email, comment_homepage, comment_comment, comment_newsid, comment_d, comment_m, comment_h, comment_min, comment_y;

while(rs.next())  {
	comment_comid = rs.getString("comid");
	comment_name = rs.getString("name");
	comment_email = rs.getString("email");
	comment_homepage = rs.getString("homepage");
	comment_comment = rs.getString("comment");
	comment_newsid = rs.getString("newsid");
	comment_d = utilities.getZeros(rs.getInt("d"));
	comment_m = utilities.getZeros(rs.getInt("m"));
	comment_h = utilities.getZeros(rs.getInt("h"));
	comment_min = utilities.getZeros(rs.getInt("min"));
	comment_y = rs.getString("y");

	%>
	<!-- comid = <%= comment_comid %> -->
	 	<table class="sideModule">
		  <tr>
		    <td class="sideModuleTitle" colspan="2">
		      <span style="float:left;position:relative">Posted <%= comment_m %>/<%= comment_d %>/<%= comment_y %> - <%= comment_h %>:<%= comment_min %> by <a href=mailto:<%= comment_email %>><%= comment_name %></a></span>
		      <span style="float:right;position:relative"><a href=<%= comment_homepage %>><%= comment_homepage %></a></span>
		    </td>
		  </tr>
		  <tr>
		    <td class="sideModuleContent" colspan="2">
		      <%= comment_comment %>
		    </td>
		  </tr>
		  <tr>
		    <td class="sideModuleTitle" width="75%">
		      <a href="<%= response.encodeURL("?view=news_post&news_id=" + comment_newsid) %>">View News Post</a>
		    </td>
		    <td class="sideModuleTitle">
		  <%
			if(logged_position.equals("Administrator"))  {
				%>
			<a href="<%= response.encodeURL("?nav=Admin&view=e_comment&comid=" + comment_comid) %>">edit</a>&nbsp;&nbsp;<a href="<%= response.encodeURL("?view=news_post&action=d_comment&comid=" + comment_comid + "&news_id=" + comment_newsid + "&start=" + start) %>">delete</a>
		  <%
			}
		  %>
		    </td>
		  </tr>
		</table>
		<br>
	<%
}
%>
    <span style="float:left;position:relative">
<%

if(start - inc >= 0)  {
	%>
	<a href="<%= response.encodeURL("?nav=Comments&view=comments&start=" + (start - inc)) %>"> Previous </a>
	<%
}

rs = stmt.executeQuery("select count(comid) as c from " + dbPrefix + "comment where varsname = '" + siteName + "'");
rs.first();
%>
&nbsp;&nbsp;&nbsp;&nbsp;Showing

<%= start %>

through <%
if(start + inc <= rs.getInt("c"))  {
	%><%= start + inc %><%
}
else  {
	%><%= rs.getInt("c") %><%
}

%> of <%= rs.getInt("c") %></span>

<%
rs = stmt.executeQuery("select count(comid) as c from " + dbPrefix + "comment where comid in (select comid from " + dbPrefix + "comment where varsname = '" + siteName + "' limit " + inc + " offset " + (start + inc) + ")");

if(rs.first() && rs.getInt("c") > 0)  {
	%>
	<span style="float:right;position:relative"><a href="<%= response.encodeURL("?nav=Comments&view=comments&start=" + (start + inc)) %>"> Next </a></span>
	<%
}
%>