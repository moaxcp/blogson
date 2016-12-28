<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">rss</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">

info on rss for your page <a href="<%= response.encodeURL("rss91.jsp?site_name=" + site_name) %>">view rss</a><br />
<br />
<form name="admin" method="POST" action="<%= response.encodeURL("index.jsp?action=f_rss_desc&nav=Admin&view=rss&site_name=" + site_name) %>">
      <table width="100%">

	<%

		String rss_description;

		try  {

			rs = stmt.executeQuery("SELECT rss_description FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");

			if(rs.first())  {

				rss_description = rs.getString("rss_description");

				%>
				  <tr>
				    <td valign=top>Rss Description:<br><input type="button" value="count" onclick="alert('Description is ' + desc.value.length + ' characters long.')"></td>
				    <td><textarea name="desc" rows=25 cols=60><%= rss_description %></textarea></td>
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