<br />
      <table class="mainModuleItem">
	<tr>
	  <td class="mainModuleItemTitle">Change Profile</td>
	</tr>
	<tr>
	  <td class="mainModuleItemContent">

	<%

		String fname, lname, minit, passw, uname, position, rdate, email, website, info, gender, birthday;
		int day, month, year;
		boolean act;

		try  {

			rs = stmt.executeQuery("Select fname, lname, minit, passw, uname, regdate, job, email, activated, website, info, bday, gender, EXTRACT(DAY FROM bday) as b_day, EXTRACT(MONTH FROM bday) as b_month, EXTRACT(YEAR FROM bday) as b_year FROM " + dbPrefix + "member natural join " + dbPrefix + "member_site WHERE uname ='" + logged_uname + "' and varsname = '" + site_name + "'");

			if(rs.first())  {

				fname = rs.getString("fname");
				lname = rs.getString("lname");
				minit = rs.getString("minit");
				passw = rs.getString("passw");
				uname = rs.getString("uname");
				rdate = rs.getString("regdate");
				position = rs.getString("job");
				email = rs.getString("email");
				act = rs.getBoolean("activated");
				website = rs.getString("website");
				info = rs.getString("info");
				day = rs.getInt("b_day");
				month = rs.getInt("b_month");
				year = rs.getInt("b_year");
				gender = rs.getString("gender");
				birthday = rs.getString("bday");

				%>
				<form name="profile"  onsubmit="return validate_form(profile)" method="POST" action="<%= response.encodeURL("index.jsp?action=f_profile&nav=Member&view=profile&site_name=" + site_name) %>">
				<table>
				  <tr>
				    <td>User Name</td>
				    <td><%= uname %></td>
				  </tr>
				  <tr>
				    <td>First Name:</td>
				    <td><input type="text" name="FirstName" value="<%= fname %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Middle Initial:</td>
				    <td><input type="text" name="MiddleInit" value="<%= minit %>" maxlength=1></td>
				  </tr>
				  <tr>
				    <td>Last Name:</td>
				    <td><input type="text" name="LastName"  value="<%= lname %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Password:</td>
				    <td><input type="password" name="Password" value="<%= passw %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Password Again:</td>
				    <td><input type="password" name="Password2" value="<%= passw %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Registration Date</td>
				    <td><%= rdate %></td>
				  </tr>
				  <tr>
				    <td>Activated</td>
				    <td><%= act %></td>
				  </tr>
				  <tr>
				    <td>Position</td>
				    <td><%= position %></td>
				  </tr>
				  <tr>
				    <td>Email Address</td>
				    <td><input type="text" name="Email" value="<%= email %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Website</td>
				    <td><input type="text" name="Website" value="<%= website %>" maxlength=50></td>
				  </tr>
				  <tr>
				    <td>Birth Day</td>
				    <td>
				      <select name="BirthMonth" onchange="changeMonth(BirthMonth, BirthDay)">
					<option value=""></option>
					<option <% if(month == 1) { %> selected=true <% } %> value="1">January</option>
					<option <% if(month == 2) { %> selected=true <% } %> value="2">February</option>
					<option <% if(month == 3) { %> selected=true <% } %> value="3">March</option>
					<option <% if(month == 4) { %> selected=true <% } %> value="4">April</option>
					<option <% if(month == 5) { %> selected=true <% } %> value="5">May</option>
					<option <% if(month == 6) { %> selected=true <% } %> value="6">June</option>
					<option <% if(month == 7) { %> selected=true <% } %> value="7">July</option>
					<option <% if(month == 8) { %> selected=true <% } %> value="8">August</option>
					<option <% if(month == 9) { %> selected=true <% } %> value="9">September</option>
					<option <% if(month == 10) { %> selected=true <% } %> value="10">October</option>
					<option <% if(month == 11) { %> selected=true <% } %> value="11">November</option>
					<option <% if(month == 12) { %> selected=true <% } %> value="12">December</option>
	  			      </select>
	  			      <select name="BirthDay">
					<option name="0" value=""></option>
						<%
						for(int i = 1; i <= 31; i++)  {
							if(i == day)  {
								%>
								<option selected=true name="<%= i %>" value="<%= i %>"><%= i %></option>
								<%
							}
							else  {
								%>
								<option name="<%= i %>" value="<%= i %>"><%= i %></option>
								<%
							}
						}
						%>
				      </select>
	  			      <select name="BirthYear" onchange="changeYear(BirthYear, BirthMonth, BirthDay)">
					<option name="0" value=""></option>
					<script language=javascript>
						var cur_date = new Date();
						var year = cur_date.getYear();
						if(year < 1900) year += 1900;

						for(var i = year; i >= year - 100; i--)  {
							if(i == <%= year %>)  {
								document.writeln("		<option selected=true name=\"" + i + "\" value=\"" + i + "\">" + i + "</option>");
							}
							else  {
								document.writeln("		<option name=\"" + i + "\" value=\"" + i + "\">" + i + "</option>");
							}
						}
					</script>
				      </select>
				      (<%= birthday %>)
				    </td>
				  </tr>
				  <tr>
				    <td>Gender</td>
				    <td>
					<select name="Gender">
					<%
					if(gender == null || gender.equals(""))  {
						%>
						<option value="" selected></option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<%
					}
					else if(gender.equals("Male"))  {
						%>
						<option value=""></option>
						<option value="Male" selected>Male</option>
						<option value="Female">Female</option>
						<%
					}
					else if(gender.equals("Female"))  {
						%>
						<option value=""></option>
						<option value="Male">Male</option>
						<option value="Female" selected>Female</option>
						<%
					}
					%>
					</select>
				    </td>
				  </tr>
				  <tr>
				    <td valign=top>Other Information:<br><input type="button" value="count" onclick="alert('Info is ' + info.value.length + ' characters long.')"></td>
				    <td>
					<TEXTAREA NAME="info" ROWS=25 COLS=50><%= info %></TEXTAREA>
				    </td>
				  </tr>
				  <tr>
				    <td colspan=2 align=center><input type=submit value="Submit"></td>
				  </tr>
				</table>
				</form>
				<%
			}
		}

		catch(Exception e)  {
			%>
			There was an error getting your profile <%= e %>
			<%
		}
%>
	  </td>
	</tr>
	</table>