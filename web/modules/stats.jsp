      <table class="sideModule">
	<tr>
	  <td class="sideModuleTitle"><%= stats_title %></td>
	</tr>
	<tr>
	  <td class="sideModuleContent">
	    <%
		try  {
		rs = stmt.executeQuery("SELECT COUNT(distinct cname) FROM " + dbPrefix + "news where varsname = '" + site_name + "'");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= categories_title %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(newsid) FROM " + dbPrefix + "news where varsname = '" + site_name + "'");
		if(rs.first())  {
			%> <span style="float:left;position:relative">Posts:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(comid) FROM " + dbPrefix + "comment where varsname = '" + site_name + "'");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= comment_title %>s:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		rs = stmt.executeQuery("SELECT COUNT(uname) FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site where varsname = '" + site_name + "'");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= members_nav %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}

		rs = stmt.executeQuery("SELECT COUNT(guestid) FROM " + dbPrefix + "guestbook where varsname = '" + site_name + "'");
		if(rs.first())  {
			%> <span style="float:left;position:relative"><%= guestbook_nav %>:</span> <span style="float:right;position:relative"><%= rs.getString("count") %></span><br> <%
		}
		%> <br> <%

		/**

		rs = stmt.executeQuery("SELECT guestid, name, EXTRACT(DAY FROM dsign) as d, EXTRACT(MONTH FROM dsign) as m, EXTRACT(YEAR FROM dsign) as y FROM " + dbPrefix + "guestbook where varsname = '" + site_name + "' order by dsign desc limit 1");
		if(rs.first())  {
			%>
			<span style="float:left;position:relative">New Guest:</span> <span style="float:right;position:relative"><%= rs.getString("name") %></span><br>
			<%
		}
		rs = stmt.executeQuery("Select uname, EXTRACT(DAY FROM regdate) as d, EXTRACT(MONTH FROM regdate) as m, EXTRACT(YEAR FROM regdate) as y FROM " + dbPrefix + "member where varsname = '" + site_name + "' order by regdate desc limit 1");
		if(rs.first())  {
			%>
			<span style="float:left;position:relative">New Member:</span><span style="float:right;position:relative"><%= rs.getString("uname") %></span><br>
			<%
		}

		*/

		rs = stmt.executeQuery("select stats_count, stats_total_ms, EXTRACT(YEAR FROM stats_date) as year, EXTRACT(MONTH FROM stats_date) as month, EXTRACT(DAY FROM stats_date) as d from " + dbPrefix + "site_vars where varsname = '" + site_name + "'");

		if(rs.first())  {
			%>
			<span style="float:left;position:relative">Hits:</span><span style="float:right;position:relative"><%= rs.getInt("stats_count") %></span><br>
			<span style="float:left;position:relative">Average Time:</span><span style="float:right;position:relative"><%= rs.getInt("stats_count") > 0 ? rs.getInt("stats_total_ms") / rs.getInt("stats_count") : 0 %></span><br>
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