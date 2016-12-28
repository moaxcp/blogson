<table class="mainModuleItem">
  <tr>
    <td class="mainModuleItemTitle">Create Style</td>
  </tr>
  <tr>
    <td class="mainModuleItemContent">
<br />
<form name="create_style" onsubmit="return validate_form(create_style)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_create_style&nav=Admin&view=all_styles&site_name=" + site_name) %>">
      <table border=0 cellspacing=0 cellpadding=3>
	  <tr>
	    <td valign="top">Style&nbsp;Name:</td>
	    <td><input type="text" size="30" name="stylename"></td>
	  </tr>
	  <tr>
	    <td valign=top>Style:<br><input type="button" value="count" onclick="alert('Style is ' + ffff.value.length + ' characters long.')"></td>
	    <td><textarea name="style" id="ffff" rows=25 cols=70></textarea></td>
	  </tr>
	  <tr>
	    <td colspan=2 align=center><input type=submit value="Submit"></td>
	  </tr>
	</table>
</form>
    </td>
  </tr>
</table>