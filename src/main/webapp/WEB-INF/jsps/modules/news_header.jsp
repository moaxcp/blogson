<%
String h_news = new String();
String m_news = new String();
String a_news = new String();

rs = stmt.executeQuery("select * from " + dbPrefix + "site_vars where varsname = '" + site_name + "'");

if(rs.first())  {
	h_news = rs.getString("h_news");
	m_news = rs.getString("m_news");
	a_news = rs.getString("a_news");
}
else  {
	%>
	There was a problem with site vars in news_header.jsp.
	<%
	return;
}
%>
<table class="newsHeader">
  <tr>
    <td class="newsHeaderContent">
	<%= h_news %>
	<%
	if(logged)  {
		%>
		<%= m_news %>
		<%
	}

	if(logged_position.equals("Administrator"))  {
		%>
		<%= a_news %>
		<%
	}
	%>
    </td>
  </tr>
</table>