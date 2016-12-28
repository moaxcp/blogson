<%@ page import="java.sql.*" %><%@ page import="blogson.*" %><%@ page contentType="text/html" %><%
/***************************************************************
 * CONNECTION
 **************************************************************/
%><%@ include file="connection.jsp" %><%

/***************************************************************
 * SITE VARS
 **************************************************************/
String uname = new String();

if(request.getParameter("uname") != null)  {
		uname = request.getParameter("uname");
}
else  {
	%>Member page not found in db.<%
	return;
}
String mem_page = new String();

rs = stmt.executeQuery("SELECT page FROM " + dbPrefix + "member WHERE uname = '" + uname + "'");
if(rs.first())  {
	mem_page = rs.getString("page");
}
%><%= mem_page %><%
con.close();
%>