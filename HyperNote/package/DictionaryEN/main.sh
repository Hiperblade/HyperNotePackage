# ------------------------------------
# English dictionary 1.0 by pbarrette
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"
	
	# copy program
	mkdir /usr/local/eTablet/bin/dictionary/dict/en 2>>../log/error.log
	cp -Rf $DIR /usr/local/eTablet/bin/dictionary/dict/en 2>>../log/error.log	

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	rm -Rf /usr/local/eTablet/bin/dictionary/dict/en 2>>../log/error.log	

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "English dictionary 1.0" "by pbarrette"
	ConsoleWriteLine 5 "Add the english dictionary"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/dictionary/dict/en/enen.idx.gz ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start