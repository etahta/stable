#!/bin/bash

#Firefox Linux amd64 TR stable için:
wget -O /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=tr"

#Firefox Linux amd64 TR Beta için kodu aktif ediniz!!!:
#wget -O /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=tr"

mkdir /usr/share/applications
cat >> /usr/share/applications/Firefox.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Firefox
Name[tr]=Firefox
Comment=Browse the World Wide Web
Comment[tr]=İnternet'te Gezinin
GenericName=Web Browser
GenericName[tr]=Web Tarayıcı
Keywords=Internet;WWW;Browser;Web;Explorer
Keywords[tr]=İnternet;WWW;Tarayıcı;Web;Gezgin;Web sitesi;Site;sörf;çevrimiçi;tara
Exec=env MOZ_USE_XINPUT2=1 /usr/lib/firefox/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/lib/firefox/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=NewWindow;NewPrivateWindow;

[Desktop Action NewWindow]
Name=Open a New Window
Name[tr]=Yeni pencere aç 
Exec=firefox -new-window
OnlyShowIn=Unity;

[Desktop Action NewPrivateWindow]
Name=Open a New Private Window
Name[tr]=Yeni gizli pencere aç
Exec=firefox -private-window
OnlyShowIn=Unity;
EOF
tar -xvf /tmp/firefox.tar.bz2 -C /usr/lib/
apt install libdbus-glib-1-2 -y
#sudo ln -s $HOME/.local/firefox/firefox /usr/bin/firefox
