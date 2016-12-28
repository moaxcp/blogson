<%
/***********************************************************
 * MAIN CELL VARS
 **********************************************************/
String view = new String("");

if(request.getParameter("view") != null)
	view = request.getParameter("view");


//END MAIN CELL VARS **************************************




if(!site_message.equals(""))  {
	%>
	<table class="siteMessage">
	  <tr>
	    <td class="siteMessageTitle">Message</td>
	  </tr>
	  <tr>
	    <td class="siteMessageContent">
		<%= site_message %>
	    </td>
	  </tr>
	</table>
	<br>
	<%
}

%>
<%@ include file="modules/news_header.jsp" %>
<br>
<%
if(view.equals("register"))  {
	%>
	<%@ include file="modules/register.jsp" %>
	<%
}

else if(view.equals("login"))  {
	%>
	<%@ include file="member/login.jsp" %>
	<%
}
else if(nav.equals("Home"))  {

	if(view.equals(""))
		view = "news";

	if(view.equals("news"))  {
		%>
		<%@ include file="modules/news.jsp" %>
		<%
	}
	else if(view.equals("news_post"))  {
		%>
		<%@ include file="modules/news_post.jsp" %>
		<%
	}
}
else if(nav.equals("Members"))  {

	if(view.equals(""))
		view = "members";

	if(view.equals("members"))  {
		%>
		<%@ include file="modules/members.jsp" %>
		<%
	}
	else if(view.equals("member"))  {
		%>
		<%@ include file="modules/member.jsp" %>
		<%
	}
}
else if(nav.equals("Guestbook"))  {
	if(view.equals(""))
		view = "guestbook";

	if(view.equals("guestbook"))  {
		%>
		<%@ include file="modules/guestbook.jsp" %>
		<%
	}
	else if(view.equals("s_guestbook"))  {
		%>
		<%@ include file="modules/s_guestbook.jsp" %>
		<%
	}
}
else if(nav.equals("Comments"))  {

	if(view.equals("comments"))  {
		%>
		<%@ include file="modules/comments.jsp" %>
		<%
	}
}
else if(nav.equals("Member"))  {
	%>
	<%@ include file="member/member.jsp" %>
	<%
	if(view.equals("profile"))  {
		%>
		<%@ include file="member/profile.jsp" %>
		<%
	}
	else if(view.equals("e_page"))  {
		%>
		<%@ include file="member/e_page.jsp" %>
		<%
	}
}
else if(nav.equals("User"))  {

	%>
	<%@ include file="user/user.jsp" %>
	<%

	if(view.equals("p_news"))  {
		%>
		<%@ include file="user/p_news.jsp" %>
		<%
	}
	else if(view.equals("e_news"))  {
		%>
		<%@ include file="user/e_news.jsp" %>
		<%
	}
}

else if(nav.equals("Admin") && logged_position.equals("Administrator"))  {

	%><%@ include file="administration/admin.jsp" %><%

	if(view.equals("site_vars"))  {
		%>
		<%@ include file="administration/site_vars.jsp" %>
		<%
	}
	else if(view.equals("m_titles"))  {
		%>
		<%@ include file="administration/m_titles.jsp" %>
		<%
	}
	else if(view.equals("m_style"))  {
		%>
		<%@ include file="administration/m_style.jsp" %>
		<%
	}
	else if(view.equals("m_agreement"))  {
		%>
		<%@ include file="administration/m_agreement.jsp" %>
		<%
	}
	else if(view.equals("m_left_side"))  {
		%>
		<%@ include file="administration/m_left_side.jsp" %>
		<%
	}
	else if(view.equals("m_right_side"))  {
		%>
		<%@ include file="administration/m_right_side.jsp" %>
		<%
	}
	else if(view.equals("m_member"))  {
		%>
		<%@ include file="administration/m_member.jsp" %>
		<%
	}
	else if(view.equals("m_cats"))  {
		%>
		<%@ include file="administration/m_cats.jsp" %>
		<%
	}
	else if(view.equals("m_stats"))  {
		%>
		<%@ include file="administration/m_stats.jsp" %>
		<%
	}
	else if(view.equals("rss"))  {
		%>
		<%@ include file="administration/rss.jsp" %>
		<%
	}
	else if(view.equals("m_profile"))  {
		%>
		<%@ include file="administration/m_profile.jsp" %>
		<%
	}
	else if(view.equals("e_guestbook"))  {
		%>
		<%@ include file="administration/e_guestbook.jsp" %>
		<%
	}
	else if(view.equals("e_comment"))  {
		%>
		<%@ include file="administration/e_comment.jsp" %>
		<%
	}
	else if(view.equals("all_styles"))  {
		%>
		<%@ include file="administration/all_styles.jsp" %>
		<%
	}
	else if(view.equals("create_style"))  {
		%>
		<%@ include file="administration/create_style.jsp" %>
		<%
	}
	else if(view.equals("e_style"))  {
		%>
		<%@ include file="administration/e_style.jsp" %>
		<%
	}
	else if(view.equals("sqlbackup"))  {
		%>
		<%@ include file="administration/sqlbackup.jsp" %>
		<%
	}
	else if(view.equals("e_mem_page"))  {
		%>
		<%@ include file="administration/e_mem_page.jsp" %>
		<%
	}
}
%>