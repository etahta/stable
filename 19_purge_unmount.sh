#!/bin/bash
for item in $(ls chroot/usr/share/locale)
do
	if [ "$item" == "tr" ] || [ "$item" == "en" ] || [ "$item" == "tr_TR.UTF-8" ] || [ "$item" == "tr_TR.utf8" ] || [ "$item" == "tr_TR" ] || [ "$item" == "tr.UTF-8" ] || [ "$item" == "tr.utf8" ]
	then
		#rm -rf ./liste/$item
		echo "var" 1>/dev/null
	else
		rm -rf chroot/usr/share/locale/$item
	fi
done

for item in $(ls chroot/opt/onlyoffice/desktopeditors/dictionaries)
do
	if [ "$item" == "tr_TR" ]
	then
		#rm -rf ./liste/$item
		echo "var" 1>/dev/null
	else
		rm -rf chroot/opt/onlyoffice/desktopeditors/dictionaries/$item
	fi
done

for item in $(ls chroot/opt/onlyoffice/desktopeditors/locales)
do
	if [ "$item" == "tr.pak" ]
	then
		#rm -rf ./liste/$item
		echo "var" 1>/dev/null
	else
		rm -rf chroot/opt/onlyoffice/desktopeditors/locales/$item
	fi
done

rm -rf chroot/usr/share/applications/xinput_calibrator.desktop
#chroot chroot /bin/bash || true
### Remove sudo (optional)
#chroot chroot apt purge sudo -y
#chroot chroot apt remove thunar -y
#chroot chroot apt purge thunar -y
chroot chroot apt autoremove -y
apt update
apt install libdbus-glib-1-2 ---reinstall -y
#chroot chroot /usr/sbin/update-initramfs -u
# Çekirdek sürümünü öğren
KERNEL_VERSION=$(chroot chroot dpkg -l | grep 'linux-image' | awk '{print $3}' | head -1)
# Manuel initramfs oluştur
chroot chroot mkinitramfs -o /boot/initrd.img-${KERNEL_VERSION} ${KERNEL_VERSION}

#chroot chroot apt-get update
rm -rf chroot/etc/apt/sources.list.d/*
#### Clear logs and history
chroot chroot apt-get clean


rm -f chroot/root/.bash_history
rm -rf chroot/var/lib/apt/lists/*
rm -rf chroot/tmp/*

find chroot/var/log/ -type f | xargs rm -f

#### umount
for dir in dev dev/pts proc sys ; do
    while umount -lf -R chroot/$dir 2>/dev/null ; do true; done
done
