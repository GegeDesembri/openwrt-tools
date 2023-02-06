# SAClash

## Tentang

Tools ini saya buat berdasarkan masalah yang saya alami ketika menggunakan lebih dari satu modem USB Hilink pada perangkat Raspberry Pi 4 OpenWrt. Masalahnya adalah semua modem USB Hilink memiliki MAC Address yang serupa yakni `0C:5B:8F:27:9A:64`. Ini membuat saya tidak bisa menentukan interface mana yang digunakan pada modem tertentu seperti `eth1` untuk modem A dan `eth2` untuk modem B karena modem yang terhubung akan mengisi interface sesuai dengan urutan yang acak ketika perangkat direboot. Sehingga ketika hendak menggunakan Load Balance pada Clash saya tidak bisa menentukan secara interface mana yang akan terhubung pada setiap Proxy. Masalah itu untuk saat ini dapat saya atasi dengan melakukan manual routing per-ip proxy melalui interface gateway.

Disini saya menggunakan Clash Premium tidak melalui tools pihak ketiga seperti OpenClash.

Bagi kalian yang memiliki masalah yang serupa, silahkan coba tools ini.

Semoga membantu.

## Devices

- Raspberry Pi 4 Model B Rev 1.4
- Huawei USB Modem E5577CS-603 (WebUI Mod)
- Huawei USB Modem E8372H-153 (WebUI Huawei)

## Device Overview

    Hostname: OpenWrt
    Model: Raspberry Pi 4 Model B Rev 1.4
    Architecture: ARMv8 Processor rev 3
    Target Platform: bcm27xx/bcm2711
    Firmware Version: OpenWrt 22.03.3 r20028-43d71ad93e / LuCI openwrt-22.03 branch git-22.361.69894-438c598
    Kernel Version: 5.10.161

    Device name: E5577CS-603
    Hardware version: CL3E5573SM06
    Software version: 21.333.01.00.00
    Web UI version:	17.100.18.03.143-Mod1.21

    Nama perangkat:	E8372H-153
    Versi perangkat keras: CL1E8372HM
    Versi perangkat lunak: 21.333.64.00.1456
    Versi WEBUI: 17.100.20.09.1456

## SAClash Overview

- IP Gateway setiap modem harus berbeda
- Started delay 60 seocnds after Device Boot
- SAClash Auto Route Watchdog every 1 second
- SAClash akan otomatis re-route sesuai Gateway jika modem dicabut lalu dimasukkan kembali
- YACD: `http://<IP_OPENWRT>:9090/ui/yacd/?hostname=<IP_OPENWRT>&port=9090&secret=123456`

## Install SAClash

### 1. Prepare

- Disable OpenClash
- Uncheck `Use default gateway` pada setiap hilink interface [*Interfaces* > *HILINK* > *Edit* > *Advanced Settings* > *uncheck `Use default gateway`* > *Save*] <*Bisa disable setelah instalasi karena membutuhkan internet untuk install*>

### 2. Install Prerequisite

    opkg update
    opkg install zip unzip gzip bash screen yq wget curl nano

### 3. Install [Clash Premium](https://github.com/Dreamacro/clash/releases/tag/premium)

    wget -qO /usr/bin/clash.gz "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-arm64-2023.01.29.gz"
    gunzip /usr/bin/clash.gz
    chmod +x /usr/bin/clash
    
### 4. Install WebUI (Source: [OpenClash](https://github.com/vernesong/OpenClash))

    mkdir -p /etc/gegevps/saclash
    wget -qO /etc/gegevps/saclash/ui.zip "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/ui.zip"
    unzip /etc/gegevps/saclash/ui.zip -d /etc/gegevps/saclash
    rm -rf /etc/gegevps/saclash/ui.zip

### 5. Install SAClash
  
    wget -qO /etc/init.d/saclash "https://github.com/GegeDesembri/openwrt-tools/raw/master/saclash/saclash"
    chmod +x /etc/init.d/saclash

### 6. Bash Command

Edit baris pertama (`root`) pada `/etc/passwd` menjadi bash seperti dibawah ini
  
    root:x:0:0:root:/root:/bin/bash

### 7. Start on boot

Tambahkan baris di bawah ini di `/etc/rc.local` di atas `exit 0`
  
    /etc/init.d/saclash start

## SAClash Service

Start SAClash

    /etc/init.d/saclash start

Stop SAClash

    /etc/init.d/saclash stop
    
Restart SAClash

    /etc/init.d/saclash restart

## Configuration Docs

Ada beberapa ketentuan konfigurasi Clash yang harus disesuaikan. Lihat contoh konfigurasi pada file [config.yaml](https://github.com/GegeDesembri/openwrt-tools/blob/master/saclash/config.yaml).
- Tambahkan key `gateway` pada setiap proxy dengan value berisi alamat Gateway Modem Hilink
- Key `server` harus berupa IP Address bukan domain
- Jangan lupa untuk menambakan IP Server Proxies pada DNS Fallback CIDR
- File konfigurasi harus berada di `/etc/gegevps/saclash/config.yaml`

## Changelogs

**2023-02-06**
- [FIX] Proxies tidak terhubung padahal gateway sudah sesuai
- [FIX] Internet di dalam OpenWrt jalan tetapi tidak bisa digunakan melalui LAN
- [FIX] Internet sudah terhubung melalui LAN (Windows) tetapi "not resolv domain"

