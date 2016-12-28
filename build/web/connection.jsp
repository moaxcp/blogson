<%
Connection con = null;
Statement stmt = null;
ResultSet rs   = null;


/*****************************************************************
 * WHEN INSTALLING SHOULD ONLY HAVE TO EDIT THESE
 ****************************************************************/

String driver = "org.postgresql.Driver";
String url = "jdbc:postgresql://localhost/blogson";
String username = "john";
String password = "lemonhead8849";
String dbPrefix = "blogson_";

try {
	Class.forName(driver); 
	con = DriverManager.getConnection(url,username,password);
}
catch (Exception ex) {
	%><%= ex %><%
	return;
}

stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

%>
