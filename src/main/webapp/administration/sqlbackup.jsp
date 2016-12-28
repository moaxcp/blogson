<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">SQL Backup</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<form>
<textarea name="sql" rows=25 cols=70>
delete from <%= dbPrefix %>comment;
delete from <%= dbPrefix %>guestbook;
delete from <%= dbPrefix %>style;
delete from <%= dbPrefix %>news;
delete from <%= dbPrefix %>member_site;
delete from <%= dbPrefix %>member;
delete from <%= dbPrefix %>site_vars;
<%
try  {
	String sql_varsname = new String();
	String sql_title = new String();
	String sql_header = new String();
	String sql_footer = new String();
	String sql_agreement = new String();
	String sql_h_news = new String();
	String sql_m_news = new String();
	String sql_a_news = new String();
	String sql_ownername = new String();
	String sql_owneremail = new String();
	String sql_siteurl = new String();
	String sql_numnews = new String();
	String sql_numguestbook = new String();
	String sql_numcomment = new String();
	String sql_nummember = new String();
	String sql_style = new String();
	String sql_gbookquestion = new String();
	String sql_metatags = new String();
	String sql_left_side = new String();
	String sql_right_side = new String();
	String sql_home_nav = new String();
	String sql_members_nav = new String();
	String sql_guestbook_nav = new String();
	String sql_user_nav = new String();
	String sql_member_nav = new String();
	String sql_admin_nav = new String();
	String sql_welcome_user = new String();
	String sql_stats_title = new String();
	String sql_categories_title = new String();
	String sql_news_archives_title = new String();
	String sql_sign_guestbook_link = new String();
	String sql_comment_title = new String();
	String sql_signed_title = new String();
	String sql_stats_date = new String();
	String sql_stats_count = new String();
	String sql_stats_total_ms = new String();
	String sql_rss_description = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "site_vars where varsname = '" + site_name + "'");
	while(rs.next())  {
		sql_varsname = rs.getString("varsname");
		sql_title = rs.getString("title");
		sql_header = rs.getString("header");
		sql_footer = rs.getString("footer");
		sql_agreement = rs.getString("agreement");
		sql_h_news = rs.getString("h_news");
		sql_m_news = rs.getString("m_news");
		sql_a_news = rs.getString("a_news");
		sql_ownername = rs.getString("ownername");
		sql_owneremail = rs.getString("owneremail");
		sql_siteurl = rs.getString("siteurl");
		sql_numnews = rs.getString("numnews");
		sql_numguestbook = rs.getString("numguestbook");
		sql_numcomment = rs.getString("numcomment");
		sql_nummember = rs.getString("nummember");
		sql_style = rs.getString("style");
		sql_gbookquestion = rs.getString("gbookquestion");
		sql_metatags = rs.getString("metatags");
		sql_left_side = rs.getString("left_side");
		sql_right_side = rs.getString("right_side");
		sql_home_nav = rs.getString("home_nav");
		sql_members_nav = rs.getString("members_nav");
		sql_guestbook_nav = rs.getString("guestbook_nav");
		sql_user_nav = rs.getString("user_nav");
		sql_member_nav = rs.getString("member_nav");
		sql_admin_nav = rs.getString("admin_nav");
		sql_welcome_user = rs.getString("welcome_user");
		sql_stats_title = rs.getString("stats_title");
		sql_categories_title = rs.getString("categories_title");
		sql_news_archives_title = rs.getString("news_archives_title");
		sql_sign_guestbook_link = rs.getString("sign_guestbook_link");
		sql_comment_title = rs.getString("comment_title");
		sql_signed_title = rs.getString("signed_title");
		sql_stats_date = rs.getString("stats_date");
		sql_stats_count = rs.getString("stats_count");
		sql_stats_total_ms = rs.getString("stats_total_ms");
		sql_rss_description = rs.getString("rss_description");

		%>Insert into <%= dbPrefix %>site_vars values('<%= utilities.filterForSQL(sql_varsname) %>', '<%= utilities.filterForSQL(sql_title) %>', '<%= utilities.filterForSQL(sql_header) %>', '<%= utilities.filterForSQL(sql_footer) %>', '<%= utilities.filterForSQL(sql_agreement) %>', '<%= utilities.filterForSQL(sql_h_news) %>', '<%= utilities.filterForSQL(sql_m_news) %>', '<%= utilities.filterForSQL(sql_a_news) %>', '<%= utilities.filterForSQL(sql_ownername) %>', '<%= utilities.filterForSQL(sql_owneremail) %>', '<%= utilities.filterForSQL(sql_siteurl) %>', <%= utilities.filterForSQL(sql_numnews) %>, <%= utilities.filterForSQL(sql_numguestbook) %>, <%= utilities.filterForSQL(sql_numcomment) %>, <%= utilities.filterForSQL(sql_nummember) %>, '<%= utilities.filterForSQL(sql_style) %>', '<%= utilities.filterForSQL(sql_gbookquestion) %>', '<%= utilities.filterForSQL(sql_metatags) %>', '<%= utilities.filterForSQL(sql_left_side) %>', '<%= utilities.filterForSQL(sql_right_side) %>', '<%= utilities.filterForSQL(sql_home_nav) %>', '<%= utilities.filterForSQL(sql_members_nav) %>', '<%= utilities.filterForSQL(sql_guestbook_nav) %>', '<%= utilities.filterForSQL(sql_member_nav) %>', '<%= utilities.filterForSQL(sql_user_nav) %>', '<%= utilities.filterForSQL(sql_admin_nav) %>', '<%= utilities.filterForSQL(sql_welcome_user) %>', '<%= utilities.filterForSQL(sql_stats_title) %>', '<%= utilities.filterForSQL(sql_categories_title) %>', '<%= utilities.filterForSQL(sql_news_archives_title) %>', '<%= utilities.filterForSQL(sql_sign_guestbook_link) %>', '<%= utilities.filterForSQL(sql_comment_title) %>', '<%= utilities.filterForSQL(sql_signed_title) %>', '<%= utilities.filterForSQL(sql_stats_date) %>', <%= utilities.filterForSQL(sql_stats_count) %>, <%= utilities.filterForSQL(sql_stats_total_ms) %>, '<%= utilities.filterForSQL(sql_rss_description) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}


try  {
	String fname = new String();
	String lname = new String();
	String minit = new String();
	String uname = new String();
	String passw = new String();
	String email = new String();
	String website = new String();
	String info = new String();
	String bday = new String();
	String gender = new String();
	String mem_page = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "member");
	while(rs.next())  {
		fname = rs.getString("fname");
		lname = rs.getString("lname");
		minit = rs.getString("minit");
		uname = rs.getString("uname");
		passw = rs.getString("passw");
		email = rs.getString("email");
		website = rs.getString("website");
		info = rs.getString("info");
		bday = rs.getString("bday");
		gender = rs.getString("gender");
		mem_page = rs.getString("page");

		%>Insert into <%= utilities.filterForSQL(dbPrefix) %>member values('<%= utilities.filterForSQL(fname) %>', '<%= utilities.filterForSQL(lname) %>', '<%= utilities.filterForSQL(minit) %>', '<%= utilities.filterForSQL(uname) %>', '<%= utilities.filterForSQL(passw) %>', '<%= utilities.filterForSQL(email) %>', '<%= utilities.filterForSQL(website) %>', '<%= utilities.filterForSQL(info) %>', '<%= utilities.filterForSQL(bday) %>', '<%= utilities.filterForSQL(gender) %>', '<%= utilities.filterForSQL(mem_page) + "" %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}



try  {
	String uname = new String();
	String varsname = new String();
	String job = new String();
	String activated = new String();
	String regdate = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "member_site where varsname = '" + site_name + "'");
	while(rs.next())  {
		uname = rs.getString("uname");
		varsname = rs.getString("varsname");
		job = rs.getString("job");
		activated = rs.getString("activated");
		regdate = rs.getString("regdate");

		%>Insert into <%= dbPrefix %>member_site values('<%= utilities.filterForSQL(uname) %>', '<%= utilities.filterForSQL(varsname) %>', '<%= utilities.filterForSQL(job) %>', '<%= utilities.filterForSQL(activated) %>', '<%= utilities.filterForSQL(regdate) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}



try  {
	String guestid = new String();
	String name = new String();
	String email = new String();
	String website = new String();
	String comment = new String();
	String question = new String();
	String answer = new String();
	String dsign = new String();
	String varsname = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "guestbook where varsname = '" + site_name + "'");
	while(rs.next())  {
		guestid = rs.getString("guestid");
		name = rs.getString("name");
		email = rs.getString("email");
		website = rs.getString("website");
		comment = rs.getString("comment");
		question = rs.getString("question");
		answer = rs.getString("answer");
		dsign = rs.getString("dsign");
		varsname = rs.getString("varsname");

		%>Insert into <%= dbPrefix %>guestbook values(<%= utilities.filterForSQL(guestid) %>, '<%= utilities.filterForSQL(name) %>', '<%= utilities.filterForSQL(email) %>', '<%= utilities.filterForSQL(website) %>', '<%= utilities.filterForSQL(comment) %>', '<%= utilities.filterForSQL(question) %>', '<%= utilities.filterForSQL(answer) %>', '<%= utilities.filterForSQL(dsign) %>', '<%= utilities.filterForSQL(varsname) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}



try  {
	String newsid = new String();
	String sql_title = new String();
	String content = new String();
	String postdate = new String();
	String uname = new String();
	String cname = new String();
	String varsname = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "news where varsname = '" + site_name + "'");
	while(rs.next())  {
		newsid = rs.getString("newsid");
		sql_title = rs.getString("title");
		content = rs.getString("content");
		postdate = rs.getString("postdate");
		uname = rs.getString("uname");
		cname = rs.getString("cname");
		varsname = rs.getString("varsname");

		%>Insert into <%= dbPrefix %>news values(<%= utilities.filterForSQL(newsid) %>, '<%= utilities.filterForSQL(sql_title) %>', '<%= utilities.filterForSQL(content) %>', '<%= utilities.filterForSQL(postdate) %>', '<%= utilities.filterForSQL(uname) %>', '<%= utilities.filterForSQL(cname) %>', '<%= utilities.filterForSQL(varsname) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}



try  {
	String comid = new String();
	String name = new String();
	String email = new String();
	String homepage = new String();
	String comment = new String();
	String comdate = new String();
	String newsid = new String();
	String varsname = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "comment where varsname = '" + site_name + "'");
	while(rs.next())  {
		comid = rs.getString("comid");
		name = rs.getString("name");
		email = rs.getString("email");
		homepage = rs.getString("homepage");
		comment = rs.getString("comment");
		comdate = rs.getString("comdate");
		newsid = rs.getString("newsid");
		varsname = rs.getString("varsname");

		%>Insert into <%= dbPrefix %>comment values(<%= utilities.filterForSQL(comid) %>, '<%= utilities.filterForSQL(name) %>', '<%= utilities.filterForSQL(email) %>', '<%= utilities.filterForSQL(homepage) %>', '<%= utilities.filterForSQL(comment) %>', '<%= utilities.filterForSQL(comdate) %>', <%= utilities.filterForSQL(newsid) %>, '<%= utilities.filterForSQL(varsname) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}



try  {
	String stylename = new String();
	String sql_style = new String();
	String varsname = new String();

	rs = stmt.executeQuery("select * from " + dbPrefix + "style where varsname = '" + site_name + "'");
	while(rs.next())  {
		stylename = rs.getString("stylename");
		sql_style = rs.getString("style");
		varsname = rs.getString("varsname");

		%>Insert into <%= dbPrefix %>style values('<%= utilities.filterForSQL(stylename) %>', '<%= utilities.filterForSQL(sql_style) %>', '<%= utilities.filterForSQL(varsname) %>');
<%
	}
}
catch(Exception e)  {
	%><%= e.toString() %>
<%
}
%>SELECT setval('<%= dbPrefix %>news_seq', max(newsid), true) from <%= dbPrefix %>news;
SELECT setval('<%= dbPrefix %>comment_seq', max(comid), true) from <%= dbPrefix %>comment;
SELECT setval('<%= dbPrefix %>guestbook_seq', max(guestid), true) from <%= dbPrefix %>guestbook;
</textarea><br />
<input type="button" value="count" onclick="alert('Backup is ' + sql.value.length + ' characters long.')">
</form>
    </td>
  </tr>
</table>