<%

try  {
	String blog_style = new String();
	String blogName = new String(request.getParameter("BlogName"));

	rs = stmt.executeQuery("select * from " + dbPrefix + "style");
	if(rs.first())  {
		blog_style = rs.getString("style");
	}
	else  {
		blog_style = "Please apply a style because this is messed up";
	}

	String mess = "INSERT INTO " + dbPrefix + "site_vars VALUES('" +
		request.getParameter("BlogName") +
		"', '" + request.getParameter("BlogTitle") +
		"', 'Header. Edit this from the admin section" +
		"', 'Footer. Edit this from the admin section" +
		"', 'Agreement. Edit this from the admin section" +
		"', 'h_news" +
		"', 'm_news" +
		"', 'a_news" +
		"', '" + request.getParameter("OwnerName") +
		"', '" + request.getParameter("OwnerEmail") +
		"', 'siteurl" +
		"', 10, 10, 10, 25" +
		", '" + blog_style +
		"', 'What is a good question?" +
		"', '<!-- put meta tags here -->" +
		"', 'left_side', 'right_side', 'Blog', 'Members', 'Guestbook', 'User', 'Admin', 'Welcome ', 'Blog Stats', 'Categories', 'Archives', 'sign guestbook', 'Comment', 'signed', current_timestamp, 0, 0, 'description')";

	stmt.executeUpdate(mess);

	try  {

		mess = "INSERT INTO " + dbPrefix + "member VALUES(" +
			"null, null, null, '" +
			request.getParameter("UserName") +
			"', '" + request.getParameter("Password") +
			"', '" + request.getParameter("Email") +
			"')";

		stmt.executeUpdate(mess);


		try  {

			mess = "Insert Into " + dbPrefix + "member_site values('" + request.getParameter("UserName") +
				"', '" + blogName +
				"', 'Administrator', true, current_timestamp)";

			stmt.executeUpdate(mess);
		}
		catch(Exception t)  {
			stmt.executeUpdate("delete from " + dbPrefix + "member where uname = '" + request.getParameter("UserName") + "'");
			throw new Exception();
		}
	}
	catch(Exception e)  {
		stmt.executeUpdate("delete from " + dbPrefix + "site_vars where varsname = '" + blogName + "'");
	}


	site_message = "You have been registered successfuly!";
}
catch(SQLException e)  {
	site_message = "There was a problem during registration: " + e;
}
%>
