<%
String news_month = new String();
String news_year = new String();

if(request.getParameter("news_month") != null && request.getParameter("news_year") != null)  {
	news_month = request.getParameter("news_month");
	news_year = request.getParameter("news_year");
}
%>

<table class="sideModule">
	<tr>
	  <td class="sideModuleTitle"><%= news_archives_title %></td>
	</tr>
	<tr>
	  <td class="sideModuleContent">
	    <table cellpadding=0 cellspacing=0 border=0 width="100%">
	<%
	try  {
		rs = stmt.executeQuery("SELECT EXTRACT(YEAR FROM postdate) as year, EXTRACT(MONTH FROM postdate) as month, COUNT(newsid) FROM " + dbPrefix + "news where varsname = '" + siteName + "' GROUP BY year, month ORDER BY year, month;");

		if(rs.first())  {
			rs.previous();

			String amonth = "";
			String ayear = "";
			while(rs.next())  {
				amonth = utilities.getZeros(rs.getInt("month"));
				ayear = rs.getString("year");
				%>
				
				<tr>
				  <td>
				<%
				if(amonth.equals(news_month) && ayear.equals(news_year))  {
					%>
					<a class="sideModule_links_active" href="<%= response.encodeURL("?news_month=" + amonth + "&news_year=" + ayear) %>">
					<%
				}
				else  {
					%>
					<a class="sideModule_links" href="<%= response.encodeURL("?news_month=" + amonth + "&news_year=" + ayear) %>">
					<%
				}
				%>
				    <%= amonth + "/" + ayear %>&nbsp;&nbsp;(<%= rs.getString("count") %>)</a>
				  </td>
				</tr>
				<%
			}
		}
		else  {
			%> N/A <%
		}
	}
	catch(Exception e)  {
		%> N/A <%
	}
	%>
	    </table>
	  </td>
	</tr>
      </table>