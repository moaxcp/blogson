<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Titles and Labels</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
	<%

		String admin_home_nav, admin_members_nav, admin_guestbook_nav, admin_member_nav, admin_user_nav, admin_admin_nav;
		String admin_welcome_user, admin_stats_title, admin_categories_title, admin_news_archives_title, admin_sign_guestbook_link, admin_comment_title, admin_signed_title;


		try  {

			rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");

			if(rs.first())  {

				admin_home_nav = rs.getString("home_nav");
				admin_members_nav = rs.getString("members_nav");
				admin_guestbook_nav = rs.getString("guestbook_nav");
				admin_member_nav = rs.getString("member_nav");
				admin_user_nav = rs.getString("user_nav");
				admin_admin_nav = rs.getString("admin_nav");
				admin_welcome_user = rs.getString("welcome_user");
				admin_stats_title = rs.getString("stats_title");
				admin_categories_title = rs.getString("categories_title");
				admin_news_archives_title = rs.getString("news_archives_title");
				admin_sign_guestbook_link = rs.getString("sign_guestbook_link");
				admin_comment_title = rs.getString("comment_title");
				admin_signed_title = rs.getString("signed_title");


				%><form name="m_titles" onsubmit="return validate_form(m_titles)" method="POST" action="<%= response.encodeURL("?action=f_titles&nav=Admin&view=m_titles&site_name=" + site_name) %>">
				  <table width="100%">
				  <tr>
				    <td valign=top>Home Navigation:</td>
				    <td><input type="text" name="home_nav" size="40" value="<%= admin_home_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Members Navigation:</td>
				    <td><input type="text" name="members_nav" size="40" value="<%= admin_members_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Guestbook Navigation:</td>
				    <td><input type="text" name="guestbook_nav" size="40" value="<%= admin_guestbook_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Member Navigation:</td>
				    <td><input type="text" name="member_nav" size="40" value="<%= admin_member_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>User Navigation:</td>
				    <td><input type="text" name="user_nav" size="40" value="<%= admin_user_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Admin Navigation:</td>
				    <td><input type="text" name="admin_nav" size="40" value="<%= admin_admin_nav %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Welcom User:</td>
				    <td><input type="text" name="welcome_user" size="40" value="<%= admin_welcome_user %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Stats Title:</td>
				    <td><input type="text" name="stats_title" size="40" value="<%= admin_stats_title %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Categories Title:</td>
				    <td><input type="text" name="categories_title" size="40" value="<%= admin_categories_title %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>News Archives Title:</td>
				    <td><input type="text" name="news_archives_title" size="40" value="<%= admin_news_archives_title %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Sign Guestbook Link:</td>
				    <td><input type="text" name="sign_guestbook_link" size="40" value="<%= admin_sign_guestbook_link %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Comment Title:</td>
				    <td><input type="text" name="comment_title" size="40" value="<%= admin_comment_title %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td valign=top>Signed Title:</td>
				    <td><input type="text" name="signed_title" size="40" value="<%= admin_signed_title %>" maxlength=100></td>
				  </tr>
				  <tr>
				    <td colspan=2 align=center><input type=submit value="Submit"></td>
				  </tr>
				</table>
				</form>
				<%

			}
		}

		catch(Exception e)  {
			%>
			There was an error creating page:<br> <%= e %>
			<%
		}

%>
    </td>
  </tr>
</table>