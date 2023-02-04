# SAClash

## Tentang

Tools ini saya buat berdasarkan masalah yang saya alami ketika menggunakan lebih dari satu modem USB Hilink pada perangkat Raspberry Pi 4 OpenWrt. Masalahnya adalah semua modem USB Hilink memiliki MAC Address yang serupa yakni `0C:5B:8F:27:9A:64`. Ini membuat saya tidak bisa menentukan interface mana yang digunakan pada modem tertentu seperti `eth1` untuk modem A dan `eth2` untuk modem B karena modem yang terhubung akan mengisi interface sesuai dengan urutan yang acak ketika perangkat direboot. Sehingga ketika hendak menggunakan Load Balance pada Clash saya tidak bisa menentukan secara interface mana yang akan terhubung pada setiap Proxy. Masalah itu untuk saat ini dapat saya atasi dengan melakukan manual routing per-ip proxy melalui interface gateway.

Disini saya menggunakan Clash Premium tidak melalui tools pihak ketiga seperti OpenClash.

Bagi kalian yang memiliki masalah yang serupa, silahkan coba tools ini.

Semoga membantu.

## Devices

- Raspberry Pi 4 Model B Rev 1.4
- Huawei USB Modem E3372 (WebUI Mod)
- Huawei USB Modem E8372h-153 (WebUI Huawei)

## Device Overview

    Hostname: OpenWrt
    Model: Raspberry Pi 4 Model B Rev 1.4
    Architecture: ARMv8 Processor rev 3
    Target Platform: bcm27xx/bcm2711
    Firmware Version: OpenWrt 22.03.3 r20028-43d71ad93e / LuCI openwrt-22.03 branch git-22.361.69894-438c598
    Kernel Version: 5.10.161

## SAClash Overview

- Started delay 60 after Device Boot
- SAClash Auto Route Watchdog every 1 second

## Install SAClash

### 1. Prepare

- Disable OpenClash
- Uncheck `Use default gateway` pada setiap hilink interface [*Interfaces* > *HILINK* > *Edit* > *Adavanced Settings* > *uncheck `Use default gateway`* > *Save*]

### 1. Install Prerequisite

    opkg update
    opkg install zip unzip gzip bash screen yq wget curl nano

### 2. Install Clash Premium

    wget -qO /usr/bin/clash.gz "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-arm64-2023.01.29.gz"
    gunzip /usr/bin/clash.gz
    chmod +x /usr/bin/clash
    
### 3. Install User Interface (Source: OpenClash)

    mkdir -p /etc/gegevps/saclash
    wget -qO /etc/gegevps/saclash/ui.zip "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/ui.zip"
    unzip /etc/gegevps/saclash/ui.zip -d /etc/gegevps/saclash
    rm -rf /etc/gegevps/saclash/ui.zip

### 3. Install SAClash
  
    wget -qO /etc/init.d/saclash "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/saclash"
    chmod +x /etc/init.d/saclash

### 4. Start on boot

Tambahkan baris berikut di `/etc/rc.local` di atas `exit 0`
  
    /etc/init.d/saclash start

## Configuration Docs

Ada beberapa ketentuan konfigurasi Clash yang harus disesuaikan.
- Tambahkan key `gateway` pada setiap proxy dengan value berisi alamat Gateway Modem Hilink
- Key `server` harus berupa IP Address bukan domain
- Lihat contoh konfigurasi pada file `example.yaml`
