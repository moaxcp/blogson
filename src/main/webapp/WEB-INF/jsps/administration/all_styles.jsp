<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">All Styles</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
[<a href=<%= response.encodeURL("?nav=Admin&view=create_style") %>>add style</a>]<br />
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
			if(rs.getString("varsname").equals(siteName))  {
				%><a href="<%= response.encodeURL("?stylename=" + rs.getString("stylename") + "&nav=Admin&view=e_style") %>">Edit</a><%
			}
			else  {
				%>&nbsp;<%
			}
		  %></td>
		  <td class="<%= cellClass %>"><%
			if(rs.getString("varsname").equals(siteName))  {
				%><a href="<%= response.encodeURL("?action=d_style&stylename=" + rs.getString("stylename") + "&nav=Admin&view=all_styles") %>">Delete</a><%
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