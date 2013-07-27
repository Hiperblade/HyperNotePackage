# ------------------------------------
# Italian dictionary 1.0 by gallochri
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"
	
	# copy program
	mkdir /usr/local/eTablet/bin/dictionary/dict/it 2>>../log/error.log
	cp -Rf $DIR /usr/local/eTablet/bin/dictionary/dict/it 2>>../log/error.log	

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	rm -Rf /usr/local/eTablet/bin/dictionary/dict/it 2>>../log/error.log	

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Italian dictionary 1.0" "by gallochri"
	ConsoleWriteLine 5 "Add the italian dictionary"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/dictionary/dict/it/Italian-English.idx.gz ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start