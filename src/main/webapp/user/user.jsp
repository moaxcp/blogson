<h1>User Area</h1><hr />
[<a href="<%= response.encodeURL("index.jsp?nav=" + nav + "&view=p_news&site_name=" + site_name) %>">post news</a>]<br><br />
Note!: I create a servlet that generates your email address in an image. This can be used at any time to save your email from spam bots. ex: <img src="/servlet/EmailPic?uname=<%= logged_uname %>" /><br />