<%
String site_action = new String("");

if(request.getParameter("action") != null)
	site_action = request.getParameter("action");

if(site_action.equals("f_guestbook"))  {
	%>
	<%@ include file="actions/f_guestbook.jsp" %>
	<%
}
else if(site_action.equals("f_registration"))  {
	%>
	<%@ include file="actions/f_registration.jsp" %>
	<%
}
else if(site_action.equals("f_comment"))  {
	%>
	<%@ include file="actions/f_comment.jsp" %>
	<%
}
else if(site_action.equals("f_login"))  {
	%>
	<%@ include file="member/f_login.jsp"%>
	<%
}
else if(site_action.equals("logout") && (logged_position.equals("Member") || logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="member/logout.jsp" %>
	<%
}
else if(site_action.equals("f_profile") && (logged_position.equals("Member") || logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="member/f_profile.jsp" %>
	<%
}
else if(site_action.equals("f_e_page") && (logged_position.equals("Member") || logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="member/f_e_page.jsp" %>
	<%
}
else if(site_action.equals("f_news") && (logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="user/f_news.jsp" %>
	<%
	news_cat = "";
}
else if(site_action.equals("f_enews") && (logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="user/f_enews.jsp" %>
	<%
	news_cat = "";
}
else if(site_action.equals("f_dnews") && (logged_position.equals("User") || logged_position.equals("Administrator")))  {
	%>
	<%@ include file="user/f_dnews.jsp" %>
	<%
}
else if(site_action.equals("f_admin") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_site_vars.jsp" %>
	<%
}
else if(site_action.equals("f_titles") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_titles.jsp" %>
	<%
}
else if(site_action.equals("f_m_agreement") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_agreement.jsp" %>
	<%
}
else if(site_action.equals("f_m_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_style.jsp" %>
	<%
}
else if(site_action.equals("f_m_left_side") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_left_side.jsp" %>
	<%
}
else if(site_action.equals("f_m_right_side") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_right_side.jsp" %>
	<%
}
else if(site_action.equals("d_member") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/d_member.jsp" %>
	<%
}
else if(site_action.equals("f_m_profile") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_profile.jsp" %>
	<%
}
else if(site_action.equals("d_guestbook") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/d_guestbook.jsp" %>
	<%
}
else if(site_action.equals("f_e_guestbook") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_e_guestbook.jsp" %>
	<%
}
else if(site_action.equals("d_comment") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/d_comment.jsp" %>
	<%
}
else if(site_action.equals("f_e_comment") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_e_comment.jsp" %>
	<%
}
else if(site_action.equals("f_m_cats") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_m_cats.jsp" %>
	<%
}
else if(site_action.equals("f_reset_stats") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_reset_stats.jsp" %>
	<%
}
else if(site_action.equals("f_purple_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_purple_style.jsp" %>
	<%
}
else if(site_action.equals("f_blue_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_blue_style.jsp" %>
	<%
}
else if(site_action.equals("f_rss_desc") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_rss_desc.jsp" %>
	<%
}
else if(site_action.equals("f_set_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_set_style.jsp" %>
	<%
}
else if(site_action.equals("d_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/d_style.jsp" %>
	<%
}
else if(site_action.equals("f_create_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_create_style.jsp" %>
	<%
}
else if(site_action.equals("f_e_style") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_e_style.jsp" %>
	<%
}
else if(site_action.equals("f_e_mem_page") && logged_position.equals("Administrator"))  {
	%>
	<%@ include file="administration/f_e_mem_page.jsp" %>
	<%
}
%>