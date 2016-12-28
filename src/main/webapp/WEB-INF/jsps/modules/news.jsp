<%
/******************************************
 * NEWS VARS
 *****************************************/

String news_vars = new String();

int start = 0;
int inc = 10;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	inc = rs.getInt("numnews");
}
else  {
	%>
	There was an error with site vars in news.jsp
	<%
	return;
}

String news_month = new String();
String news_year = new String();


if(request.getParameter("news_month") != null && request.getParameter("news_year") != null)  {
	news_month = request.getParameter("news_month");
	news_year = request.getParameter("news_year");
	news_vars = "news_month=" + news_month + "&news_year=" + news_year;
}



//END NEWS VARS**********************************


if(!news_vars.equals(""))  {
	rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, cname, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid=comment.newsid WHERE EXTRACT(MONTH FROM postdate) = " + news_month + " AND EXTRACT(YEAR FROM postdate) = " + news_year + " and news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, cname order by news.postdate DESC limit " + inc + " offset " + start);
	rs.first();
	%>
	Viewing: <%= rs.getString("m") + "/" + rs.getString("y") %><br><br>
	<%
}
else if(!news_cat.equals(""))  {
	rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, news.cname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid = comment.newsid WHERE news.cname = '" + news_cat + "' and news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, news.cname order by news.postdate DESC limit " + inc + " offset " + start);
	//rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, news.cname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, count(comid) FROM jblogRC3_news AS news left outer join jblogRC3_comment as comment on news.newsid = comment.newsid WHERE cname in (select cname from jblogrc3_news where cname = 'green') group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, news.cname order by news.postdate DESC limit 10 offset 0");
	//System.out.println("Select news.newsid, news.title, news.content, news.postdate, news.uname, news.cname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid = comment.newsid WHERE news.cname = '" + news_cat + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, news.cname order by news.postdate DESC limit " + inc + " offset " + start);
	%>
	Viewing: <%= news_cat %><br><br>
	<%
}
else{
	rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, cname, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid=comment.newsid where news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, cname order by news.postdate DESC limit " + inc + " offset " + start);
}

String news_newsid, news_title, news_content, news_ddate, news_mdate, news_ydate, news_hdate, news_mindate, news_uname, news_comments, news_cname;

if(rs.first())  {
	rs.previous();
	while(rs.next())  {
		news_newsid = rs.getString("newsid");
		news_title = rs.getString("title");
		news_content = rs.getString("content");
		news_ddate = utilities.getZeros(rs.getInt("d"));
		news_mdate = utilities.getZeros(rs.getInt("m"));
		news_ydate = rs.getString("y");
		news_mindate = utilities.getZeros(rs.getInt("min"));
		news_hdate = utilities.getZeros(rs.getInt("h"));
		news_uname = rs.getString("uname");
		news_cname = rs.getString("cname");
		news_comments = rs.getString("count");
		%>
		<!-- newsid = <%= news_newsid %> -->
	  	<table class="mainModuleItem">
		  <tr>
		    <td class="mainModuleItemTitle">
		      <span style="float:left;position:relative"><a href="<%= response.encodeURL("?view=news_post&news_id=" + news_newsid + "&site_name=" + site_name) %>"><%= news_title %></a></span>
		      <span style="float:right;position:relative">
				<%
				if(news_uname.equals(logged_uname) || logged_position.equals("Administrator"))  {
					%>
					<a href="<%= response.encodeURL("?nav=User&view=e_news&newsid=" + news_newsid + "&site_name=" + site_name) %>">edit</a> <a href="<%= response.encodeURL("?nav=Home&action=f_dnews&newsid=" + news_newsid + "&site_name=" + site_name) %>">delete</a>
					<%
				}
				%>
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
		      <span style="float:left;position:relative">Posted <%= news_mdate %>/<%= news_ddate %>/<%= news_ydate %> - <%= news_hdate %>:<%= news_mindate %> by <a href="<%= response.encodeURL("?nav=Members&view=member&member_uname=" + news_uname + "&site_name=" + site_name) %>"><%= news_uname %></a> in <a href="<%= response.encodeURL("?category=" + rs.getString("cname") + "&site_name=" + site_name) %>"><%= rs.getString("cname") %></a></span>
		      <span style="float:right;position:relative"><a href="<%= response.encodeURL("?view=news_post&news_id=" + news_newsid + "&site_name=" + site_name) %>#comments"><%= comment_title %>s(<%= news_comments %>)</a></span>
		    </td>
		  </tr>
		</table>
		<br>
		<%
	}

	if(!news_vars.equals(""))  {
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n WHERE EXTRACT(MONTH FROM n.postdate) = " + news_month + " AND EXTRACT(YEAR FROM n.postdate) = " + news_year + " and n.varsname = '" + site_name + "' ORDER BY n.postdate DESC limit " + inc + " offset " + (start + inc) + ")");
	}
	else if(!news_cat.equals(""))  {
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n WHERE cname = '" + news_cat + "' and n.varsname = '" + site_name + "' ORDER BY n.postdate DESC limit " + inc + " offset " + (start + inc) + ")");
	}
	else  {
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n where n.varsname = '" + site_name + "' ORDER BY n.postdate DESC limit " + inc + " offset " + (start + inc) + ")");
	}

	rs.first();
	%>
	<span style="float:left;position:relative">
	<%

	if(rs.getInt("c") > 0)  {
		%>
		<a href="<%= response.encodeURL("?" + news_vars + "&category=" + news_cat + "&start=" + (start + inc) + "&site_name=" + site_name) %>"> Previous </a>
		<%
	}

	if(!news_vars.equals(""))
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n WHERE EXTRACT(MONTH FROM n.postdate) = " + news_month + " AND EXTRACT(YEAR FROM n.postdate) = " + news_year + " and n.varsname = '" + site_name + "' ORDER BY n.postdate DESC)");
	else if(!news_cat.equals(""))
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n WHERE cname = '" + news_cat + "' and n.varsname = '" + site_name + "' ORDER BY n.postdate DESC)");
	else
		rs = stmt.executeQuery("Select count(newsid) as c from " + dbPrefix + "news as news where news.varsname = '" + site_name + "' and newsid in (select newsid FROM " + dbPrefix + "news AS n where n.varsname = '" + site_name + "' ORDER BY n.postdate DESC)");

	rs.first();

	%>
	&nbsp;&nbsp;&nbsp;&nbsp;Showing
	<%
	if((rs.getInt("c") - (start + inc)) >= 0) {
		%>
		<%= rs.getInt("c") - (start + inc) %>
		<%
	}
	else {
		%>
		<%= 0 %>
		<%
	}
	%>

	through <%= rs.getInt("c") - start %> of <%= rs.getInt("c") %></span>

	<%

	if(start - inc >= 0)  {
		%>
		<span style="float:right;position:relative"><a href="<%= response.encodeURL("?" + news_vars + "&category=" + news_cat + "&start=" + (start - inc) + "&site_name=" + site_name) %>"> Next </a></span>
		<%
	}
}
else  {
	%>
	News is not present.
	<%
}
%>