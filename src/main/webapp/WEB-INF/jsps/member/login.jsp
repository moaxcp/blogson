<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Log In</td>
  </tr>
  <tr>
    <td align=center class="mainModuleItemContent">
      <%
	if(!logged)  {
      %>
	    <form name="login" onsubmit="return validate_form(login)" action="<%= response.encodeURL("?action=f_login&nav=" + nav) %>" method="post">
	      <table cellpadding=0 cellspacing=0>
		<tr>
		  <td>User Name:</td>
		  <td><input type="text" name="user_name" size="12" maxlength=50></td>
		</tr>
		<tr>
		  <td>Password:</td>
		  <td><input type="password" name="password" size="12" maxlength=50></td>
		</tr>
		<tr>
		  <td>&nbsp;</td>
		  <td>
		    <input type="submit" name="login" value="login">
		  </td>
		</tr>
	      </table>
	    </form>
      <%
	}
	else  {
		%>
		You are already logged in.
		<%
	}
	%>
    </td>
  </tr>
</table>