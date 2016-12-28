[<a href="<%= response.encodeURL("index.jsp?nav=Guestbook&view=s_guestbook&site_name=" + site_name ) %>"><%= sign_guestbook_link %></a>]<br>
<br>

<%
int start = 0;
int inc = 25;

if(request.getParameter("start") != null && Integer.valueOf(request.getParameter("start")).intValue() >= 0)
	start = Integer.valueOf(request.getParameter("start")).intValue();

rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	inc = rs.getInt("numguestbook");
}
else  {
	%>
	There was a problem with site vars in guestbook.jsp
	<%
	return;
}

rs = stmt.executeQuery("Select guestid, name, email, website, comment, question, answer, dsign, EXTRACT(DAY FROM dsign) as d, EXTRACT(MONTH FROM dsign) as m, EXTRACT(YEAR FROM dsign) as y FROM " + dbPrefix + "guestbook where varsname = '" + site_name + "' ORDER BY dsign desc limit " + inc + " offset " + start);

if(rs.first())  {
	rs.previous();
	
	String guest_id = new String();
	String guest_name = new String();
	String guest_mdate = new String();
	String guest_ddate = new String();
	String guest_ydate = new String();
	String guest_email = new String();
	String guest_website = new String();
	String guest_comment = new String();
	String guest_question = new String();
	String guest_answer = new String();

	while(rs.next())  {
		guest_id = rs.getString("guestid");
		guest_name = rs.getString("name");
		guest_mdate = utilities.getZeros(rs.getInt("m"));
		guest_ydate = rs.getString("y");
		guest_ddate = utilities.getZeros(rs.getInt("d"));
		guest_email = rs.getString("email");
		guest_website = rs.getString("website");
		guest_comment = rs.getString("comment");
		guest_question = rs.getString("question");
		guest_answer = rs.getString("answer");

			%>
			    <table class="mainModuleItem">
			      <tr>
				<td class="mainModuleItemTitle">
				  <span style="float:left;position:relative">
			<%
			if(guest_email.equals(""))  {
				%>
				<%= guest_name %>
				<%
			}
			else  {
				%>
				<a href="mailto:<%= guest_email %>"><%= guest_name %></a>
				<%
			}

			%>
			</span>
			<%

			if(!guest_website.equals(""))  {
				%>
				<span style="float:right;position:relative"><a href=<%= guest_website %>>Web Address</a></span>
				<%
			}
			%>

				</td>
			      </tr>
			      <tr>
				<td class="mainModuleItemContent"><dl><dt>Comment:</dt><dd><%= guest_comment %></dd><dt><br><%= guest_question %>:<dt><dd><%= guest_answer %></dd></dl></td>
			      </tr>
			      <tr>
				<td class="mainModuleItemSubTitle"><span style="float:left;position:relative"><%= signed_title %>: <%= guest_mdate %>/<%= guest_ddate %>/<%= guest_ydate %> by <%= guest_name %></span>
				  <span style="float:right;position:relative">
					<%
					if(logged_position.equals("Administrator"))  {
						%>
						[<a href="<%= response.encodeURL("index.jsp?nav=Admin&view=e_guestbook&guestid=" + guest_id + "&site_name=" + site_name) %>">edit</a>] [<a href="<%= response.encodeURL("index.jsp?nav=Guestbook&action=d_guestbook&g_id=" + guest_id + "&site_name=" + site_name) %>">delete</a>]
						<%
					}
					%>
				  </span>
				</td>
			      </tr>
			    </table>
			    <br>
			<%
	}
	%>
	    <span style="float:left;position:relative">
	<%

	if(start - inc >= 0)  {
		%>
		<a href="<%= response.encodeURL("index.jsp?nav=Guestbook&start=" + (start - inc) + "&site_name=" + site_name) %>"> Previous </a>
		<%
	}

	rs = stmt.executeQuery("select count(guestid) as c from " + dbPrefix + "guestbook where varsname = '" + site_name + "' and guestid in (select guestid from " + dbPrefix + "guestbook ORDER BY dsign desc)");
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
	rs = stmt.executeQuery("select count(guestid) as c from " + dbPrefix + "guestbook where varsname = '" + site_name + "' and guestid in (select guestid from " + dbPrefix + "guestbook ORDER BY dsign desc limit " + inc + " offset " + (start + inc) + ")");
	rs.first();

	if(rs.getInt("c") > 0)  {
		%>
		<span style="float:right;position:relative"><a href="<%= response.encodeURL("index.jsp?nav=Guestbook&start=" + (start + inc) + "&site_name=" + site_name) %>"> Next </a></span>
		<%
	}
}
else  {
	%>
	There are no guests in the Datebase
	<%
}
%>