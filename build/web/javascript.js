/***********************************
 * date validation code and all other code is
 * copyright by John Mercier
 */

function submitonce(theform)  {
	if (document.all||document.getElementById)  {
		for (i=0; i< theform.length; i++)  {
			var tempobj=theform.elements[i]
			if(tempobj.type.toLowerCase()=="submit"||tempobj.type.toLowerCase()=="reset")
				tempobj.disabled=true
		}
	}
}

function morechars(str, max)  {
	var num = 0;
	var c;

	for(var i = 0; i < str.length; i++)  {
		c = str.charAt(i);
		if(c == '<')  {
			num = num + 4;
		}
		else if(c == '>')  {
			num = num + 4;
		}
		else if(c == '\"')  {
			num = num + 6;
		}
		else if(c == '&')  {
			num = num + 5;
		}
		else if(c == '\'')  {
			num = num + 5;
		}
		else if(c == '%')  {
			num = num + 5;
		}
		else if(c == '/')  {
			num = num + 5;
		}
		else if(c == '\\')  {
			num = num + 5;
		}
		else if(c == '\n')  {
			if(i + 1 < str.length)  {
				if(str.charAt(i + 1) == '\r')  {
					i++;
				}
			}
			num = num + 4;
		}

		else if(c == '\r')  {
			if(i + 1 < str.length)  {
				if(str.charAt(i + 1) == '\n')  {
					i++;
				}
			}
			num = num + 4;
		}

		else  {
			num = num + 1;
		}
	}
	if (num > max)  {
		return true;
	}
	else  {
		return false;
	}
}

var norm_feb = true;

function removeDays(daysMenu)  {
	for(var i = 1; i < daysMenu.options.length; i++)  {
		daysMenu.options[i] = null;
	}
}

function makeTwentyEightDays(daysMenu)  {

	var sel = daysMenu.selectedIndex;

	removeDays(daysMenu);

	for(var i = 1; i <= 28; i++)  {
		daysMenu.options[i] = new Option(i, i);
		if(i == sel)  {
			daysMenu.options[i].selected = true;
		}
	}
}

function makeTwentyNineDays(daysMenu)  {

	var sel = daysMenu.selectedIndex;

	removeDays(daysMenu);

	for(var i = 1; i <= 29; i++)  {
		daysMenu.options[i] = new Option(i, i);
		if(i == sel)  {
			daysMenu.options[i].selected = true;
		}
	}
}

function makeThirtyDays(daysMenu)  {

	var sel = daysMenu.selectedIndex;

	removeDays(daysMenu);

	for(var i = 1; i <= 30; i++)  {
		daysMenu.options[i] = new Option(i, i);
		if(i == sel)  {
			daysMenu.options[i].selected = true;
		}
	}
}

function makeThirtyOneDays(daysMenu)  {

	var sel = daysMenu.selectedIndex;

	removeDays(daysMenu);

	for(var i = 1; i <= 31; i++)  {
		daysMenu.options[i] = new Option(i, i);
		if(i == sel)  {
			daysMenu.options[i].selected = true;
		}
	}
}

function changeMonth(monthMenu, daysMenu)  {
	var month = monthMenu.options[monthMenu.selectedIndex].value;
	if(month == "1")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "2")  {
		if(norm_feb == true)  {
			makeTwentyEightDays(daysMenu);
		}
		else  {
			makeTwentyNineDays(daysMenu);
		}
	}
	else if(month == "3")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "4")  {
		makeThirtyDays(daysMenu);
	}
	else if(month == "5")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "6")  {
		makeThirtyDays(daysMenu);
	}
	else if(month == "7")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "8")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "9")  {
		makeThirtyDays(daysMenu);
	}
	else if(month == "10")  {
		makeThirtyOneDays(daysMenu);
	}
	else if(month == "11")  {
		makeThirtyDays(daysMenu);
	}
	else if(month == "12")  {
		makeThirtyOneDays(daysMenu);
	}
}

function changeYear(yearMenu, monthMenu, daysMenu)  {
	var year = yearMenu.options[yearMenu.selectedIndex].value;

	/*
	 * information for leap year from: www.mystro.com/leap.htm
	 */
	if(year % 4 == 0 && (year % 100 != 0 || (year % 400 == 0 && year % 4000 != 0)))  {
		norm_feb = false;
	}
	else  {
		norm_feb = true;
	}

	changeMonth(monthMenu, daysMenu);
}

function validate_form(theform)  {
	submitonce(theform);
	return true;
}
