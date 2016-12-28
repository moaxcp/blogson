</br>
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Post News</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
      <br>
      <form name="p_news" onsubmit="return validate_form(p_news)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_news&nav=Home&site_name=" + site_name) %>">
      <table>
	<tr>
	  <td>Title:</td>
	  <td><input size=70 type="text" name="title" maxlength=100></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td valign=top>Category:</td>
	  <td>
	    <input size=70 type="text" name="category" maxlength=100>
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td>Categories:</td>
	  <td>
	<%
	rs = stmt.executeQuery("SELECT cname FROM " + dbPrefix + "news where varsname = '" + site_name + "' group by cname");
	if(rs.first())  {
		rs.previous();

		while(rs.next())  {
			%>
			<%= rs.getString("cname") %>;
			<%
		}
	}
	else  {
		%>
		none
		<%
	}
	%>
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td valign=top>News:<br><input type="button" value="count" onclick="alert('News is ' + news.value.length + ' characters long.')"></td>
	  <td>
	    <TEXTAREA NAME="news" ROWS=25 COLS=60></TEXTAREA>
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td align=left><input type=submit value="Submit"></td>
	</tr>
      </table>
      </form>
    </td>
  </tr>
</table>
