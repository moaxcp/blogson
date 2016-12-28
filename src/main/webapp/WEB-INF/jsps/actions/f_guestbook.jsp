<%
String mess = "INSERT INTO " + dbPrefix + "guestbook VALUES(nextval('" + dbPrefix + "guestbook_seq')" +
	", '" + utilities.filterHTML(request.getParameter("Name")) +
	"', '" + utilities.filterHTML(request.getParameter("email")) +
	"', '" + utilities.filterHTML(request.getParameter("website")) +
	"', '" + utilities.filterHTML(request.getParameter("comment")) +
	"', '" + utilities.filterHTML(request.getParameter("question")) +
	"', '" + utilities.filterHTML(request.getParameter("answer")) +
	"', current_timestamp, '" + siteName + "')";

stmt.executeUpdate(mess);

site_message = "You have signed the guestbook";
%>