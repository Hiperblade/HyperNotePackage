# ------------------------------------
# QMetrics 1.0 by pbarrette
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/qmetrics 2>>../log/error.log
	cp -f "$DIR/qmetrics" /usr/local/eTablet/bin/qmetrics/qmetrics 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_qmetrics.png"
	IconAdd "$DIR/icon_s_qmetrics.png"

	# add info
	StartMenuApplicationAdd "QMetrics" "qmetrics" "Startup" "icon_s_qmetrics.png" "icon_b_qmetrics.png" "QMetrics a unit conversion application ported by pbarrette"
	ApplicationConfigAdd "qmetrics" "qmetrics" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	cp -f "$SCRIPT_DIRECTORY/Data/qmetrics" /usr/local/eTablet/bin/qmetrics/qmetrics 2>>../log/error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "QMetrics"
	ApplicationConfigRemove "qmetrics"
	IconRemove "icon_b_qmetrics.png"
	IconRemove "icon_s_qmetrics.png"
	rm -Rf /usr/local/eTablet/bin/qmetrics 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "QMetrics 1.0" "by pbarrette"
	ConsoleWriteLine 5 "A porting of a unit conversion application"
	ConsoleWriteLine 6 "The original source is here:"
	ConsoleWriteLine 7 "http://qt-apps.org/content/show.php?content=129824"
	ConsoleWriteLine 8 "The source code is here: http://www.freeenote.org/"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/qmetrics/qmetrics ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		size=`ls -l /usr/local/eTablet/bin/qmetrics/qmetrics| awk '{print $5}'`
		if [ $size -ne 127158 ]; then
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