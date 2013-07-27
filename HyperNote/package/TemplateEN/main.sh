# ------------------------------------
# English template 1.0 by pbarrette
# ------------------------------------
PackageTemplate_Run()
{
	DIR="$SCRIPT_DIRECTORY/Data/*"

	# copy program
	cp -Rf $DIR /eTablet/etc/template/ 2>>../log/error.log	

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "English template 1.0" "by pbarrette"
	ConsoleWriteLine 5 "Replace the template whith English version"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start