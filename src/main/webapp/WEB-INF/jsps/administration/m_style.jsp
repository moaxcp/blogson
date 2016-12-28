<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">My Style</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">

<%
rs = stmt.executeQuery("select * from " + dbPrefix + "style");

if(rs.first())  {
	rs.previous();

	while(rs.next())  {
		%>
		[<a href=<%= response.encodeURL("?action=f_set_style&nav=Admin&view=m_style&stylename=" + rs.getString("stylename") + "&site_name=" + site_name) %>><%= rs.getString("stylename") %></a>]
		<%
	}
}
%><br />
NOTE! Using the style links above will replace your current style<br>

<form name="m_style" onsubmit="return validate_form(m_style)" method="POST" action="<%= response.encodeURL("?action=f_m_style&nav=Admin&view=m_style&site_name=" + site_name) %>">
      <table width="100%">

	<%

		String admin_style;

		try  {

			rs = stmt.executeQuery("SELECT style FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");

			if(rs.first())  {

				admin_style = rs.getString("style");

				%>
				  <tr>
				    <td valign=top>Style:<br><input type="button" value="count" onclick="alert('Style is ' + ffff.value.length + ' characters long.')"></td>
				    <td><textarea name="style" id="ffff" rows=25 cols=60><%= admin_style %></textarea></td>
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