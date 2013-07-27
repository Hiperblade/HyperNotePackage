# ------------------------------------
# QtMail 1.0 by pbarrette
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# install program
	cp "$DIR/qtmail.tar.gz" /usr/local/eTablet/bin/ 2>>../log/error.log
	chown root:root /usr/local/eTablet/bin/qtmail.tar.gz 2>>../log/error.log
	tar -xzf /usr/local/eTablet/bin/qtmail.tar.gz -C/ 2>>../log/error.log
	rm /usr/local/eTablet/bin/qtmail.tar.gz	2>>../log/error.log

	# add info
	StartMenuApplicationAdd "QtMail" "qtmail" "Startup" "icon_s_qtmail.png" "icon_b_qtmail.png" "QtMail converted by pbarrette"
	ApplicationConfigAdd "qtmail" "qtmail" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "QtMail"
	ApplicationConfigRemove "qtmail"
	IconRemove "icon_b_qtmail.png"
	IconRemove "icon_s_qtmail.png"
	rm -Rf /usr/local/eTablet/bin/qtmail 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "QtMail 1.0" "by pbarrette"
	ConsoleWriteLine 5 "A porting of an IMAP/POP/SMTP email client."
	ConsoleWriteLine 6 "The original source is here:"
	ConsoleWriteLine 7 "http://labs.qt.nokia.com/2009/09/21/introducing-qmf-an-advanced-mobile-messaging-framework/"
	ConsoleWriteLine 8 "The source code is here: http://www.freeenote.org/"

	ConsoleWriteLine 10 "PS. The UnInstall function not remove the associated library"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/qtmail/qtmail ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start