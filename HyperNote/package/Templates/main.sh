# ------------------------------------
# Templates by Hiperblade
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/New"
	cp -Rf $DIR /eTablet/etc/template 2>>../log/error.log
	
	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	rm -Rf /eTablet/etc/template 2>>../log/error.log
	
	DIR="$SCRIPT_DIRECTORY/Old"
	cp -Rf $DIR /eTablet/etc/template 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Template 1.0" "by Hiperblade"
	ConsoleWriteLine 5 "This script replace all templates"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /eTablet/etc/template/newtemplates ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

#backup
DIR="$SCRIPT_DIRECTORY/Old"
if [ ! -d $DIR ]; then
	cp -Rf /eTablet/etc/template $DIR 2>>../log/error.log
fi

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start