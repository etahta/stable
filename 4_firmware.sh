#!/bin/bash
      #firmware-ivtv firmware-ipw2x00 \
      #firmware-zd1211
      #firmware-b43-installer \
      #firmware-b43legacy-installer \
      #firmware-intel-sound zd1211-firmware firmware-sof-signed  firmware-siano firmware-myricom firmware-netxen firmware-qlogic firmware-cavium firmware-atheros \

chroot chroot apt-get install \
firmware-intel-sound \
firmware-sof-signed \
zd1211-firmware \
firmware-netxen \
firmware-qlogic \
firmware-iwlwifi \
firmware-linux \
firmware-linux-free \
firmware-ralink \
firmware-realtek \
firmware-samsung \
firmware-ti-connectivity -y
	#firmware-linux-nonfree \
	#firmware-misc-nonfree \
      	#firmware-atheros \
     	# firmware-amd-graphics \
     	# firmware-siano \
     	# bluez-firmware \     
     	# firmware-myricom \
	# firmware-cavium \
	# firmware-bnx2 \
	# firmware-bnx2x \
	# firmware-brcm80211 \
	#firmware-libertas \

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

 # gcc güncelleniyor
chroot chroot apt install build-essential -y
chroot chroot apt-get install manpages-dev -y
