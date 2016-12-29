<%
String member_uname = new String();

if(request.getParameter("member_uname") != null)  {
	member_uname = request.getParameter("member_uname");
}
else  {
	%>Missing parameter: member_uname<%
	return;
}

rs = stmt.executeQuery("Select fname, lname, minit, uname, job, email, website, info, bday, gender, activated, regdate, EXTRACT(DAY FROM regdate) as d, EXTRACT(MONTH FROM regdate) as m, EXTRACT(YEAR FROM regdate) as y FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site where uname = '" + member_uname + "' and varsname = '" + siteName + "'");

%>
<table class="mainModuleItem">
<%

String member_fname = new String();
String member_lname = new String();
String member_minit = new String();
String member_position = new String();
String member_email = new String();
String member_website = new String();
String member_info = new String();
String member_bday = new String();
String member_gender = new String();
String member_ddate = new String();
String member_mdate = new String();
String member_ydate = new String();

boolean member_activated = false;

if(rs.first())  {

	member_fname = rs.getString("fname");
	member_lname = rs.getString("lname");
	member_minit = rs.getString("minit");
	member_uname = rs.getString("uname");
	member_position = rs.getString("job");
	member_email = rs.getString("email");
	member_website = rs.getString("website");
	member_info = rs.getString("info");
	member_bday = rs.getString("bday");
	member_gender = rs.getString("gender");
	member_ddate = rs.getString("d");
	member_mdate = rs.getString("m");
	member_ydate = rs.getString("y");

	member_activated = rs.getBoolean("activated");

	%>
	  <tr>
	    <td class="mainModuleItemTitle">Profile for <%= member_uname %></td>
	  </tr>
	  <tr>
	    <td class="mainModuleItemContent">
	<table width="100%">
	  <tr>
	    <td>User Page</td>
	    <td>[<a href="<%= response.encodeURL("member_page.jsp?uname=" + member_uname) %>">click here</a>]</td>
	  </tr>
	  <tr>
	    <td>First Name</td>
	    <td><%= member_fname %></td>
	  </tr>
	  <tr>
	    <td>Last Name</td>
	    <td><%= member_lname %></td>
	  </tr>
	  <tr>
	    <td>Middle Initial</td>
	    <td><%= member_minit %></td>
	  </tr>
	  <tr>
	    <td>User Name</td>
	    <td><%= member_uname %></td>
	  </tr>
	  <tr>
	    <td>Registration Date</td>
	    <td><%= member_mdate %>/<%= member_ddate %>/<%= member_ydate %></td>
	  </tr>
	  <tr>
	    <td>Activated</td>
	    <td><%= member_activated %></td>
	  </tr>
	  <tr>
	    <td>Position</td>
	    <td><%= member_position %></td>
	  </tr>
	  <tr>
	    <td>Email Address</td>
	    <td><img src="<%= request.getContextPath() %>/emailpic/<%= member_uname %>"></td>
	  </tr>
	  <tr>
	    <td>Website</td>
	    <td><a href=<%= member_website %>><%= member_website %></a></td>
	  </tr>
	  <tr>
	    <td>Birth Day</td>
	    <td><%= member_bday %></td>
	  </tr>
	  <tr>
	    <td>Gender</td>
	    <td><%= member_gender %></td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan=2><%= member_info %></td>
	  </tr>
	</table>
	  </td>
	</tr>
	<%
}
else  {
	%>
	<tr>
	  <td>memid: <%= member_uname %> does not exist or is not activated.</td>
	</tr>
	<%
}
%>
</table>