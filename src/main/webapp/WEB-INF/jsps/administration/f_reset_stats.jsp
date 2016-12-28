<%
try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET stats_date = current_timestamp, stats_count = 0, stats_total_ms = 0 WHERE varsname = '" + siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your stats has been reset!";

}
catch(SQLException e)  {
	site_message = "There was a problem during resetting stats: " + e;
}
%>