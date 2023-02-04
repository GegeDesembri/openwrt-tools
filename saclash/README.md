# SAClash

## Install SAClash

### Install Prerequisite

    opkg update
    opkg install gzip bash screen yq wget curl nano

### Install Clash Premium

    wget -qO /usr/bin/clash.gz "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-arm64-2023.01.29.gz"
    gunzip /usr/bin/clash.gz
    chmod +x /usr/bin/clash

### Install SAClash
  
    wget -qO /etc/init.d/saclash "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/saclash"
    chmod +x /etc/init.d/saclash

### Start on boot

Tambahkan baris berikut di `/etc/rc.local` di atas `exit 0`
  
    /etc/init.d/saclash start


  
  
