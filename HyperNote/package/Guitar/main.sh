# ------------------------------------
# Guitar template by Hiperblade
# ------------------------------------
Guitar_Install()
{
	DIR="$SCRIPT_DIRECTORY/NewTemplates/*"
	cp -Rf $DIR /eTablet/etc/template/ 2>>../log/error.log
	ConsoleAppendLine "Istallation done!"
}

Guitar_UnIntstall()
{
	DIR="$SCRIPT_DIRECTORY/OldTemplates/*"
	cp -Rf $DIR /eTablet/etc/template/ 2>>../log/error.log
	ConsoleAppendLine "Unistallation done!"
}

Guitar_Backup()
{
	DIR="$SCRIPT_DIRECTORY/OldTemplates/"

	mkdir $DIR 2>>../log/error.log
	cp -Rf /eTablet/etc/template/007straightline $DIR 2>>../log/error.log
	cp -Rf /eTablet/etc/template/008straightline $DIR 2>>../log/error.log

	ConsoleAppendLine "Backup done!"
}

Guitar_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Guitar template 1.0" "by Hiperblade"
	ConsoleWriteLine 5 "This script replace the follow templates:"
	ConsoleWriteLine 6 "007straightline"
	ConsoleWriteLine 7 "008straightline"
	ConsoleWriteLine 8 "with those for guitar tab"

	ConsoleWriteLine 15 "-= LOG =-"
}

# ------------------------------------
# START
# ------------------------------------
Guitar_PrintPage

# Backup
DIR="$SCRIPT_DIRECTORY/OldTemplates/"
if [ ! -d $DIR ]; then
	Guitar_Backup
fi

CHOICE=$NONE
while [ "$CHOICE" != $EXIT ]
do
	ShowButtons "BACK" $NONE "INSTALL" $NONE "UNINSTALL" ""

	if [ "$CHOICE" = "BACK" ]; then
		CHOICE=$EXIT
	elif [ "$CHOICE" = "INSTALL" ]; then
		Guitar_Install
		CHOICE=$NONE
	elif [ "$CHOICE" = "UNINSTALL" ]; then
		Guitar_UnIntstall
		CHOICE=$NONE
	else
		CHOICE=$NONE
	fi
done