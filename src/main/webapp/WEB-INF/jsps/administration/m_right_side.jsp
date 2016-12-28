<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Right Side</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<form name="m_right_side" onsubmit="return validate_form(m_right_side)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_m_right_side&nav=Admin&view=m_right_side&site_name=" + site_name) %>">
      <table width="100%">

	<%

		String admin_right_side;

		try  {

			rs = stmt.executeQuery("SELECT right_side FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");

			if(rs.first())  {

				admin_right_side = rs.getString("right_side");

				%>
				  <tr>
				    <td valign=top>Right Side:<br><input type="button" value="count" onclick="alert('Right Side is ' + right_side.value.length + ' characters long.')"></td>
				    <td><textarea name="right_side" rows=25 cols=60><%= admin_right_side %></textarea></td>
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