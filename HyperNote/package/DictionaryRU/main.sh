# ------------------------------------
# Russian dictionary 1.0 by pbarrette
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"
	
	# copy program
	mkdir /usr/local/eTablet/bin/dictionary/dict/ru 2>>../log/error.log
	cp -Rf $DIR /usr/local/eTablet/bin/dictionary/dict/ru 2>>../log/error.log	

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	rm -Rf /usr/local/eTablet/bin/dictionary/dict/ru 2>>../log/error.log	

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Russian dictionary 1.0" "by pbarrette"
	ConsoleWriteLine 5 "Add the russian dictionary"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/dictionary/dict/ru/English-Russian.idx.gz ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start