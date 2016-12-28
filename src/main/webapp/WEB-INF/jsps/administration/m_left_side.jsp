<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Left Side</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<form name="m_left_side"  onsubmit="return validate_form(m_left_side)" method="POST" action="<%= response.encodeURL("?action=f_m_left_side&nav=Admin&view=m_left_side") %>">
      <table width="100%">

	<%

		String admin_left_side;

		try  {

			rs = stmt.executeQuery("SELECT left_side FROM " + dbPrefix + "site_vars WHERE varsname = '" + siteName + "'");

			if(rs.first())  {

				admin_left_side = rs.getString("left_side");

				%>
				  <tr>
				    <td valign=top>Left Side:<br><input type="button" value="count" onclick="alert('Left Side is ' + left_side.value.length + ' characters long.')"></td>
				    <td><textarea name="left_side" rows=25 cols=60><%= admin_left_side %></textarea></td>
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