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

1. Jalankan perintah `/root/cfdmgr i` untuk Install Cloudflared.
    
    > Pastikan untuk sudah menyimpan/menyalin token Cloudflare Zero Trust terlebih dahulu.
    
2. Beberapa perintah yang tersedia

   - `/root/cfdmgr i` : Install Cloudflared
   - `/root/cfdmgr e` : Edit Cloudflared token
   - `/root/cfdmgr s` : Activate/Disable autostart
   - `/root/cfdmgr u` : Update Cloudflared binary
   - `/root/cfdmgr r` : Uninstall Cloudflared

## Membuat domain

</br>

**PERHATIAN!!!**

</br>

1. Buatlah domain apapun, di situs manapun.
2. Pergi ke [Cloudflare Dashboard](https://dash.cloudflare.com) dan login, jika belum memiliki akun, silahkan mendaftar terlebih dahulu.
3. Lihat tab **`Website`** dibagian kiri layar, lalu klik **`Add Site`**
4. Cari domain yang sudah di daftarkan di langkah pertama (tunggu agak lama sampai terdeteksi).
5. Pada **`Step (1) Select plan`** , pilih **`FREE Plan`** (ada di bawah sendiri).
6. Pada **`Step (2) Review DNS Record`** bisa langsung scroll ke bawah untuk menekan tombol **`Continue`**.
6. Pada **`Step (3) ganti nameserver`**  sesuai yang dikasih cloudflare, lalu klik tombol **`Check nameservers`**.
8. Tidak perlu buat subdomain sendiri, karena subdomain untuk openwrt akan dibuat otomatis oleh sistem cloudflare ketika langkah ke-14 selesai.

Domain yang akan dipakai WAJIB sudah dimasukkan ke dalam akun [Cloudflare](https://dash.cloudflare.com/). Hingga muncul dalam daftar seperti pada gambar berikut</br>
![Domain Ready](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/domain-ready.png)

Jika sudah kamu bisa lanjut ke tahap berikutnya

![Create Domain](https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/assets/create-domain.png)

9. Pergi ke [Cloudflare ZeroTrust Dashboard](https://one.dash.cloudflare.com/)
10. `Access` > `Tunnels`
11. Pilih tunnel yang terhubung ke OpenWrt, klik `Configure`
12. Pilih tab `Public Hostname`
13. Klik `Add public Hostname`, Isi `Subdomain`, `Domain`, `Type`, dan `URL`
14. Klik `Save hostname`

## Referensi

- Setup : https://hmolina.dev/p/cloudflared-tunnel-in-openwrt/
- SSH Access : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/ssh/
- Samba Sharing : https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/use_cases/smb/

## Credits
- [Cloudflare Zero Trust](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/remote/#1-create-a-tunnel) - Cloudflared binaries and docs
- [Gege Desembri](https://github.com/GegeDesembri) - Main creator/maintainer
- [Helmi Amirudin](https://helmiau.com/pay) - **cfdmgr - Cloudflared Script Manager** for OpenWrt maintainer
