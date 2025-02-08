#!/bin/bash
#### install wine
apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
#apt --purge remove wine* -y
apt autoremove -y

wget -O /tmp/winehq.key https://dl.winehq.org/wine-builds/winehq.key
apt update
dpkg --add-architecture i386
apt install software-properties-common -y
apt-key add /tmp/winehq.key

apt install software-properties-common -y
#key ekleniyor
mkdir -pm755 /etc/apt/keyrings
rm -rf /etc/apt/keyrings/winehq*
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
#repostory ekleniyor
echo 'deb https://dl.winehq.org/wine-builds/debian/ bookworm main'> /etc/apt/sources.list.d/winehq.list
apt update
#debian en son stable versiyonunu https://www.debian.org/releases/ adresten bulabilirsiniz.
# güncel debian  12.9 olup ismini bookworm olarak kullanmaktadırlar
#https://dl.winehq.org/wine-builds/debian/dists/bookworm/main/binary-amd64/
#üstteki adresten versiyonlarını bulabilirsiniz.
#apt install --install-recommends winehq-devel -y
#apt install --install-recommends winehq-stable -y
#aşağıdakiler çalışan sürümler
#apt install winehq-staging=7.12~bookworm-1 wine-staging=7.12~bookworm-1 wine-staging-amd64=7.12~bookworm-1 wine-staging-i386=7.12~bookworm-1
#apt install winehq-staging=8.21~bookworm-1 wine-staging=8.21~bookworm-1 wine-staging-amd64=8.21~bookworm-1 wine-staging-i386=8.21~bookworm-1
#apt install winehq-stable=9.0.0.0~bookworm-1 wine-stable=9.0.0.0~bookworm-1 wine-stable-amd64=9.0.0.0~bookworm-1 wine-stable-i386=9.0.0.0~bookworm-1
apt install winehq-stable=9.0.0.0~bookworm-1 wine-stable=9.0.0.0~bookworm-1 wine-stable-amd64=9.0.0.0~bookworm-1 wine-stable-i386=9.0.0.0~bookworm-1 -y


#apt install --install-recommends winehq-stable -y
#apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
#apt update
#dpkg-reconfigure wine-stable-amd64 wine-stable wine-stable-i386 -y

apt install libgtk3-nocsd0:i386 -y
apt install gnupg2 -y
##apt install software-properties-common -y
#apt install --install-recommends  winetricks -y
apt install --no-install-recommends winetricks -y

apt install mono-complete -y
rm -rf /tmp/winemimetype.deb
wget -nc -O /tmp/winemimetype.deb https://github.com/bayramkarahan/wineplugin/raw/master/winemimetype.deb
sudo dpkg -i --force-all /tmp/winemimetype.deb

rm -rf /tmp/wineshare.deb
wget -nc -O /tmp/wineshare.deb https://github.com/bayramkarahan/wineshare/raw/master/wineshare.deb
sudo dpkg -i --force-all /tmp/wineshare.deb


apt autoremove -y
apt autoclean -y
#rm -rf /etc/apt/sources.list.d/winehq.list
rm -rf /etc/apt/sources.list.d/winehq*
rm -rf /etc/apt/keyrings/wine*
apt update
