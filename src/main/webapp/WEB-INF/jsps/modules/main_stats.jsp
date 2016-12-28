      <table class="sideModule">
	<tr>
	  <td class="sideModuleTitle">Main Stats</td>
	</tr>
	<tr>
	  <td class="sideModuleContent">
	    <%
		try  {
		rs = stmt.executeQuery("SELECT COUNT(varsname) FROM " + dbPrefix + "site_vars");
		if(rs.first())  {
			%> <span style="float:left;position:relative">Blogs:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(distinct cname) FROM " + dbPrefix + "news");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= categories_title %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(newsid) FROM " + dbPrefix + "news");
		if(rs.first())  {
			%> <span style="float:left;position:relative">Posts:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(comid) FROM " + dbPrefix + "comment");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= comment_title %>s:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(uname) FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= members_nav %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}

		rs = stmt.executeQuery("SELECT COUNT(guestid) FROM " + dbPrefix + "guestbook");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= guestbook_nav %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		%> <br> <%


		rs = stmt.executeQuery("select sum(stats_count) as t_hits, sum(stats_total_ms) as t_time, EXTRACT(YEAR FROM stats_date) as year, EXTRACT(MONTH FROM stats_date) as month, EXTRACT(DAY FROM stats_date) as d from " + dbPrefix + "site_vars group by stats_date order by stats_date");

		if(rs.first())  {
			%>
			<span style="float:left;position:relative">Hits:</span><span style="float:right;position:relative"><%= rs.getInt("t_hits") %></span><br>
			<span style="float:left;position:relative">Average Time:</span><span style="float:right;position:relative"><%= rs.getInt("t_hits") > 0 ? rs.getInt("t_time") / rs.getInt("t_hits") : 0 %></span><br>
			<span style="float:left;position:relative">Since:</span><span style="float:right;position:relative"><%= utilities.getZeros(rs.getInt("month")) + "/" + utilities.getZeros(rs.getInt("d")) + "/" + utilities.getZeros(rs.getInt("year")) %></span><br>
			<%
		}
		}
		catch(Exception e)  {
			%><%= e %><%
		}
	    %>
	  </td>
	</tr>
      </table>