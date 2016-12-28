<%
String purple_style = "<style type=\"text/css\">\n" +
"\n" +
"body {\n" +
"font-family: times, serif;\n" +
"background-color: #641d6d;\n" +
"color: white;\n" +
"\n" +
"scrollbar-base-color: #641d6d;\n" +
"scrollbar-arrow-color: #ffffff;\n" +
"scrollbar-darkshadow-color: #000000;\n" +
"scrollbar-face-color: #420b4b;\n" +
"scrollbar-highlight-color: #555555;\n" +
"scrollbar-shadow-color: #000000;\n" +
"scrollbar-3dlight-color: #874090;\n" +
"}\n" +
"\n" +
"A:link {\n" +
"COLOR: #dc9be6; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:active {\n" +
"COLOR: #dc9be6; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:visited {\n" +
"COLOR: #dc9be6; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:hover {\n" +
"COLOR: #dc9be6; TEXT-DECORATION: underline\n" +
"}\n" +
"\n" +
"div.tabArea {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
"a.tab {\n" +
"  font-family: arial, helvetica, sans-serif;\n" +
"  font-size: 20;\n" +
"  background-color: #420b4b;\n" +
"  border: 2px solid #420b4b;\n" +
"  border-bottom-width: 0px;\n" +
"  padding: 2px 1em 7px 1em;\n" +
"  text-decoration: none;\n" +
"\n" +
"  position: relative;\n" +
"  right: -15px;\n" +
"  /*top: -1px;*/\n" +
"  z-index: 100;\n" +
"}\n" +
"\n" +
"a.tab, a.tab:visited {\n" +
"  color: #808080;\n" +
"}\n" +
"\n" +
"a.tab:hover {\n" +
"  color: #606060;\n" +
"  background-color: #641d6d;\n" +
"}\n" +
"\n" +
"a.tab.activeTab, a.tab.activeTab:hover, a.tab.activeTab:visited {\n" +
"  background-color: #000000;\n" +
"  color: #ffffff;\n" +
"  z-index: 102;\n" +
"}\n" +
"\n" +
".tabMain {\n" +
"  background-color: #000000;\n" +
"  border: 5px solid #420b4b;\n" +
"  position: relative;\n" +
"  z-index: 101;\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
"td.bigTitle {\n" +
"background-color: black;\n" +
"\n" +
"font-family: arial narrow;\n" +
"font-size: 24;\n" +
"text-align: right;\n" +
"}\n" +
"\n" +
".userMessageArea  {\n" +
"font-size: 12;\n" +
"background-color: #444444;\n" +
"\n" +
"font-family: arial;\n" +
"text-decoration: none;\n" +
"}\n" +
"\n" +
".mainCell  {\n" +
"vertical-align: top;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".leftCell  {\n" +
"width: 150px;\n" +
"vertical-align: top;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".rightCell  {\n" +
"width: 200px;\n" +
"vertical-align: top;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".siteMessage  {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".siteMessageTitle  {\n" +
"width: 100%;\n" +
"background-color: #555555;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"}\n" +
"\n" +
".siteMessageContent  {\n" +
"vertical-align: top;\n" +
"background-color: #000000;\n" +
"padding: 5;\n" +
"border: 1px solid #333333;\n" +
"}\n" +
"\n" +
".newHeader  {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".newsHeaderContent  {\n" +
"vertical-align: top;\n" +
"background-color: #000000;\n" +
"padding: 5;\n" +
"border: 1px solid #333333;\n" +
"}\n" +
"\n" +
".sideModule  {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
".sideModuleTitle  {\n" +
"width: 100%;\n" +
"background-color: #555555;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"}\n" +
"\n" +
".sideModuleContent  {\n" +
"vertical-align: top;\n" +
"background-color: #000000;\n" +
"padding: 5;\n" +
"border: 1px solid #333333;\n" +
"}\n" +
"\n" +
".sideModule_links {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
".sideModule_links:hover {\n" +
"  background-color: #333333;\n" +
"}\n" +
"\n" +
".sideModule_links_active {\n" +
"  background-color: #333333;\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".mainModuleItem  {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
".mainModuleItemTitle  {\n" +
"background-color: #555555;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 18;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".mainModuleItemContent  {\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 16;\n" +
"padding: 5;\n" +
"border: 3px solid #333333;\n" +
"}\n" +
"\n" +
".mainModuleItemSubTitle  {\n" +
"background-color: #555555;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".cell1  {\n" +
"background-color: #333333;\n" +
"}\n" +
"\n" +
".cell2  {\n" +
"border: 1px solid #333333;\n" +
"}\n" +
"\n" +
".software_copy_table {\n" +
"  width: 100%;\n" +
"  border: 5px solid #420b4b;\n" +
"}\n" +
"\n" +
".software_copyright_cell  {\n" +
"  background-color: #420b4b;\n" +
"}\n" +
"\n" +
"/*-------user styles ------------------*/\n" +
"\n" +
".main_title_table {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".main_title {\n" +
"  font-size: 48;\n" +
"  font-family: arial narrow, arial, helvetica, sans-serif;\n" +
"  text-align: right;\n" +
"}\n" +
"\n" +
".copy_table {\n" +
"  width: 100%;\n" +
"  border: 5px solid #420b4b;\n" +
"}\n" +
"\n" +
".copyright_cell  {\n" +
"  background-color: #420b4b;\n" +
"}\n" +
"</style>\n";

%>
<%--

"<style type=text/css>

body {
font-family: times, serif;
background-color: #641d6d;
color: white;

scrollbar-base-color: #641d6d;
scrollbar-arrow-color: #ffffff;
scrollbar-darkshadow-color: #000000;
scrollbar-face-color: #420b4b;
scrollbar-highlight-color: #555555;
scrollbar-shadow-color: #000000;
scrollbar-3dlight-color: #874090;
}

A:link {
COLOR: #dc9be6; TEXT-DECORATION: none
}

A:active {
COLOR: #dc9be6; TEXT-DECORATION: none
}

A:visited {
COLOR: #dc9be6; TEXT-DECORATION: none
}

A:hover {
COLOR: #dc9be6; TEXT-DECORATION: underline
}

div.tabArea {
width: 100%;
}

a.tab {
  font-family: arial, helvetica, sans-serif;
  font-size: 20;
  background-color: #420b4b;
  border: 2px solid #420b4b;
  border-bottom-width: 0px;
  padding: 2px 1em 7px 1em;
  text-decoration: none;

  position: relative;
  right: -15px;
  /*top: -1px;*/
  z-index: 100;
}

a.tab, a.tab:visited {
  color: #808080;
}

a.tab:hover {
  color: #606060;
  background-color: #641d6d;
}

a.tab.activeTab, a.tab.activeTab:hover, a.tab.activeTab:visited {
  background-color: #000000;
  color: #ffffff;
  z-index: 102;
}

.tabMain {
  background-color: #000000;
  border: 5px solid #420b4b;
  position: relative;
  z-index: 101;
  width: 100%;
}

td.bigTitle {
background-color: black;

font-family: arial narrow;
font-size: 24;
text-align: right;
}

.userMessageArea  {
font-size: 12;
background-color: #444444;

font-family: arial;
text-decoration: none;
}

.mainCell  {
vertical-align: top;
padding: 5;
}

.leftCell  {
width: 150px;
vertical-align: top;
padding: 5;
}

.rightCell  {
width: 200px;
vertical-align: top;
padding: 5;
}

.sideModule  {
width: 100%;
}

.sideModuleTitle  {
width: 100%;
background-color: #555555;
font-family: arial, helvetica, sans-serif;
font-size: 12;
}

.sideModuleContent  {
vertical-align: top;
background-color: #000000;
padding: 5;
border: 1px solid #333333;
}

.sideModule_links {
width: 100%;
}

.mainModuleItem  {
width: 100%;
}

.mainModuleItemTitle  {
background-color: #555555;
font-family: arial, helvetica, sans-serif;
font-size: 18;
padding: 5;
}

.mainModuleItemContent  {
font-family: arial, helvetica, sans-serif;
font-size: 16;
padding: 5;
border: 3px solid #333333;
}

.mainModuleItemSubTitle  {
background-color: #555555;
font-family: arial, helvetica, sans-serif;
font-size: 12;
padding: 5;
}

.cell1  {
background-color: #333333;
}

.cell2  {
border: 1px solid #333333;
}

.software_copy_table {
  width: 100%;
  border: 5px solid #420b4b;
}

.software_copyright_cell  {
  background-color: #420b4b;
}

/*-------user styles ------------------*/

.main_title_table {
  width: 100%;
}

.main_title {
  font-size: 48;
  font-family: arial narrow, arial, helvetica, sans-serif;
  text-align: right;
}

.copy_table {
  width: 100%;
  border: 5px solid #420b4b;
}

.copyright_cell  {
  background-color: #420b4b;
}
</style>";
--%>
<%


try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET style = '" + utilities.filterForSQL(purple_style) + "'" +
		" WHERE varsname = '" + siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your style has been changed to Purple!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving style: " + e;
}
%>
