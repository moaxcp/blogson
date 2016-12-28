<%
String mem_uname = new String();
if(request.getParameter("mem_uname") != null)
	mem_uname = request.getParameter("mem_uname");
%>
<hr />
[<a href="<%= response.encodeURL("member_page.jsp?uname=" + mem_uname) %>">view page</a>]<br />
<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Edit Page for <%= mem_uname %></td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<%
rs = stmt.executeQuery("select * from " + dbPrefix + "member where uname = '" + mem_uname + "'");

if(rs.first())  {
%>

<br />
<form name="e_page" onsubmit="return validate_form(e_page)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_e_mem_page&nav=" + nav + "&view=e_mem_page&mem_uname=" + mem_uname + "&site_name=" + site_name) %>">
      <table border=0 cellspacing=0 cellpadding=3>
	  <tr>
	    <td valign=top>Page:<br><input type="button" value="count" onclick="alert('Style is ' + ffff.value.length + ' characters long.')"></td>
	    <td><textarea name="page" id="ffff" rows=25 cols=60><%= rs.getString("page") %></textarea></td>
	  </tr>
	  <tr>
	    <td colspan=2 align=center><input type=submit value="Submit"></td>
	  </tr>
	</table>
</form>
<%
}
else  {
	%>Could not find <%= logged_uname %>'s page.<%
}
%>
    </td>
  </tr>
</table>