<table class="sideModule">
  <tr>
    <td class="sideModuleTitle">Blogs</td>
  </tr>
  <tr>
    <td class="sideModuleContent">
      <table cellpadding="0" cellspacing="0" border="0" width="100%">

	<%

try  {
	rs = stmt.executeQuery("select varsname from " + dbPrefix + "site_vars group by varsname order by varsname");
	if(rs.first())  {
		rs.previous();

		while(rs.next())  {
			%>
			<tr>
			<td>
			<a class="sideModule_links" href="pages/?site_name=<%= rs.getString("varsname") %>"><%= rs.getString("varsname") %></a>
			</td>
			</tr>
			<%
		}
	}
	else  {
		%>
		None<br />
		<%
	}
}
catch(Exception e)  {
	%><%= e %><br /><%
}
	%>
	  </td>
	</tr>
      </table>
    </td>
  </tr>
</table>
<br />