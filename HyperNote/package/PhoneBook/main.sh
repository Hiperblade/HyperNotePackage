# ------------------------------------
# PhoneBook 1.0 by Asus
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/phonebook/ 2>>../log/error.log
	cp -Rf "$DIR/phonebook" /usr/local/eTablet/bin/phonebook/ 2>>../log/error.log
	cp -Rf "$DIR/resources" /usr/local/eTablet/bin/phonebook/resources 2>>../log/error.log

	# copy user data
	mkdir /eTablet/etc/phonebook/ 2>>../log/error.log
	cp -f "$SCRIPT_DIRECTORY/word.xml" /eTablet/etc/phonebook/ 2>>../log/error.log

	#add info
	StartMenuApplicationAdd "PhoneBook" "phonebook" "Startup" "icon_s_phonebook.png" "icon_b_phonebook.png" "Take a picture of your contact. Or take a photo of their business cards. All the contacts in the phonebook can be quickly added to meeting minute notebooks as participants."

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "PhoneBook"
	rm -Rf /usr/local/eTablet/bin/phonebook 2>>../log/error.log
	rm -Rf /eTablet/etc/phonebook 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "PhoneBook 1.0" "by Asus"
	ConsoleWriteLine 5 "PhoneBook App"
	
	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/phonebook/phonebook ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start