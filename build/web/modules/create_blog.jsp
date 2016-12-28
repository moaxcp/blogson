<%
String agreement = new String();

rs = stmt.executeQuery("SELECT agreement FROM " + dbPrefix + "site_vars WHERE varsname = '" + site_name + "'");
if(rs.first())  {
	agreement = rs.getString("agreement");
}
else  {
	%>
	there was a problem with site vars in register.jsp.
	<%
	return;
}

%>
<form name="register"  onsubmit="return validate_form(register)" method="POST" action="<%= response.encodeURL("index.jsp?nav="+ nav + "&action=f_create_blog") %>">
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Sign Up</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
      <%= agreement %>
    </td>
  </tr>
</table>
<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Blog Information</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
      <table width="100%" cellspacing=0 cellpadding=0>
	<tr>
	  <td>Blog Name:</td>
	  <td><input type="text" name="BlogName" maxlength=50></td>
	</tr>
	<tr>
	  <td>Title:</td>
	  <td><input type="text" name="BlogTitle" maxlength=50></td>
	</tr>
	<tr>
	  <td>Owner Name:</td>
	  <td><input type="text" name="OwnerName" maxlength=50></td>
	</tr>
	<tr>
	  <td>Owner Email:</td>
	  <td><input type="text" name="OwnerEmail" maxlength=50></td>
	</tr>
      </table>
    </td>
  </tr>
</table>
<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Administrator Information</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
      <table width="100%" cellspacing=0 cellpadding=0>
	<tr>
	  <td>User Name:</td>
	  <td><input type="text" name="UserName" maxlength=50></td>
	</tr>
	<tr>
	  <td>Password:</td>
	  <td><input type="password" name="Password" maxlength=50></td>
	</tr>
	<tr>
	  <td>Password Again:</td>
	  <td><input type="password" name="Password2" maxlength=50></td>
	</tr>
	<tr>
	  <td>Email Address:</td>
	  <td><input type="text" name="Email" maxlength=50></td>
	</tr>
      </table>
    </td>
  </tr>
</table>
<br />
<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">&nbsp;</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent" style="text-align: center;">
      <input type=submit value="Submit">
    </td>
  </tr>
</table>
</form>