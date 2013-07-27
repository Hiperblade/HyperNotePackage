# ------------------------------------
# Solitaire 1.0 by mp035
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# copy program
	mkdir /usr/local/eTablet/bin/solitaire 2>>../log/error.log
	cp -f "$DIR/solitaire" /usr/local/eTablet/bin/solitaire/solitaire 2>>../log/error.log

	# copy lib
	cp -f "$DIR/libQtSvg.so.4.6.2" /usr/local/Trolltech/QtEmbedded-4.6.2-arm/lib/ 2>>../log/error.log
	ln -s /usr/local/Trolltech/QtEmbedded-4.6.2-arm/lib/libQtSvg.so.4.6.2 /usr/local/Trolltech/QtEmbedded-4.6.2-arm/lib/libQtSvg.so.4 2>>../log/error.log

	# add info
	StartMenuApplicationAdd "Solitaire" "solitaire" "Startup" "icon_s_game.png" "icon_b_game.png" "Solitaire converted by mp035"
	ApplicationConfigAdd "solitaire" "solitaire" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "Solitaire"
	ApplicationConfigRemove "solitaire"
	rm -Rf /usr/local/eTablet/bin/solitaire 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Solitaire 1.0" "by mp035"
	ConsoleWriteLine 5 "A porting of Solitaire game."
	ConsoleWriteLine 6 "The original source is here: https://projects.forum.nokia.com/solitaire"

	ConsoleWriteLine 8 "PS. The UnInstall function not remove the associated library"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/solitaire/solitaire ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start