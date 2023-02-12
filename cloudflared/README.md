# Cloudflared Tunnels (Zero Trust)

## Tentang

Tools ini saya gunakan sebagai alternatif dari tools [ZeroTier](https://openwrt.org/docs/guide-user/services/vpn/zerotier/start) untuk mengakses LuCI dari luar jaringan lokal. Tool ini menggunakan layanan dari Cloudflare Zero Trust.

![Token yang digunakan adalah yang bergaris bawah merah](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/overview.png)

Saya sudah menggunakan ini sejak lama tapi di sistem Linux Server supaya tidak perlu mengekspos port lokal untuk webserver. Kalau di OpenWrt baru sekarang terpikir untuk mencoba dan ternyata berhasil walau belum sempurna. Jika kalian tertarik silahkan kalian pelajari dokumentasi Cloudflare Zero Trust.

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

[Create a tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#1-create-a-tunnel)

Copy Teks yang begaris bawah merah seperti pada di gambar.
![Token yang digunakan adalah yang bergaris bawah merah](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/token-example.png)

Masukkan ke dalam configurasi Cloudflared

    nano /etc/init.d/cloudflared

Ganti `your_token` dengan token yang sudah kamu miliki.

## Enable and Start

Setelah set Token kamu bisa enable dan start Cloudflared

    /etc/init.d/cloudflared enable
    /etc/init.d/cloudflared start

## Membuat domain

1. Pergi ke https://one.dash.cloudflare.com/
2. `Access` > `Tunnels`
3. Pilih tunnel yang terhubung ke OpenWrt, klik `Configure`
4. Pilih tab `Public Hostname`
5. Klik `Add public Hostname`, Isi `Subdomain`, `Domain`, `Type`, dan `URL`
6. Klik `Save hostname`

## Referensi

Setup : https://hmolina.dev/p/cloudflared-tunnel-in-openwrt/

SSH Access : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/ssh/

Samba Sharing : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/smb/
