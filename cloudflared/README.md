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

## Cloudflared Tunnels Token

Cloudflared Tunnels membutuhkan sebuah token Cloudflare Zero Trust supaya dapat terhubung ke Argo Server Cloudflare.

Silahkan ikuti petunjuk pada link dibawah.

[Set up a tunnel through the dashboard](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#set-up-a-tunnel-remotely-dashboard-setup)

Copy Teks yang begaris bawah merah seperti pada di gambar.
![Token yang digunakan adalah yang bergaris bawah merah](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/token-example.png)

Masukkan ke dalam configurasi Cloudflared
    nano /etc/init.d/cloudflared

Ganti `your_token` dengan token yang sudah kamu miliki.
