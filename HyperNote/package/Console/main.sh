# ------------------------------------
# Console by mp035
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/consoleq 2>>../log/error.log
	cp -f "$DIR/consoleq" /usr/local/eTablet/bin/consoleq/consoleq 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_consoleq.png"
	IconAdd "$DIR/icon_s_consoleq.png"
	
	# add info
	StartMenuApplicationAdd "ConsoleQ" "consoleq" "Startup" "icon_s_consoleq.png" "icon_b_consoleq.png" "ConsoleQ converted by mp035"
	ApplicationConfigAdd "consoleq" "consoleq" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	cp -f "$SCRIPT_DIRECTORY/Data/consoleq" /usr/local/eTablet/bin/consoleq/consoleq 2>>../log/error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "ConsoleQ"
	ApplicationConfigRemove "consoleq"
	IconRemove "icon_b_consoleq.png"
	IconRemove "icon_s_consoleq.png"
	rm -Rf /usr/local/eTablet/bin/consoleq 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Console 1.0" "by mp035"
	ConsoleWriteLine 5 "A porting of console terminal application based on QTermWidget"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/consoleq/consoleq ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
    size=`ls -l /usr/local/eTablet/bin/consoleq/consoleq | awk '{print $5}'`
		if [ $size -ne 627164 ]; then
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