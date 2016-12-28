<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Member Agreement</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<form name="m_agreement"  onsubmit="return validate_form(m_agreement)" method="POST" action="<%= response.encodeURL("?action=f_m_agreement&nav=Admin&view=m_agreement") %>">
      <table width="100%">

	<%

		String admin_agreement;

		try  {

			rs = stmt.executeQuery("SELECT agreement FROM " + dbPrefix + "site_vars WHERE varsname = '" + siteName + "'");

			if(rs.first())  {

				admin_agreement = rs.getString("agreement");

				%>
				  <tr>
				    <td valign=top>Agreement:<br><input type="button" value="count" onclick="alert('Agreement is ' + agreement.value.length + ' characters long.')"></td>
				    <td><textarea name="agreement" rows=25 cols=60><%= admin_agreement %></textarea></td>
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