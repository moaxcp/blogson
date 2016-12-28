News:<br />
	    <hr /><br />
	  	<dl>
	    <%
try  {
	    rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, EXTRACT(YEAR FROM news.postdate) as y, cname, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid=comment.newsid where news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, cname order by news.postdate DESC limit 10");

String news_newsid, news_title, news_content, news_ddate, news_mdate, news_ydate, news_hdate, news_mindate, news_uname, news_comments, news_cname;
String month = new String();
String day = new String();
String year = new String();

if(rs.first())  {
	rs.previous();
	while(rs.next())  {
		news_newsid = rs.getString("newsid");
		news_title = rs.getString("title");
		news_content = rs.getString("content");
		news_ddate = rs.getString("d");
		news_mdate = rs.getString("m");
		news_ydate = rs.getString("y");
		news_mindate = rs.getString("min");
		news_hdate = rs.getString("h");
		news_uname = rs.getString("uname");
		news_cname = rs.getString("cname");
		news_comments = rs.getString("count");
		%>
		<!-- newsid = <%= news_newsid %> -->
		<%
		if(!(month.equals(news_mdate) && day.equals(news_ddate) && year.equals(news_ydate)))  {
			%>

			<dt><b><%= news_mdate %>/<%= news_ddate %>/<%= news_ydate %></b></dt>
			<%
		}
		%>
		<dd>
		<b><a href="<%= response.encodeURL("pages/?view=news_post&news_id=" + news_newsid + "&site_name=main") %>"><%= news_title %></a>:</b>
		<font size="-1"><%= news_content %></font><br />
		</dd>
		<dd>
		<br />
		<font size="-1">by <a href="<%= response.encodeURL("pages/?nav=Members&view=member&member_uname=" + news_uname + "&site_name=main") %>"><%= news_uname %></a>
		in <a href="<%= response.encodeURL("pages/?category=" + rs.getString("cname") + "&site_name=main") %>"><%= rs.getString("cname") %></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%= response.encodeURL("pages/?view=news_post&news_id=" + news_newsid + "&site_name=main") %>#comments">comments(<%= news_comments %>)</a></font>
		</dd>

		<br />
		<hr />
		<br />
		<%

		month = rs.getString("m");
		day = rs.getString("d");
		year = rs.getString("y");
	}
}
}
catch(Exception e)  {
	%><%= e %><br /><%
}
%>
		</dl>
