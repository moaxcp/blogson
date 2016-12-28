<form name="add_comment" onsubmit="return validate_form(add_comment)" method="POST" action="<%= response.encodeURL("index.jsp?nav=Home&action=f_comment&view=news_post&news_id=" + news_id + "&site_name=" + site_name) %>">
  <table class="mainModuleItem">
    <tr>
      <td class="mainModuleItemTitle">Add <%= comment_title %></td>
    </tr>
    <tr>
      <td class="mainModuleItemContent">
	<table width="100%" cellspacing=0 cellpadding=0 border=0>
	  <tr>
	    <td width=250>Name:</td>
	    <td><input type="text" name="name" size="40" maxlength=50></td>
	  </tr>
	  <tr>
	    <td>Email:</td>
	    <td><input type="text" name="email" size="40" maxlength=50></td>
	  </tr>
	  <tr>
	    <td>Website:</td>
	    <td><input type="text" name="homepage" size="40" value="http://" maxlength=75></td>
	  </tr>
	  <tr>
	    <td valign=top>Comment:<br><input type="button" value="count" onclick="alert('Comment is ' + comment.value.length + ' characters long.')"></td>
	    <td><textarea name="comment" rows="25" cols="60"></textarea></td>
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