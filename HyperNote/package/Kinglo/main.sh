# ------------------------------------
# Kinglo 0.5 by maidenone
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/kinglo 2>>../log/error.log
	mkdir /eTablet/etc/kinglo/ 2>>../log/error.log
	cp -f "$DIR/kinglo" /usr/local/eTablet/bin/kinglo/kinglo 2>>../log/error.log
	cp -f "$DIR/glosa.txt" /eTablet/etc/kinglo/glosa.txt 2>>../log/error.log
	cp -f "$DIR/sentence.txt" /eTablet/etc/kinglo/sentence.txt 2>>../log/error.log
	
	# copy icons
	IconAdd "$DIR/icon_b_kinglo.png"
	IconAdd "$DIR/icon_S_kinglo.png"

	# add info
	StartMenuApplicationAdd "Kinglo" "kinglo" "Startup" "icon_s_kinglo.png" "icon_b_kinglo.png" "kinglo by Maiden and Orka"
	ApplicationConfigAdd "kinglo" "kinglo" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	DIR="$SCRIPT_DIRECTORY/Data"
	
	cp -f "$DIR/kinglo" /usr/local/eTablet/bin/kinglo/kinglo 2>>../log/error.log
	cp -f "$DIR/glosa.txt" /eTablet/etc/kinglo/glosa.txt 2>>../log/error.log
	cp -f "$DIR/sentence.txt" /eTablet/etc/kinglo/sentence.txt 2>>../log/error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "Kinglo"
	ApplicationConfigRemove "kinglo"
	rm -Rf /usr/local/eTablet/bin/kinglo 2>>../log/error.log
	rm -Rf /eTablet/etc/kinglo 2>>../log/error.log

	# copy icons
	IconRemove "icon_b_kinglo.png"
	IconRemove "icon_S_kinglo.png"

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Kinglo 0.5" "by Maiden and Orka"
	ConsoleWriteLine 5 "Learn mandarin, write hanzi!"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/kinglo/kinglo ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		size=`ls -l /usr/local/eTablet/bin/kinglo/kinglo | awk '{print $5}'`
		if [ $size -ne 259834 ]; then
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
