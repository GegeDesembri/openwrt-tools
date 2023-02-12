# Cloudflared Tunnels (Zero Trust)

## Tentang

Tools ini saya gunakan sebagai alternatif dari tools [ZeroTier](https://openwrt.org/docs/guide-user/services/vpn/zerotier/start) untuk mengakses LuCI dari luar jaringan lokal. Tool ini menggunakan layanan dari Cloudflare Zero Trust.

![Token yang digunakan adalah yang bergaris bawah merah](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/overview.png)

Saya sudah menggunakan ini sejak lama tapi di sistem Linux Server supaya tidak perlu mengekspos port lokal untuk webserver. Kalau di OpenWrt baru sekarang terpikir untuk mencoba dan ternyata berhasil walau belum sempurna. Jika kalian tertarik silahkan kalian pelajari dokumentasi Cloudflare Zero Trust.

## Download Cloudflared Script Manager

    wget -qO /root/cfdmgr "https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/cfdmgr" && \
    chmod +x /root/cfdmgr

## Cloudflared Tunnels Token

Cloudflared Tunnels membutuhkan sebuah token Cloudflare Zero Trust supaya dapat terhubung ke Argo Server Cloudflare.

Silahkan ikuti petunjuk pada link dibawah.

[Create a tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#1-create-a-tunnel)

Copy Teks yang begaris bawah merah seperti pada di gambar.
![Token yang digunakan adalah yang bergaris bawah merah](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/token-example.png)

## Pemakaian
1. Jalankan perintah `./root/cfdmgr i` untuk Install Cloudflared.
    
    > Pastikan untuk sudah menyimpan/menyalin token Cloudflare Zero Trust terlebih dahulu.
    
2. Beberapa perintah yang tersedia

   - `/root/cfdmgr i` : Install Cloudflared
   - `/root/cfdmgr e` : Edit Cloudflared token
   - `/root/cfdmgr s` : Activate/Disable autostart
   - `/root/cfdmgr u` : Update Cloudflared binary
   - `/root/cfdmgr r` : Uninstall Cloudflared

## Membuat domain

![Create Domain](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/create-domain.png)

1. Pergi ke https://one.dash.cloudflare.com/
2. `Access` > `Tunnels`
3. Pilih tunnel yang terhubung ke OpenWrt, klik `Configure`
4. Pilih tab `Public Hostname`
5. Klik `Add public Hostname`, Isi `Subdomain`, `Domain`, `Type`, dan `URL`
6. Klik `Save hostname`

## Referensi

- Setup : https://hmolina.dev/p/cloudflared-tunnel-in-openwrt/
- SSH Access : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/ssh/
- Samba Sharing : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/smb/

## Credits
- [Cloudflare Zero Trust](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#1-create-a-tunnel) - Cloudflared binaries and docs
- [Gege Desembri](https://github.com/GegeDesembri) - Main creator/maintainer
- [Helmi Amirudin](https://helmiau.com/pay) - **cfdmgr - Cloudflared Script Manager** for OpenWrt maintainer
