#!/bin/bash

firefoxstatus="$HOME/.config/nofirefox"

if [ -f $firefoxstatus ]; then
        #echo "dosya var"
        env MOZ_USE_XINPUT2=1 ~/.firefox/firefox %u
else
        #echo "dosya yok"
        touch $firefoxstatus

        cd ~/.mozilla/firefox/
	rm installs.ini
	rm profiles.ini
	~/.firefox/firefox  --headless & 
	sleep 1
	pkill firefox 
	sleep 1

	F_PROF=$(grep -A 10 "\[Profile0\]" profiles.ini | sed '1d'| grep -m 1 -B 10 "\["| grep "Path=" | sed -e 's/Path=//')

	echo $PROFPATH
	sed -i "s/${F_PROF}/myprofile/" profiles.ini

	env MOZ_USE_XINPUT2=1 ~/.firefox/firefox %u

fi


