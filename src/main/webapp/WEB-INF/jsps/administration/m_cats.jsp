<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Categories</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<%

rs = stmt.executeQuery("Select distinct cname FROM " + dbPrefix + "news where varsname = '" + site_name + "'");

if(rs.first())  {
	rs.previous();
	%>
	<table width="100%">
	<tr>
	  <td width="200" valign=top>
	<table class="mainModuleItem">
	  <tr>
	    <th class="cell1">Categories</th>
	  </tr>
	<%

	String admin_cname = new String();

	boolean cell_two = true;
	String cellClass = "";

	while(rs.next())  {
			admin_cname = rs.getString("cname");

			cellClass = cell_two ? "cell1" : "cell2";

			%>
		  	<tr>
		  	  <td valign=top class="<%= cellClass %>"><%= admin_cname %></td>
		  	</tr>
			<%

			cell_two = !cell_two;
	}
	%>
	</table>
	</td>

	<td valign=top>
	  The following function can be used to edit the categories for news posts.<br>
	  <br>
	  Change Category Name:<br>
	  <form name="m_cats"  onsubmit="return validate_form(m_cats)" method="POST" action="<%= response.encodeURL("?action=f_m_cats&nav=Admin&view=m_cats&site_name=" + site_name) %>">
	    Category:&nbsp;<input name="category" type="text"><br>New Name:&nbsp;<input name="new_category" type="text"><br><input type="submit" value="Submit">
	  </form>
	</td>
	</tr>
	</table>
	<%
}
else  {
	%>
	  There are no categories in the Datebase<br><br>
	<%
}
%>
    </td>
  </tr>
</table>