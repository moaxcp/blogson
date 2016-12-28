<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Site Variables</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<form name="site_vars" onsubmit="return validate_form(site_vars)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_admin&nav=Admin&view=site_vars&site_name=" + site_name) %>">
      <table width="100%">

	<%

		String admin_varsname, admin_title, admin_header, admin_footer, admin_h_news, admin_m_news, admin_a_news, admin_ownername, admin_owneremail, admin_siteurl, admin_gbookquestion, admin_metatags;
		int admin_numnews, admin_numguestbook, admin_numcomment, admin_nummember;

		try  {

			rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");

			if(rs.first())  {

				admin_varsname = rs.getString("varsname");
				admin_title = rs.getString("title");
				admin_header = rs.getString("header");
				admin_footer = rs.getString("footer");
				admin_h_news = rs.getString("h_news");
				admin_m_news = rs.getString("m_news");
				admin_a_news = rs.getString("a_news");
				admin_ownername = rs.getString("ownername");
				admin_owneremail = rs.getString("owneremail");
				admin_siteurl = rs.getString("siteurl");
				admin_gbookquestion = rs.getString("gbookquestion");
				admin_metatags = rs.getString ("metatags");

				admin_numnews = rs.getInt("numnews");
				admin_numguestbook = rs.getInt("numguestbook");
				admin_numcomment = rs.getInt("numcomment");
				admin_nummember = rs.getInt("nummember");

				%>
				  <tr>
				    <td valign=top>Title:</td>
				    <td><input type="text" name="title" size="40" value="<%= admin_title %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td valign=top>Header:<br><input type="button" value="count" onclick="alert('Header is ' + header.value.length + ' characters long.')"></td>
				    <td><textarea name="header" rows=10 cols=50><%= admin_header %></textarea></td>
				  </tr>
				  <tr>
				    <td valign=top>Footer:<br><input type="button" value="count" onclick="alert('Footer is ' + footer.value.length + ' characters long.')"></td>
				    <td><textarea name="footer" rows=10 cols=50><%= admin_footer %></textarea></td>
				  </tr>
				  <tr>
				    <td valign=top>News Header:<br><input type="button" value="count" onclick="alert('News header is ' + h_news.value.length + ' characters long.')"></td>
				    <td><TEXTAREA NAME="h_news" ROWS=5 COLS=50><%= admin_h_news %></TEXTAREA></td>
				  </tr>
				  <tr>
				    <td valign=top>Member News:<br><input type="button" value="count" onclick="alert('Member news is ' + m_news.value.length + ' characters long.')"></td>
				    <td><textarea name="m_news" rows=5 cols=50><%= admin_m_news %></textarea></td>
				  </tr>
				  <tr>
				    <td valign=top>Admin News:<br><input type="button" value="count" onclick="alert('Admin news is ' + a_news.value.length + ' characters long.')"></td>
				    <td><textarea name="a_news" rows=5 cols=50><%= admin_a_news %></textarea></td>
				  </tr>
				  <tr>
				    <td valign=top>Owner Name:</td>
				    <td><input type="text" name="ownername" size="40" value="<%= admin_ownername %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Owner Email:</td>
				    <td><input type="text" name="owneremail" size="40" value="<%= admin_owneremail %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Site Url:</td>
				    <td><input type="text" name="siteurl" size="40" value="<%= admin_siteurl %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Number News:</td>
				    <td><input type="text" name="numnews" size="40" value="<%= admin_numnews %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Number Guestbook:</td>
				    <td><input type="text" name="numguestbook" size="40" value="<%= admin_numguestbook %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Number Comment:</td>
				    <td><input type="text" name="numcomment" size="40" value="<%= admin_numcomment %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Number Member:</td>
				    <td><input type="text" name="nummember" size="40" value="<%= admin_nummember %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Guestbook Question:</td>
				    <td><input type="text" name="gbookquestion" size="40" value="<%= admin_gbookquestion %>"></td>
				  </tr>
				  <tr>
				    <td valign=top>Meta Tags:<br><input type="button" value="count" onclick="alert('Meta tags are ' + metatags.value.length + ' characters long.')"><br></td>
				    <td><textarea name="metatags" rows=15 cols=50><%= admin_metatags %></textarea></td>
				  </tr>
				  <tr>
				    <td colspan=2 align=center><input type=submit value="Submit"></td>
				  </tr>
				<%

			}
		}

		catch(Exception e)  {
			%>
			There was an error creating page:<br> <%= e %>
			<%
		}

%>
	</table>
</form>
    </td>
  </tr>
</table>