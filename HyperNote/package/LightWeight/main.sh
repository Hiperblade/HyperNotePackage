# ------------------------------------
# LightWeight 1.0 by vinillum
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/lightweight 2>>error.log
	cp -f "$DIR/lightweight" /usr/local/eTablet/bin/lightweight/lightweight 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_lightweight.png"
	IconAdd "$DIR/icon_s_lightweight.png"

	# add info
	StartMenuApplicationAdd "Lightweight2" "lightweight" "Startup" "icon_s_lightweight.png" "icon_b_lightweight.png" "Lightweight2 converted by vinillum"
	ApplicationConfigAdd "lightweight" "lightweight" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	cp -f /mnt/extsdcard/install/apps/lightweight/lightweight /usr/local/eTablet/bin/lightweight/lightweight 2>>error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "Lightweight2"
	ApplicationConfigRemove "lightweight"
	IconRemove "icon_b_lightweight.png"
	IconRemove "icon_s_lightweight.png"
	rm -Rf /usr/local/eTablet/bin/lightweight 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "LightWeight 1.0" "by vinillum"
	ConsoleWriteLine 5 "A porting of a simple, tabbed browser"
	ConsoleWriteLine 6 "The original source is here:"
	ConsoleWriteLine 7 "http://qt-apps.org/content/show.php/Lightweight2?content=139266"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/lightweight/lightweight ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		size=`ls -l /usr/local/eTablet/bin/lightweight/lightweight | awk '{print $5}'`
		if [ $size -ne 551912 ]; then
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