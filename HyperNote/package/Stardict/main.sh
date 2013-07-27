# ------------------------------------
# Stardict by TheTwo
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"
	
	# copy program
	mkdir /usr/local/eTablet/bin/stardict 2>>../log/error.log
	cp -f "$DIR/usr/local/eTablet/bin/stardict/stardict" /usr/local/eTablet/bin/stardict 2>>../log/error.log
	
	# copy dict
	mkdir /usr/local/eTablet/bin/stardict/dict 2>>../log/error.log
	cp -fr "$DIR/usr/local/eTablet/bin/stardict/dict" /usr/local/eTablet/bin/stardict/dict 2>>../log/error.log
	
	# copy config
	mkdir /eTablet/etc/stardict 2>>../log/error.log
	cp -f "$DIR/eTablet/etc/stardict/DictionariesSelection.txt" /eTablet/etc/stardict 2>>../log/error.log

	# add info
	StartMenuApplicationAdd "Stardict" "stardict" "Startup" "icon_s_dictionary.png" "icon_b_dictionary.png" "Dictionary from old Eee Note ported to new firmware."
	ApplicationConfigAdd "stardict" "stardict" 1

	ConsoleAppendLine "Installation done!"
}

PackageTemplate_UnIntstall()
{
	StartMenuApplicationRemove "Stardict"
	ApplicationConfigRemove "stardict"
	rm -Rf /usr/local/eTablet/bin/stardict 2>>../log/error.log
	rm -Rf /eTablet/etc/stardict 2>>../log/error.log
	

	ConsoleAppendLine "Uninstallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Stardict" "by TheTwo"
	ConsoleWriteLine 5 "A porting of the dictionary app installed on Eee Note with old fimware."

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/stardict/stardict ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start