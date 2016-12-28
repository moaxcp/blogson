<%
String guestbook_question = new String();

rs = stmt.executeQuery("select gbookquestion from " + dbPrefix + "site_vars where varsname = '" + site_name + "'");

if(rs.first())  {
	guestbook_question = rs.getString("gbookquestion");
}
else  {
	%>
	A record in site_vars is not defined as use. ie. attribute: use = true.
	<%
	return;
}
%>

<form name="s_guestbook"  onsubmit="return validate_form(sign_guestbook)" method="POST" action="<%= response.encodeURL("?nav=Guestbook&action=f_guestbook&site_name=" + site_name) %>">
  <table class="mainModuleItem">
    <tr>
      <td class="mainModuleItemTitle">Sign Guestbook</td>
    </tr>
    <tr>
      <td class="mainModuleItemContent">
	<table width="100%" cellspacing=0 cellpadding=0 border=0>
	  <tr>
	    <td width=250>Name:</td>
	    <td><input type="text" name="Name" size="40" maxlength=100></td>
	  </tr>
	  <tr>
	    <td>Email:</td>
	    <td><input type="text" name="email" size="40" maxlength=50></td>
	  </tr>
	  <tr>
	    <td>Website:</td>
	    <td><input type="text" name="website" size="40" value="http://" maxlength=50></td>
	  </tr>
	  <tr>
	    <td colspan="2"><%= guestbook_question %></td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td><input type="text" name="answer" size="40" maxlength=200></td>
	  </tr>
	  <tr>
	    <td valign=top>Comment:<br><input type="button" value="count" onclick="alert('Comment is ' + comment.value.length + ' characters long.')"></td>
	    <td><textarea name="comment" rows="25" cols="60"></textarea></td>
	  </tr>
	  <tr>
	    <td><input type=hidden name="question" value="<%= guestbook_question %>"></td>
	    <td><input type=submit value="Submit"></td>
	  </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
