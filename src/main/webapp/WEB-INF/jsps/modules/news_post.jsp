<%
/******************************************
 * NEWS VARS
 *****************************************/

String news_id = new String();

if(request.getParameter("news_id") != null)  {
	news_id = request.getParameter("news_id");
}

else  {
	%>Parameter missing: news_id<%
	return;
}
//END NEWS VARS**********************************



// select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, count(comid) from jblogrc2_news as news join jblogrc2_comment as comment on news.newsid = comment.newsid group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min order by news.postdate desc;
rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid=comment.newsid where news.newsid = " + news_id + " and news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min order by news.postdate DESC limit 1");

String news_newsid, news_title, news_content, news_ddate, news_mdate, news_ydate, news_hdate, news_mindate, news_uname, news_comments;

if(rs.first())  {
	news_newsid = rs.getString("newsid");
	news_title = rs.getString("title");
	news_content = rs.getString("content");
	news_ddate = utilities.getZeros(rs.getInt("d"));
	news_mdate = utilities.getZeros(rs.getInt("m"));
	news_ydate = rs.getString("y");
	news_mindate = utilities.getZeros(rs.getInt("min"));
	news_hdate = utilities.getZeros(rs.getInt("h"));
	news_uname = rs.getString("uname");
	news_comments = rs.getString("count");
	%>
	<!-- newsid = <%= news_newsid %> -->
	 	<table class="mainModuleItem">
		  <tr>
		    <td class="mainModuleItemTitle">
		      <span style="float:left;position:relative"><a href="<%= response.encodeURL("index.jsp?view=news_post&news_id=" + news_newsid + "&site_name=" + site_name) %>"><%= news_title %></a></span>
		      <span style="float:right;position:relative">
				
		      </span>
		    </td>
		  </tr>
		  <tr>
		    <td class="mainModuleItemContent">
		      <%= news_content %>
		    </td>
		  </tr>
		  <tr>
		    <td class="mainModuleItemSubTitle">
		      <span style="float:left;position:relative">Posted <%= news_mdate %>/<%= news_ddate %>/<%= news_ydate %> - <%= news_hdate %>:<%= news_mindate %> by <a href="<%= response.encodeURL("index.jsp?nav=Members&view=member&member_uname=" + news_uname + "&site_name=" + site_name) %>"><%= news_uname %></a></span>
		      <span style="float:right;position:relative"><a href="#comments"><%= comment_title %>s(<%= news_comments %>)</a></span>
		    </td>
		  </tr>
		</table>
		<a name="comments"><br></a>
	<%
}


/*******************************************
 * COMMENT VARS
 ******************************************/

int start = 0;
int inc = 10;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	inc = rs.getInt("numcomment");
}
else  {
	%>
	A record in site_vars is not defined as use. ie. attribute: use = true.
	<%
	return;
}


rs = stmt.executeQuery("Select c.comid, c.name, c.email, c.homepage, c.comment, EXTRACT(DAY FROM c.comdate) as d, EXTRACT(MONTH FROM c.comdate) as m, EXTRACT(HOUR FROM c.comdate) as h, EXTRACT(MINUTE FROM c.comdate) as min, EXTRACT(YEAR FROM c.comdate) as y, c.newsid FROM " + dbPrefix + "comment AS c where c.newsid = " + news_id + " and varsname = '" + site_name + "' ORDER BY c.comdate limit " + inc + " offset " + start);

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
		  <%
			if(logged_position.equals("Administrator"))  {
				%>
		  <tr>
		    <td class="sideModuleTitle" width="75%">
			&nbsp;
		    </td>
		    <td class="sideModuleTitle">
			<a href="<%= response.encodeURL("index.jsp?nav=Admin&view=e_comment&comid=" + comment_comid + "&site_name=" + site_name) %>">edit</a>&nbsp;&nbsp;<a href="<%= response.encodeURL("index.jsp?view=news_post&action=d_comment&comid=" + comment_comid + "&news_id=" + news_id + "&start=" + start + "&site_name=" + site_name) %>">delete</a>
		    </td>
		  </tr>
		  <%
			}
		  %>
		</table>
		<br>
	<%
}
%>
    <span style="float:left;position:relative">
<%

if(start - inc >= 0)  {
	%>
	<a href="<%= response.encodeURL("index.jsp?view=news_post&news_id=" + news_id + "&start=" + (start - inc) + "&site_name=" + site_name) %>"> Previous </a>
	<%
}

rs = stmt.executeQuery("select count(comid) as c from " + dbPrefix + "comment where varsname = '" + site_name + "' and comid in (select comid from " + dbPrefix + "comment where newsid = " + news_id + " ORDER BY comdate desc)");
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
rs = stmt.executeQuery("select count(comid) as c from " + dbPrefix + "comment where varsname = '" + site_name + "' and comid in (select comid from " + dbPrefix + "comment where newsid = " + news_id + " ORDER BY comdate desc limit " + inc + " offset " + (start + inc) + ")");
rs.first();

if(rs.getInt("c") > 0)  {
	%>
	<span style="float:right;position:relative"><a href="<%= response.encodeURL("index.jsp?view=news_post&news_id=" + news_id + "&start=" + (start + inc) + "&site_name=" + site_name) %>"> Next </a></span>
	<%
}
%>
<br>
<br>
<%@ include file="add_comment.jsp"%>