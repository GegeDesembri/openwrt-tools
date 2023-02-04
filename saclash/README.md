# SAClash

## Tentang

Tools ini saya buat berdasarkan masalah yang saya alami ketika menggunakan lebih dari satu modem USB Hilink pada perangkat Raspberry Pi 4 OpenWrt. Masalahnya adalah semua modem USB Hilink memiliki MAC Address yang serupa yakni `0C:5B:8F:27:9A:64`. Ini membuat saya tidak bisa menentukan interface mana yang digunakan pada modem tertentu seperti `eth1` untuk modem A dan `eth2` untuk modem B karena modem yang terhubung akan mengisi interface sesuai dengan urutan yang acak ketika perangkat direboot. Sehingga ketika hendak menggunakan Load Balance pada Clash saya tidak bisa menentukan secara interface mana yang akan terhubung pada setiap Proxy. Masalah itu untuk saat ini dapat saya atasi dengan melakukan route manual per-ip proxy melalui interface gateway.

Bagi kalian yang memiliki masalah yang serupa, silahkan coba tools ini. Semoga membantu.


## Install SAClash

### 1. Install Prerequisite

    opkg update
    opkg install gzip bash screen yq wget curl nano

### 2. Install Clash Premium

    wget -qO /usr/bin/clash.gz "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-arm64-2023.01.29.gz"
    gunzip /usr/bin/clash.gz
    chmod +x /usr/bin/clash

### 3. Install SAClash
  
    wget -qO /etc/init.d/saclash "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/saclash"
    chmod +x /etc/init.d/saclash

### 4. Start on boot

Tambahkan baris berikut di `/etc/rc.local` di atas `exit 0`
  
    /etc/init.d/saclash start


  
  
