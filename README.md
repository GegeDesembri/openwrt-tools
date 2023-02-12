# OpenWrt Tools

Semua OpenWrt Tools disini akan dikembangkan menggunakan shebang `bash`. Jadi pastikan terlebih dahulu OpenWrt terminal secara default menggunakan bash karena secara default OpenWrt Terminal menggunakan `sh` atau `ash`.

## Shell Bash Default

Gunakan perintah di bawah ini untuk menjadikan `bash` sebagai default shell pada terminal OpenWrt.

    opkg update && \
    opkg install bash sed && \
    sed -i "1 s|/ash$|/bash|g" /etc/passwd

## Index

- [SAClash](https://github.com/GegeDesembri/openwrt-tools/tree/master/saclash) - Manual Routing for Many USB Hilink Modem
- [Cloudflared](https://github.com/GegeDesembri/openwrt-tools/tree/master/cloudflared) - ZeroTier Alternative, true public access with domain
