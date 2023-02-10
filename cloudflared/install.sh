#!/bin/bash

# Install Dependencies
opkg update
opkg install jq

# Github get data
get_latest_release() {
	curl -4 --silent "https://api.github.com/repos/$1/releases/latest" | jq -r .tag_name
}
latest_version="$(get_latest_release "cloudflare/cloudflared")"
wgetlink="https://github.com/cloudflare/cloudflared/releases/download/${latest_version}/cloudflared-linux-arm64"

# Install Cloudflared
wget -qO /usr/bin/cloudflared "${wgetlink}" && \
chmod +x /usr/bin/cloudflared

# Install init.d
wget -qO /etc/init.d/cloudflared "https://raw.githubusercontent.com/GegeDesembri/openwrt-tools/master/cloudflared/cloudflared" && \
chmod +x /etc/init.d/cloudflared

# Enable Cloudflared
/etc/init.d/cloudflared enable
/etc/init.d/cloudflared start
