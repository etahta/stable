#!/bin/bash
#### install debs


echo "kurulacak***************************************************************"
mkdir chroot/tmp/debs
#wget -O chroot/tmp/debs/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget -O chroot/tmp/debs/brave.deb http://depo.pardus.org.tr/pardus/pool/non-free/b/brave-browser/brave-browser_1.45.133_amd64.deb

#wget -O chroot/tmp/debs/firefox-l10n.deb http://ftp.tr.debian.org/debian/pool/main/f/firefox/firefox-l10n-tr_113.0-1_all.deb
#wget -O chroot/tmp/debs/firefox.deb http://ftp.tr.debian.org/debian/pool/main/f/firefox/firefox_113.0-1_amd64.deb 

cp debs/* chroot/tmp/debs/


cp debs.sh chroot/tmp/debs/debs.sh
#run install
chroot chroot /tmp/debs/debs.sh

wget -O chroot/tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=tr"
tar -xvf chroot/tmp/firefox.tar.bz2 -C chroot/etc/skel/
mv chroot/etc/skel/firefox chroot/etc/skel/.firefox
chroot chroot apt install libdbus-glib-1-2 -y
mkdir -p chroot/usr/lib/firefox
ln -s /etc/skel/.firefox/firefox chroot/usr/lib/firefox/firefox
ln -s /etc/skel/.firefox/firefox chroot/usr/bin/firefox

#tar xvf chroot/tmp/firefox-$VERSION.tar.bz2
#rm chroot/tmp/firefox-$VERSION.tar.bz2
#mv ./firefox chroot/opt/
#chmod 755 chroot/opt/firefox
#apt update
#apt install libdbus-glib-1-2 --reinstall -y
