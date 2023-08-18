#!/bin/bash
#### install wine

apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
#apt install libreoffice-calc -y
#apt install libreoffice-writer -y
#apt install libreoffice-impress -y
#apt install libreoffice-l10n-tr -y
#wget -O /tmp/ofis.deb http://depo.pardus.org.tr/etap/pool/non-free/w/wps-office/wps-office_10.1.0.6757pardus2_amd64.deb
#wget -O /tmp/ofis.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office_11.1.0.11664.XA_amd64.deb
#wget -O /tmp/ofis.deb https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
#dpkg -i /tmp/ofis.deb
wget -O /usr/bin/onlyoffice-desktopeditors https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.4.1/DesktopEditors-x86_64.AppImage
chmod a+x /usr/bin/onlyoffice-desktopeditors

apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y

##wget -O /tmp/wps-tr.deb https://github.com/bayramkarahan/wps-office-tr-dil/raw/master/wps-tr.deb
##dpkg -i /tmp/wps-tr.deb

#wget -nc -O /tmp/okularpdfreader.deb https://github.com/bayramkarahan/okularpdfreaderplugin/raw/master/okularpdfreader.deb
#sudo dpkg -i --force-all /tmp/okularpdfreader.deb

apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y

