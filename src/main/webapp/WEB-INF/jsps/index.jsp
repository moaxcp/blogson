<!--
 * Author: John Mercier
 * Date:   1.26.03
 * v0.90
 * Author: John Mercier
 * Date:   8.22.03
 * v0.93a
 * Author: John Mercier
 * Date:   10.31.03
 * v0.93
 * Author: John Mercier
 * Date:   11.12.03
 * v0.94
 *
 * see versions for details
-->
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.github.moaxcp.blogson.utilities" %>

<%

/***************************************************************
 * site variables variables
 **************************************************************/
 //TODO could probably get this from an access log
long load_time = System.currentTimeMillis();
String site_message = new String();
String siteName = "main";

if(request.getAttribute("siteName") != null)  {
	siteName = (String) request.getAttribute("siteName");
}

//TODO remove once converted to path variables
String site_name = siteName;

/***************************************************************
 * CONNECTION
 **************************************************************/
%>
<%@ include file="connection.jsp" %>
<%


/***************************************************************
 * NEWS CAT GLOBAL FOR ACTIONS -- THIS IS MOSTLY A BAD HACK...
 **************************************************************/
String news_cat = new String();

if(request.getParameter("category") != null)  {
	news_cat = request.getParameter("category");
}

/*****************************************************************
 * SESSION
 ****************************************************************/
session = request.getSession(true);
session.setMaxInactiveInterval(3600);




/*****************************************************************
 * USER VARS
 ****************************************************************/
String logged_uname = new String("guest");
String logged_position = new String("guest");

boolean logged = false;

if(session.getAttribute("uname") != null)  {

	rs = stmt.executeQuery("select * from " + dbPrefix + "member natural join " + dbPrefix + "member_site where uname = '" + session.getAttribute("uname") + "' and sessionid = '" + session.getId() + "' and varsname = '" + siteName + "'");
	if(rs.first())  {
		logged_uname = (String)session.getAttribute("uname");
		logged_position = rs.getString("job");
		logged = true;
	}
}





/***************************************************************
 * ACTIONS PREFORMED
 **************************************************************/
%>
<%@ include file="action.jsp"%>
<%


/***************************************************************
 * SITE VARS
 **************************************************************/
String title = new String();
String header = new String();
String footer = new String();
String ownername = new String();
String owneremail = new String();
String siteurl = new String();
String style = new String();
String metatags = new String();
String left_side = new String();
String right_side = new String();

String home_nav = new String();
String members_nav = new String();
String guestbook_nav = new String();
String user_nav = new String();
String member_nav = new String();
String admin_nav = new String();
String welcome_user = new String();
String stats_title = new String();
String categories_title = new String();
String news_archives_title = new String();
String sign_guestbook_link = new String();
String comment_title = new String();
String signed_title = new String();



rs = stmt.executeQuery("SELECT * FROM " + dbPrefix + "site_vars WHERE varsname = '" + siteName + "'");
if(rs.first())  {
	title = rs.getString("title");
	header = rs.getString("header");
	footer = rs.getString("footer");
	ownername = rs.getString("ownername");
	owneremail = rs.getString("owneremail");
	siteurl = rs.getString("siteurl");
	style = rs.getString("style");
	metatags = rs.getString("metatags");
	left_side = rs.getString("left_side");
	right_side = rs.getString("right_side");

	home_nav = rs.getString("home_nav");
	members_nav = rs.getString("members_nav");
	guestbook_nav = rs.getString("guestbook_nav");
	user_nav = rs.getString("user_nav");
	member_nav = rs.getString("member_nav");
	admin_nav = rs.getString("admin_nav");
	welcome_user = rs.getString("welcome_user");
	stats_title = rs.getString("stats_title");
	categories_title = rs.getString("categories_title");
	news_archives_title = rs.getString("news_archives_title");
	sign_guestbook_link = rs.getString("sign_guestbook_link");
	comment_title = rs.getString("comment_title");
	signed_title = rs.getString("signed_title");
}
else  {
	%>
	site_message += "There is something wrong with site_vars";
	<%
}
//END SITE VARS***************************************************




/*****************************************************************
 * VIEW VARS
 ****************************************************************/
String nav = new String("Home");

if(request.getParameter("nav") != null)
	nav = request.getParameter("nav");

%>

<head>
<%= style %>
<title>
  <%= title %>
</title>
<script language="Javascript" src="${pageContext.request.contextPath}/js/javascript.js"></script>
<link rev="made" href="mailto:<%= owneremail %>" />
<%= metatags %>
<meta name="author" content="<%= ownername %>" />
</head>
<body>
<table width="100%" boarder="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <%= header %>
    </td>
  </tr>
  <tr>
    <td>
	<%@ include file="modules/nav.jsp"%>

<table class="tabMain" cellspacing="0" cellpadding="0">
  <tr>
    <td class="bigTitle" colspan="3"><%= nav %></td>
  </tr>
  <tr>
    <td class="userMessageArea" colspan="3">
	<%
	if(!logged)  {
      		%>
		[<a href="<%= response.encodeURL("?view=login&nav=" + nav) %>">login</a>] [<a href="<%= response.encodeURL("?view=register&nav=" + nav) %>">register</a>]
		<%
	}
	else  {
		%>
		<%= welcome_user %> <%= logged_uname %> [<a href="<%= response.encodeURL("?action=logout") %>">logout</a>] |
		<%
		if(logged)  {
			%>[<a href="<%= response.encodeURL("?nav=Member") %>"><%= member_nav %></a>]<%
		}
		if(logged && (logged_position.equals("User") || logged_position.equals("Administrator")))  {
			%> | [<a href="<%= response.encodeURL("?nav=User") %>"><%= user_nav %></a>]<%
		}
		if(logged && logged_position.equals("Administrator"))  {
			%> | [<a href="<%= response.encodeURL("?nav=Admin") %>"><%= admin_nav %></a>] <%
		}
	}
	%>
    </td>
  </tr>
  <tr>

    <td class="leftCell">
      <%@ include file="leftcell.jsp" %>
    </td>
    <td class="mainCell">
      <%@ include file="maincell.jsp" %>
    </td>
    <td class="rightCell">
      <%@ include file="rightcell.jsp" %>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <%= footer %>
    </td>
  </tr>
</table>
    </td>
  </tr>
  <tr>
    <td>
      <table class="software_copy_table" cellspacing="0" cellpadding="0">
	<tr>
	  <td class="software_copyright_cell">
	    <span style="float:left;position:relative">
	      Software created by moaxcp
	    </span>
	    <span style="float:right;position:relative">
	      Creation time: <% load_time = System.currentTimeMillis() - load_time + ((Long) request.getAttribute("controllerTime") / 1000000); %><%= load_time %>ms
	    </span>
	  </td>
	</tr>
	<tr>
	  <td>
	      ${controllerTime}
	  </td>
	</tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

<%
stmt.executeUpdate("update " + dbPrefix + "site_vars set stats_count = stats_count + 1, stats_total_ms = stats_total_ms + " + load_time + " where varsname = '" + siteName + "'");

con.close();
%>
