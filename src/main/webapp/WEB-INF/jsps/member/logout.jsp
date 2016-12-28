<%

stmt.executeUpdate("UPDATE " + dbPrefix + "member SET sessionid = NULL WHERE sessionid = '" + session.getId() + "'");

session.invalidate();
logged=false;
logged_uname = "guest";
logged_position = "guest";

site_message = "You have been logged out";

%>