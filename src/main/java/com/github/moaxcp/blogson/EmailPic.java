package com.github.moaxcp.blogson;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.imageio.*;

public class EmailPic extends HttpServlet  {

	public void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException  {

		OutputStream out = response.getOutputStream();
		PrintWriter pout = new PrintWriter(out, true);
		String uname = new String();

		if(request.getParameter("uname") != null)  {

			uname = request.getParameter("uname");
		}

		try  {
		    response.setContentType("image/png");
		    ImageIO.write(utilities.getEmailPic(uname), "png", out);
		}
		catch(Exception e)  {
		    response.setContentType("text/plain");
		    pout.println("EmailPic: " + e);
		    e.printStackTrace(pout);
		}
	}

	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException  {

		doGet(request, response);
	}
}
