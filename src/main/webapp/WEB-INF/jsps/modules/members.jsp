<%
int start = 0;
int inc = 25;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + siteName + "'");
if(rs.first())  {
	inc = rs.getInt("nummember");
}
else  {
	%>
	There was a problem with site vars in members.jsp
	<%
	return;
}

try  {
	rs = stmt.executeQuery("Select uname, job, email, regdate, EXTRACT(DAY FROM regdate) as d, EXTRACT(MONTH FROM regdate) as m, EXTRACT(YEAR FROM regdate) as y FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site where varsname = '" + siteName + "' ORDER BY regdate desc limit " + inc + " offset " + start);
}
catch(Exception e)  {
	site_message = "There was a problem getting the members: " + e;
	%><%= site_message %><%
	return;
}

%>
<table class="mainModuleItem">
<%

if(rs.first())  {
	rs.previous();
	%>

	  <tr>
	    <th class="cell1">User&nbsp;Name</th>
	    <th class="cell1">Date&nbsp;Registered</th>
	    <th class="cell1">Position</th>
	    <th class="cell1">Email</th>
	  </tr>
	<%

	String mem_uname = new String();
	String mem_ddate = new String();
	String mem_mdate = new String();
	String mem_ydate = new String();
	String mem_position = new String();
	String mem_email = new String();

	boolean cell_two = true;
	String memCellClass = "";

	while(rs.next())  {
			mem_uname = rs.getString("uname");
			mem_ddate = utilities.getZeros(rs.getInt("d"));
			mem_mdate = utilities.getZeros(rs.getInt("m"));
			mem_ydate = rs.getString("y");
			mem_position = rs.getString("job");
			mem_email = rs.getString("email");

			memCellClass = cell_two ? "cell1" : "cell2";

			%>
		  	<tr>
		  	  <td valign=top class="<%= memCellClass %>"><a href="<%= response.encodeURL("?nav=Members&view=member&member_uname=" + mem_uname) %>"><%= mem_uname %></a></td>
		  	  <td valign=top class="<%= memCellClass %>"><%= mem_mdate %>/<%= mem_ddate %>/<%= mem_ydate %></td>
		  	  <td valign=top class="<%= memCellClass %>"><%= mem_position %></td>
		  	  <td valign=top class="<%= memCellClass %>"><img src="<%= request.getContextPath() %>/emailpic/<%= mem_uname %>"></td>
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
		<a href="<%= response.encodeURL("?nav=Members&start=" + (start - inc)) %>"> Previous </a>
		<%
	}

	rs = stmt.executeQuery("select count(uname) as c from " + dbPrefix + "member where varsname = '" + siteName + "' and uname in (select uname from " + dbPrefix + "member where varsname = '" + siteName + "' ORDER BY regdate desc)");
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
	rs = stmt.executeQuery("select count(uname) as c from " + dbPrefix + "member where varsname = '" + siteName + "' and uname in (select uname from " + dbPrefix + "member where varsname = '" + siteName + "' ORDER BY regdate desc limit " + inc + " offset " + (start + inc) + ")");
	rs.first();

	if(rs.getInt("c") > 0)  {
		%>
		<span style="float:right;position:relative"><a href="<%= response.encodeURL("?nav=Members&start=" + (start + inc)) %>"> Next </a></span>
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