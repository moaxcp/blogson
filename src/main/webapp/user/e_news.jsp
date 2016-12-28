<br />
      <%
		int newsid = -1;

		if(request.getParameter("newsid") != null)
			newsid = Integer.valueOf(request.getParameter("newsid")).intValue();

		if(logged_position.equals("Administrator"))  {
			rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "news JOIN " + dbPrefix + "member ON " + dbPrefix + "news.uname = " + dbPrefix + "member.uname WHERE " + dbPrefix + "news.varsname = '" + site_name + "' and newsid = " + newsid);
			if(rs.first())  {
				logged_uname = rs.getString("uname");
			}
		}

		rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "news WHERE newsid = " + newsid + " AND uname = '" + logged_uname + "' and varsname = '" + site_name + "'");
		if(rs.first())  {
			String news_newsid, news_title, news_content, news_ddate, news_mdate, news_ydate, news_hdate, news_mindate, news_uname, news_comments, news_cname;
			news_newsid = rs.getString("newsid");
			news_title = rs.getString("title");
			news_content = rs.getString("content");
			news_uname = rs.getString("uname");
			news_cname = rs.getString("cname");
      %>
	<table class="mainModuleItem">
	  <tr>
	    <td class="mainModuleItemTitle">Edit News</td>
	  </tr>
	  <tr>
	    <td class="mainModuleItemContent">
      <form name="e_news"  onsubmit="return validate_form(e_news)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_enews&nav=Home&newsid=" + newsid + "&site_name=" + site_name) %>">
      <table>
	<tr>
	  <td colspan=2>Warning! HTML code is accepted.  Do not post html that could screw up the page. ex. &lt;/table&gt;</td>
	</tr>
	<tr>
	  <td>Title:</td>
	  <td><input size="70" type="text" name="title" value="<%= news_title %>" maxlength=100></td>
	</tr>
	<tr>
	  <td valign=top>Category:</td>
	  <td>
	    <input size="70" type="text" name="category" maxlength=100 value="<%= news_cname %>">
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td>Categories:</td>
	  <td>
	<%
	rs = stmt.executeQuery("SELECT cname FROM " + dbPrefix + "news where varsname = '" + site_name + "' group by cname");
	if(rs.first())  {
		rs.previous();

		while(rs.next())  {
			%>
			<%= rs.getString("cname") %>;
			<%
		}
	}
	else  {
		%>
		none
		<%
	}
	%>
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	<tr>
	  <td valign=top>News:<br><input type="button" value="count" onclick="alert('News is ' + news.value.length + ' characters long.')"></td>
	  <td>
	    <TEXTAREA NAME="news" ROWS=25 COLS=60><%= news_content %></TEXTAREA>
	  </td>
	</tr>
	<tr>
	  <td><input type="hidden" name="newsid" value="<%= newsid %>"></td>
	  <td align=left><input type=submit value="Submit"></td>
	</tr>
      </table>
      </form>
	</td>
	</tr>
	</table>
      <%
		}
		else  {
			%> Cannot edit posts that are not yours. <%
		}
      %>
