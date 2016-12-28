<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Member Management</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">

<%
int start = 0;
int inc = 25;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	inc = rs.getInt("nummember");
}
else  {
	%>
	A record in site_vars is not defined as use. ie. attribute: use = true.
	<%
	return;
}

rs = stmt.executeQuery("Select * FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site where varsname = '" + site_name + "' ORDER BY regdate desc limit " + inc + " offset " + start);

%>
<table width="100%">
<%

if(rs.first())  {
	rs.previous();
	%>

	  <tr>
	    <th class="cell1">User&nbsp;Name</th>
	    <th class="cell1">Activated</th>
	    <th class="cell1">Position</th>
	    <th class="cell1">Action</th>
	  </tr>
	<%

	String mem_uname = new String();
	String mem_act = new String();
	String mem_position = new String();

	boolean cell_two = true;
	String memCellClass = "";

	while(rs.next())  {
			mem_uname = rs.getString("uname");
			mem_act = rs.getString("activated");
			mem_position = rs.getString("job");

			memCellClass = cell_two ? "cell1" : "cell2";

			%>
		  	<tr>
		  	  <td valign=top class="<%= memCellClass %>"><a href="<%= response.encodeURL("index.jsp?nav=Members&view=member&member_uname=" + mem_uname + "&site_name=" + site_name) %>"><%= mem_uname %></a></td>
		  	  <td valign=top class="<%= memCellClass %>"><%= mem_act %></td>
		  	  <td valign=top class="<%= memCellClass %>"><%= mem_position %></td>
		  	  <td valign=top class="<%= memCellClass %>">[<a href="<%= response.encodeURL("index.jsp?nav=" + nav + "&view=e_mem_page&mem_uname=" + mem_uname + "&site_name=" + site_name) %>">page</a>]&nbsp;|&nbsp;[<a href="<%= response.encodeURL("index.jsp?nav=" + nav + "&view=m_profile&a_uname=" + mem_uname + "&site_name=" + site_name) %>">edit</a>]&nbsp;|&nbsp;[<a href="<%= response.encodeURL("index.jsp?nav=" + nav + "&view=" + view + "&action=d_member&a_uname=" + mem_uname + "&site_name=" + site_name) %>">delete</a>]</td>
		  	</tr>
			<%

			cell_two = !cell_two;
	}
	%>
	<%--
	<tr>
	  <td colspan=4>
	    <span style="float:left;position:relative">
	<%

	if(start - inc >= 0)  {
		%>
		<a href="<%= response.encodeURL("index.jsp?nav=Members&start=" + (start - inc) + "&site_name=" + site_name) %>"> Previous </a>
		<%
	}

	rs = stmt.executeQuery("select count(uname) as c from " + dbPrefix + "member where varsname = '" + site_name + "' and uname in (select uname from " + dbPrefix + "member ORDER BY regdate desc)");
	rs.first();

	%>
	&nbsp;&nbsp;&nbsp;&nbsp;Showing

	<%= start %>

	through <%
	if(start + inc <= rs.getInt("c"))  {
		%><%= start + inc %><%
	}
	else  {
		%><%= rs.getInt("c") %><%
	}

	%> of <%= rs.getInt("c") %></span>

	<%
	rs = stmt.executeQuery("select count(uname) as c from " + dbPrefix + "member where varsname = '" + site_name + "' and uname in (select uname from " + dbPrefix + "member ORDER BY regdate desc limit " + inc + " offset " + (start + inc) + ")");
	rs.first();

	if(rs.getInt("c") > 0)  {
		%>
		<span style="float:right;position:relative"><a href="<%= response.encodeURL("index.jsp?nav=Members&start=" + (start + inc) + "&site_name=" + site_name) %>"> Next </a></span>
		<%
	}
	%>
	  </td>
	</tr>
	--%>
	<%
}
else  {
	%>
	<tr>
	  <td>There are no members in the Datebase</td>
	</tr>
	<%
}
%>
</table>
    </td>
  </tr>
</table>