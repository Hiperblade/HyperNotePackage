# ------------------------------------
# QComicBook 1.0 by Adar
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/qcomicbook 2>>../log/error.log
	cp -f "$DIR/qcomicbook" /usr/local/eTablet/bin/qcomicbook/qcomicbook 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_qcomicbook.png"
	IconAdd "$DIR/icon_s_qcomicbook.png"

	# add info
	StartMenuApplicationAdd "QComicBook" "qcomicbook" "Startup" "icon_s_qcomicbook.png" "icon_b_qcomicbook.png" "qcomicbook converted by adar"
	ApplicationConfigAdd "qcomicbook" "qcomicbook" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	cp -f "$SCRIPT_DIRECTORY/Data/qcomicbook" /usr/local/eTablet/bin/qcomicbook/qcomicbook 2>>../log/error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "QComicBook"
	ApplicationConfigRemove "qcomicbook"
	IconRemove "icon_b_qcomicbook.png"
	IconRemove "icon_s_qcomicbook.png"
	rm -Rf /usr/local/eTablet/bin/qcomicbook 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "QComicBook 1.0" "by Adar"
	ConsoleWriteLine 5 "A porting of a comic book reader"
	ConsoleWriteLine 6 "The original source is here:"
	ConsoleWriteLine 7 "http://qcomicbook.linux-projects.net/"
	
	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/qcomicbook/qcomicbook ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		size=`ls -l /usr/local/eTablet/bin/qcomicbook/qcomicbook| awk '{print $5}'`
		if [ $size -ne 1365388 ]; then
			CURRENT_STATE=$NOTUPDATED
		else
			CURRENT_STATE=$INSTALLED
		fi
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start