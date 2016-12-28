<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Edit Style</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<%
String stylename = new String();

if(request.getParameter("stylename") != null)
		stylename = request.getParameter("stylename");

rs = stmt.executeQuery("select * from " + dbPrefix + "style where stylename = '" + stylename + "'");

if(rs.first())  {
%>

<br />
<form name="e_style" onsubmit="return validate_form(e_style)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_e_style&stylename=" + stylename + "&nav=Admin&view=e_style&site_name=" + site_name) %>">
      <table border=0 cellspacing=0 cellpadding=3>
	  <tr>
	    <td valign="top">Style&nbsp;Name:</td>
	    <td><%= rs.getString("stylename") %></td>
	  </tr>
	  <tr>
	    <td valign=top>Style:<br><input type="button" value="count" onclick="alert('Style is ' + ffff.value.length + ' characters long.')"></td>
	    <td><textarea name="style" id="ffff" rows=25 cols=70><%= rs.getString("style") %></textarea></td>
	  </tr>
	  <tr>
	    <td colspan=2 align=center><input type=submit value="Submit"></td>
	  </tr>
	</table>
</form>
<%
}
else  {
	%>Could not find <%= stylename %>.<%
}
%>
    </td>
  </tr>
</table>