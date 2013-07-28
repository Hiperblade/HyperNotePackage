# ------------------------------------
# Qtpacker 1.0 by mp035
# ------------------------------------
PackageTemplate_Install()
{
	DIR="$SCRIPT_DIRECTORY/Data"

	# install Optware only one time
	if ! [ -e /eTablet/var/optware ]; then
		Install_Optware
	fi
	
	# copy program
	mkdir /usr/local/eTablet/bin/qtpacker 2>>../log/error.log
	cp -f "$DIR/qtpacker" /usr/local/eTablet/bin/qtpacker/qtpacker 2>>../log/error.log

	# copy icons
	IconAdd "$DIR/icon_b_qtpacker.png"
	IconAdd "$DIR/icon_s_qtpacker.png"

	# add info
	StartMenuApplicationAdd "QtPacker" "qtpacker" "Startup" "icon_s_qtpacker.png" "icon_b_qtpacker.png" "QtPacker by mp035"
	ApplicationConfigAdd "qtpacker" "qtpacker" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_UnIntstall()
{
	# uninstall Optware disable
	#UnInstall_Optware
	
	StartMenuApplicationRemove "QtPacker"
	ApplicationConfigRemove "qtpacker"
	IconRemove "icon_b_qtpacker.png"
	IconRemove "icon_s_qtpacker.png"
	rm -Rf /usr/local/eTablet/bin/qtpacker 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Qtpacker 1.0" "by mp035"
	ConsoleWriteLine 5 "An GUI for Optware advanced package manager."
	ConsoleWriteLine 6 "The original source is here: http://www.freeenote.org/pages/optware.html"

	ConsoleWriteLine 8 "WARNING: The UnInstall function not remove Optware"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if ! [ -e /usr/local/eTablet/bin/qtpacker/qtpacker ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
		CURRENT_STATE=$INSTALLED
	fi
}

Install_Optware()
{
	# update /etc/profile
	cp /etc/profile "$DIR/profile"
	eval "cat $DIR\/profile | sed -e 's/echo \"Done\"/echo \"Done\"\n\n#mp035 exit when telnetting in so that other asus profile stuff does not get re-executed\nif [ \"\$PPID\" = \"1\" ]; then\n/g' > $DIR\/profileTmp 2>>..\/log\/error.log"
	eval "cat $DIR\/profileTmp | sed -e 's/.\/run.sh > \/dev\/null 2>\&1/.\/run.sh > \/dev\/null 2>\&1\n#mp035\nfi\n/g' > $DIR\/profile 2>>..\/log\/error.log"
	eval "cat $DIR\/profile | sed -e 's/export PATH=\"\/usr\/local\/bin:\/usr\/bin:\/bin:\/usr\/local\/sbin:\/usr\/sbin:\/sbin\"/export PATH=\"\/opt\/bin:\/opt\/sbin:\/usr\/local\/bin:\/usr\/bin:\/bin:\/usr\/local\/sbin:\/usr\/sbin:\/sbin\"/g' > $DIR\/profileTmp 2>>..\/log\/error.log"
	rm "$DIR/profile"
	mv "$DIR/profileTmp" /etc/profile

	# create the opt directory on the user partition, but link it into the appropriate place in the rootfs.	
	mkdir /eTablet/var/optware
	rm -r /opt
	ln -s /eTablet/var/optware /opt
	
	# install the opkg package manager
	feed=http://ipkg.nslu2-linux.org/feeds/optware/cs08q1armel/cross/unstable
	ipk_name=`wget -qO- $feed/Packages | awk '/^Filename: ipkg-opt/ {print $2}'`
	wget $feed/$ipk_name
	tar -xOvzf $ipk_name ./data.tar.gz | tar -C / -xzvf -
	mkdir -p /opt/etc/ipkg
	echo "src cross $feed" > /opt/etc/ipkg/feeds.conf
	
	# now set up system for packages that require initialization scripts
	wget -P /etc/init.d http://mybookworld.wikidot.com/local--files/optware/optware.sh
	chmod +x /etc/init.d/optware.sh
	
	# update /etc/init.d/rcS
	cp /etc/init.d/rcS "$DIR/rcS"
	eval "cat $DIR\/rcS | sed -e 's/\/etc\/init.d\/rc.local/PATH=\/opt\/bin:\/opt\/sbin:\$PATH\nexport PATH\n\/etc\/init.d\/optware.sh start #this launches the optware initialization scripts\n\/etc\/init.d\/rc.local/g' > $DIR/\rcSTmp 2>>..\/log\/error.log"
	rm "$DIR/rcS"
	mv "$DIR/rcSTmp" /etc/init.d/rcS
	
	# update /etc/init.d/rc.shutdown
	cp /etc/init.d/rc.shutdown "$DIR/rc.shutdown"
	eval "cat $DIR\/rc.shutdown | sed -e 's/#! \/bin\/sh/#! \/bin\/sh\n\/etc\/init.d\/optware.sh stop #this launches the optware termination scripts/g' > $DIR/\rc.shutdownTmp 2>>..\/log\/error.log"
	rm "$DIR/rc.shutdown"
	mv "$DIR/rc.shutdownTmp" /etc/init.d/rc.shutdown
}

#UnInstall_Optware()
#{
#	rm -r /opt
#	rm -r /eTablet/var/optware
#}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start