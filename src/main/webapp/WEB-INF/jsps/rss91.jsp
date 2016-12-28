<%@ page import="java.sql.*" %><%@ page import="blogson.*" %><%@ page contentType="text/xml" %><?xml version="1.0" encoding="ISO-8859-1"?><%
/***************************************************************
 * FEED VARIABLES
 ***************************************************************/
int inc = 10;

/***************************************************************
 * CONNECTION
 **************************************************************/
%><%@ include file="connection.jsp" %><%

/***************************************************************
 * SITE VARS
 **************************************************************/
String title = new String();
String ownername = new String();
String owneremail = new String();
String siteurl = new String();
String rss_description = new String();
String site_name = new String();
int day;


if(request.getParameter("site_name") != null)  {
	site_name = request.getParameter("site_name");
}
else  {
	site_name = "main";
}

rs = stmt.executeQuery("SELECT title, ownername, owneremail, siteurl, rss_description, numnews FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	title = rs.getString("title");
	ownername = rs.getString("ownername");
	owneremail = rs.getString("owneremail");
	siteurl = rs.getString("siteurl");
	rss_description = rs.getString("rss_description");
	inc = rs.getInt("numnews");
}


%>
<rss version="0.91">
<channel>
	<title><%= title %></title>
	<link><%= utilities.filterHTML("http://" + request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + "?" + request.getQueryString()) %></link>
	<language>en</language>
	<generator>Blogson v1.0</generator>
	<description><%= rss_description %></description>
	<%

	rs = stmt.executeQuery("Select news.newsid, news.title, news.content, news.postdate, news.uname, EXTRACT(DAY FROM news.postdate) as d, EXTRACT(MONTH FROM news.postdate) as m, EXTRACT(HOUR FROM news.postdate) as h, EXTRACT(MINUTE FROM news.postdate) as min, extract (second from news.postdate) as sec, EXTRACT(YEAR FROM news.postdate) as y, extract(dow from news.postdate) as week_day, cname, count(comid) FROM " + dbPrefix + "news AS news left outer join " + dbPrefix + "comment as comment on news.newsid=comment.newsid where news.varsname = '" + site_name + "' group by news.newsid, news.title, news.content, news.postdate, news.uname, y, m, d, h, min, cname order by news.postdate DESC limit " + inc);
	while(rs.next())  {

		day = rs.getInt("week_day");

	%><item>
		<category><%= rs.getString("cname") %></category>
		<title><%= rs.getString("title") %></title>
		<link><%= utilities.filterHTML("http://" + request.getServerName() + ":" + request.getServerPort() + "/blogson/?view=news_post&news_id=" + rs.getString("newsid") + "&site_name=" + site_name) %></link>
		<description><%= utilities.filterHTML(rs.getString("content")) %></description>
		<pubDate><%= utilities.getDayOfWeek(day) %>, <%= utilities.getZeros(rs.getInt("d")) %> <%= utilities.getMonthOfYear(rs.getInt("m")) %> <%= rs.getString("y") %> <%= utilities.getZeros(rs.getInt("h")) %>:<%= utilities.getZeros(rs.getInt("min")) %>:<%= utilities.getZeros(rs.getInt("sec")) %> EST</pubDate>
		</item>
	<%
	}
	%>
	</channel>
</rss><%
con.close();
%>
