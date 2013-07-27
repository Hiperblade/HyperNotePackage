# ------------------------------------
# CuteExplorer 1.0 by mp035
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/cuteexplorer 2>>../log/error.log
	cp -f "$DIR/cuteexplorer" /usr/local/eTablet/bin/cuteexplorer/cuteexplorer 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_fileman.png"
	IconAdd "$DIR/icon_s_fileman.png"

	# add info
	StartMenuApplicationAdd "CuteExplorer" "cuteexplorer" "Startup" "icon_s_fileman.png" "icon_b_fileman.png" "CuteExplorer converted by mp035"
	ApplicationConfigAdd "cuteexplorer" "cuteexplorer" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "CuteExplorer"
	ApplicationConfigRemove "cuteexplorer"
	IconRemove "icon_b_fileman.png"
	IconRemove "icon_s_fileman.png"
	rm -Rf /usr/local/eTablet/bin/cuteexplorer 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "CuteExplorer 1.0" "by mp035"
	ConsoleWriteLine 5 "A porting of file explorer."
	ConsoleWriteLine 6 "The original source is here: https://garage.maemo.org/projects/cuteexplorer"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/cuteexplorer/cuteexplorer ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start