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

<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Registration</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
      <%
	if(!logged)  {
      %>
      <br>
      <form name="register"  onsubmit="return validate_form(register)" method="POST" action="<%= response.encodeURL("index.jsp?nav="+ nav + "&action=f_registration&site_name=" + site_name) %>">
      <table width="100%" cellspacing=0 cellpadding=0>
	<tr>
	  <td colspan=2>
		<%= agreement %><br>
		<br>* = required information.
	  </td>
	</tr>
	<tr>
	  <td>First Name:</td>
	  <td><input type="text" name="FirstName" maxlength=50></td>
	</tr>
	<tr>
	  <td>Middle Initial:</td>
	  <td><input type="text" name="MiddleInit" maxlength=1></td>
	</tr>
	<tr>
	  <td>Last Name:</td>
	  <td><input type="text" name="LastName"maxlength=50></td>
	</tr>
	<tr>
	  <td>*User Name:</td>
	  <td><input type="text" name="UserName" maxlength=50></td>
	</tr>
	<tr>
	  <td>*Password:</td>
	  <td><input type="password" name="Password" maxlength=50></td>
	</tr>
	<tr>
	  <td>*Password Again:</td>
	  <td><input type="password" name="Password2" maxlength=50></td>
	</tr>
	<tr>
	  <td>*Email Address:</td>
	  <td><input type="text" name="Email" maxlength=50></td>
	</tr>
	<tr>
	  <td>Website:</td>
	  <td><input type="text" name="Website" maxlength=50 value="http://"></td>
	</tr>
	<tr>
	  <td>Gender:</td>
	  <td>
	      <select name="Gender">
		<option value=""></option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
	      </select>
	  </td>
	</tr>
	<tr>
	  <td>*Date of Birth:</td>
	  <td><select name="BirthMonth" onchange="changeMonth(BirthMonth, BirthDay)">
		<option value=""></option>
		<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
	  	</select>
	  	<select name="BirthDay">
		<option value=""></option>
		<script language=javascript>
			for(var i = 1; i <= 31; i++)  {
				document.writeln("		<option value=\"" + i + "\">" + i + "</option>");
			}
		</script>
	  	</select>
	  	<select name="BirthYear" onchange="changeYear(BirthYear, BirthMonth, BirthDay)">
		<option value=""></option>
		<script language=javascript>
			var cur_date = new Date();
			var year = cur_date.getYear();
			if(year < 1900) year += 1900;

			for(var i = year; i >= year - 100; i--)  {
				document.writeln("		<option value=\"" + i + "\">" + i + "</option>");
			}
		</script>
	  	</select>
	  </td>
	</tr>
	<tr>
	  <td valign=top>Information About You:<br><input type="button" value="count" onclick="alert('Info is ' + info.value.length + ' characters long.')"></td>
	  <td><TEXTAREA NAME="info" ROWS=25 COLS=50></TEXTAREA><br>
		</td>
	</tr>
	<tr>
	  <td colspan=2 align=center><input type=submit value="Submit"></td>
	</tr>
      </table>
      </form>
      <%
	}
	else  {
		%>
		You are already a logged in registered user!
		<%
	}
      %>
    </td>
  </tr>
</table>