<br /><%
String guestid = new String();
String name = new String();
String email = new String();
String website = new String();
String comment = new String();
String question = new String();
String answer = new String();
String dsign = new String();

if(request.getParameter("guestid") != null)
		guestid = request.getParameter("guestid");

rs = stmt.executeQuery("select * from " + dbPrefix + "guestbook where varsname = '" + site_name + "' and guestid = " + guestid);

if(rs.first())  {
	name = rs.getString("name");
	email = rs.getString("email");
	website = rs.getString("website");
	comment = rs.getString("comment");
	question = rs.getString("question");
	answer = rs.getString("answer");
	dsign = rs.getString("dsign");
}
else  {
	%>
	site_message = "Could not find guest.";
	<%
	return;
}
%>

<form name="e_guestbook" onsubmit="return validate_form(e_guestbook)" method="POST" action="<%= response.encodeURL("index.jsp?nav=Guestbook&action=f_e_guestbook&guestid=" + guestid + "&site_name=" + site_name) %>">
  <table class="mainModuleItem">
    <tr>
      <td class="mainModuleItemTitle">Edit Guestbook</td>
    </tr>
    <tr>
      <td class="mainModuleItemContent">
	<table width="100%" cellspacing=0 cellpadding=0 border=0>
	  <tr>
	    <td width=250>Name:</td>
	    <td><input type="text" name="name" value="<%= name %>" maxlength=100></td>
	  </tr>
	  <tr>
	    <td>Email:</td>
	    <td><input type="text" name="email" value="<%= email %>" maxlength=50></td>
	  </tr>
	  <tr>
	    <td>Website:</td>
	    <td><input type="text" name="website" value="<%= website %>" maxlength=50></td>
	  </tr>
	  <tr>
	    <td>*<%= question %></td>
	    <td><input type="text" name="answer" value="<%= answer %>" maxlength=200></td>
	  </tr>
	  <tr>
	    <td valign=top>Comment:<br><input type="button" value="count" onclick="alert('Comment is ' + comment.value.length + ' characters long.')"></td>
	    <td><textarea name="comment" rows="25" cols="60"><%= comment %></textarea></td>
	  </tr>
	  <tr>
	    <td>Signed</td>
	    <td><%= dsign %></td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td><input type=submit value="Submit"></td>
	  </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
