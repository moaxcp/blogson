<br />
<%
String comid = new String();

if(request.getParameter("comid") != null)  {
	comid = request.getParameter("comid");
}

else  {
	%>Parameter missing: comid<%
	return;
}

rs = stmt.executeQuery("Select * FROM " + dbPrefix + "comment where varsname = '" + site_name + "' and comid = " + comid);

String comment_name, comment_email, comment_homepage, comment_comment, comment_newsid;

if(rs.first())  {
	comment_name = rs.getString("name");
	comment_email = rs.getString("email");
	comment_homepage = rs.getString("homepage");
	comment_comment = rs.getString("comment");
	comment_newsid = rs.getString("newsid");
%>
<form name="e_comment" onsubmit="return validate_form(e_comment)" method="POST" action="<%= response.encodeURL("?nav=Home&view=news_post&news_id=" + comment_newsid + "&action=f_e_comment&comid=" + comid + "&site_name=" + site_name) %>">
  <table class="mainModuleItem">
    <tr>
      <td class="mainModuleItemTitle">Edit Comment</td>
    </tr>
    <tr>
      <td class="mainModuleItemContent">
	<table width="100%" cellspacing=0 cellpadding=0 border=0>
	  <tr>
	    <td width=250>Name:</td>
	    <td><input type="text" name="name" size="40" maxlength=50 value="<%= comment_name %>"></td>
	  </tr>
	  <tr>
	    <td>Email:</td>
	    <td><input type="text" name="email" size="40" maxlength=50 value="<%= comment_email %>"></td>
	  </tr>
	  <tr>
	    <td>Website:</td>
	    <td><input type="text" name="homepage" size="40" maxlength=75 value="<%= comment_homepage %>"></td>
	  </tr>
	  <tr>
	    <td valign=top>Comment:<br><input type="button" value="count" onclick="alert('Comment is ' + comment.value.length + ' characters long.')"></td>
	    <td><textarea name="comment" rows="25" cols="60"><%= comment_comment %></textarea></td>
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
<%
}
else  {
	%>Could not find comment<%
}
%>
