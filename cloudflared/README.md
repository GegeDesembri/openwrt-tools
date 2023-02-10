# Cloudflared Tunnels (Zero Trust)

## Tentang

Tools ini saya gunakan sebagai alternatif dari tools Zerotier untuk mengakses LuCI dari luar jaringan lokal. Tool ini menggunakan layanan dari Cloudflare Zero Trust.

## Install Cloudflared

    opkg update && \
    opkg install bash jq curl wget && \
    wget -qO /root/cloudflared.sh "https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/install.sh" && \
    chmod +x /root/cloudflared.sh && \
    /root/cloudflared.sh && \
    rm -rf /root/cloudflared.sh
