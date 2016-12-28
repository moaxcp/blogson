<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Stats</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<%
rs = stmt.executeQuery("select stats_date, stats_count, stats_total_ms from " + dbPrefix + "site_vars where varsname = '" + site_name + "'");

if(rs.first())  {
	%>

	Date Started: <%= rs.getString("stats_date") %><br>
	Times loaded: <%= rs.getInt("stats_count") %><br>
	Total Time: <%= rs.getInt("stats_total_ms") %><br>
	Average Time: <%= rs.getInt("stats_count") > 0 ? rs.getInt("stats_total_ms") / rs.getInt("stats_count") : 0 %><br>
	<br>
	[<a href="<%= response.encodeURL("?action=f_reset_stats&nav=Admin&view=m_stats&site_name=" + site_name) %>">reset time</a>]<br>

	<%
}
else {
	%>
	There are no stats at this time
	<%
}
%>
    </td>
  </tr>
</table>