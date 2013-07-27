# ------------------------------------
# QNetWalk 1.0 by mp035
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/qnetwalk 2>>../log/error.log
	cp -f "$DIR/qnetwalk" /usr/local/eTablet/bin/qnetwalk/qnetwalk 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_qnetwalk.png"
	IconAdd "$DIR/icon_s_qnetwalk.png"

	# add info
	StartMenuApplicationAdd "QNetWalk" "qnetwalk" "Startup" "icon_s_qnetwalk.png" "icon_b_qnetwalk.png" "QNetWalk converted by mp035"
	ApplicationConfigAdd "qnetwalk" "qnetwalk" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "QNetWalk"
	ApplicationConfigRemove "qnetwalk"
	IconRemove "icon_b_qnetwalk.png"
	IconRemove "icon_s_qnetwalk.png"
	rm -Rf /usr/local/eTablet/bin/qnetwalk 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "QNetWalk 1.0" "by mp035"
	ConsoleWriteLine 5 "A porting of a popular old game."
	ConsoleWriteLine 6 "The original source is here: http://qt.osdn.org.ua/qnetwalk.html"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/qnetwalk/qnetwalk ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start