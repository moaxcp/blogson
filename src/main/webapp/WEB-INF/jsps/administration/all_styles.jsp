<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">All Styles</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
[<a href=<%= response.encodeURL("index.jsp?nav=Admin&view=create_style&site_name=" + site_name) %>>add style</a>]<br />
<br />
<%
rs = stmt.executeQuery("select * from " + dbPrefix + "style");

if(rs.first())  {
	rs.previous();
	%>
	<table width="100%">
	  <tr>
	    <th>Style Name</th>
	    <th>Site</th>
	    <th>Edit</th>
	    <th>Delete</th>
	  </tr>
	<%

	boolean cell_two = true;
	String cellClass = "";

	while(rs.next())  {

		cellClass = cell_two ? "cell1" : "cell2";

		%>
		<tr>
		  <td class="<%= cellClass %>"><%= rs.getString("stylename") %></td>
		  <td class="<%= cellClass %>"><%= rs.getString("varsname") %></td>
		  <td class="<%= cellClass %>"><%
			if(rs.getString("varsname").equals(site_name))  {
				%><a href="<%= response.encodeURL("index.jsp?stylename=" + rs.getString("stylename") + "&nav=Admin&view=e_style&site_name=" + site_name) %>">Edit</a><%
			}
			else  {
				%>&nbsp;<%
			}
		  %></td>
		  <td class="<%= cellClass %>"><%
			if(rs.getString("varsname").equals(site_name))  {
				%><a href="<%= response.encodeURL("index.jsp?action=d_style&stylename=" + rs.getString("stylename") + "&nav=Admin&view=all_styles&site_name=" + site_name) %>">Delete</a><%
			}
			else  {
				%>&nbsp;<%
			}
		  %></td>
		</tr>
		<%
		cell_two = !cell_two;
	}
	%>
	</table>
	<%
}
%>
    </td>
  </tr>
</table>