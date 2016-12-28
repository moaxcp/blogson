<table class="sideModule">
	<tr>
	  <td class="sideModuleTitle"><%= categories_title %></td>
	</tr>
	<tr>
	  <td class="sideModuleContent">
	    <table cellpadding=0 cellspacing=0 border=0 width="100%">
	<%
	try  {
		//johnmercier_net=# select category.cname, count(news.cname) from jblogrc2_category as category join jblogrc2_news as news on category.cname = news.cname group by category.cname, news.cname;
		rs = stmt.executeQuery("SELECT cname, count(cname) FROM " + dbPrefix + "news where varsname = '" + site_name + "' group by cname");

		if(rs.first())  {
			rs.previous();

			while(rs.next())  {
				%>
				<tr>
				  <td>
				<%
				  if(news_cat.equals(rs.getString("cname")))  {
					%>
					<a class="sideModule_links_active" href="<%= response.encodeURL("index.jsp?category=" + rs.getString("cname") + "&site_name=" + site_name) %>">
					<%
				  }
				  else  {
					%>
				  	<a class="sideModule_links" href="<%= response.encodeURL("index.jsp?category=" + rs.getString("cname") + "&site_name=" + site_name) %>">
					<%
				  }
				  %>
				    <%= rs.getString("cname") %>&nbsp;&nbsp;(<%= rs.getString("count") %>)</a>
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
