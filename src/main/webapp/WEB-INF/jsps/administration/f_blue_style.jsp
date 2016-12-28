<%
String blue_style = "<style type=\"text/css\">\n" +
"\n" +
"body {\n" +
"  font-family: times, serif;\n" +
"  background-color: #ffffff;\n" +
"  color: black;\n" +
"\n" +
"  scrollbar-base-color: #0044aa;\n" +
"  scrollbar-arrow-color: #2288EE;\n" +
"  scrollbar-darkshadow-color: #0044aa;\n" +
"  scrollbar-face-color: #0066CC;\n" +
"  scrollbar-highlight-color: #0066CC;\n" +
"  scrollbar-shadow-color: #0044aa;\n" +
"  scrollbar-3dlight-color: #0044aa;\n" +
"}\n" +
"\n" +
"A:link {\n" +
"  COLOR: #0044aa; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:active {\n" +
"  COLOR: #0044aa; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:visited {\n" +
"  COLOR: #0044aa; TEXT-DECORATION: none\n" +
"}\n" +
"\n" +
"A:hover {\n" +
"  COLOR: #0044aa; TEXT-DECORATION: underline\n" +
"}\n" +
"\n" +
"div.tabArea {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
"a.tab {\n" +
"  font-family: arial, helvetica, sans-serif;\n" +
"  font-size: 20;\n" +
"  background-color: #ffffff;\n" +
"  border: 1px solid #0066cc;\n" +
"  border-bottom-width: 0px;\n" +
"  padding: 2px 1em 7px 1em;\n" +
"  text-decoration: none;\n" +
"  color: #0044aa;\n" +
"\n" +
"  position: relative;\n" +
"  right: -15px;\n" +
"  /*top: -1px;*/\n" +
"  z-index: 100;\n" +
"}\n" +
"\n" +
"a.tab:hover {\n" +
"  text-decoration: underline;\n" +
"}\n" +
"\n" +
"a.tab.activeTab, a.tab.activeTab:hover, a.tab.activeTab:visited {\n" +
"  background-color: #ffffff;\n" +
"  color: #0044aa;\n" +
"  border: 1px solid #0066cc;\n" +
"  border-bottom-width: 0px;\n" +
"  z-index: 102;\n" +
"}\n" +
"\n" +
".tabMain {\n" +
"  background-color: #ffffff;\n" +
"  border: 1px solid #0066cc;\n" +
"  border-top-width: 7px;\n" +
"  position: relative;\n" +
"  z-index: 101;\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
"td.bigTitle {\n" +
"background-color: #ffffff;\n" +
"color: #0044aa;\n" +
"\n" +
"font-family: arial narrow;\n" +
"font-size: 24;\n" +
"text-align: right;\n" +
"}\n" +
"\n" +
".userMessageArea  {\n" +
"font-size: 12;\n" +
"background-color: #ffffff;\n" +
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
"\n" +
".siteMessage  {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".siteMessageTitle  {\n" +
"width: 100%;\n" +
"background-color: #ffffff;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"}\n" +
"\n" +
".siteMessageContent  {\n" +
"vertical-align: top;\n" +
"background-color: #ffffff;\n" +
"padding: 5;\n" +
"border: 0px solid #0044aa;\n" +
"border-top-width: 1px;\n" +
"}\n" +
"\n" +
".newHeader  {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".newsHeaderContent  {\n" +
"vertical-align: top;\n" +
"background-color: #ffffff;\n" +
"padding: 5;\n" +
"border: 0px solid #0044aa;\n" +
"border-bottom-width: 1px;\n" +
"}\n" +
"\n" +
".sideModule  {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
".sideModuleTitle  {\n" +
"width: 100%;\n" +
"background-color: #ffffff;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"}\n" +
"\n" +
".sideModuleContent  {\n" +
"vertical-align: top;\n" +
"background-color: #ffffff;\n" +
"padding: 5;\n" +
"border: 0px solid #0044aa;\n" +
"border-top-width: 1px;\n" +
"}\n" +
"\n" +
".sideModule_links {\n" +
"width: 100%;\n" +
"background-color: ffffff;\n" +
"}\n" +
"\n" +
".mainModuleItem  {\n" +
"width: 100%;\n" +
"}\n" +
"\n" +
".mainModuleItemTitle  {\n" +
"background-color: #ffffff;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 18;\n" +
"padding: 5;\n" +
"}\n" +
"\n" +
".mainModuleItemContent  {\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 16;\n" +
"padding: 5;\n" +
"border: 0px solid #0044aa;\n" +
"border-top-width: 1px;\n" +
"border-bottom-width: 0px;\n" +
"}\n" +
"\n" +
".mainModuleItemSubTitle  {\n" +
"background-color: #ffffff;\n" +
"font-family: arial, helvetica, sans-serif;\n" +
"font-size: 12;\n" +
"padding: 5;\n" +
"border: 0px solid #0066cc;\n" +
"border-top-width: 1px;\n" +
"}\n" +
"\n" +
".cell1  {\n" +
"border: 1px solid #0066cc;\n" +
"}\n" +
"\n" +
".cell2  {\n" +
"border: 1px solid #0066cc;\n" +
"}\n" +
"\n" +
".software_copy_table {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".software_copyright_cell  {\n" +
"  background-color: #ffffff;\n" +
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
"  color: 0066cc;\n" +
"}\n" +
"\n" +
".copy_table {\n" +
"  width: 100%;\n" +
"}\n" +
"\n" +
".copyright_cell  {\n" +
"  background-color: #ffffff;\n" +
"  border: 0px solid #0044aa;\n" +
"  border-top-width: 1px;\n" +
"}\n" +
"</style>\n";


try  {
	String mess = "UPDATE " + dbPrefix + "site_vars SET style = '" + utilities.filterForSQL(blue_style) + "'" +
		" WHERE varsname = '" + siteName + "'";

	stmt.executeUpdate(mess);
	site_message = "Your style has been changed to Blue!";

}
catch(SQLException e)  {
	site_message = "There was a problem during saving style: " + e;
}
%>
