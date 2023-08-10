# northern-ferrestol-gateway

A Raspberry Pi 3B+ running OpenWRT.

## Steps

### Installing OpenWRT

#### Flashing for the first time
Follow instructions: https://medium.com/swlh/raspberry-pi-as-a-home-router-539afc7a9574

Connect via the wireless modem in order to install the rtl8152 driver.

#### Reflashing/updating through LuCI

Fetch from: https://firmware-selector.openwrt.org/

Add packages to the base image:
```
kmod-usb-net-rtl8152 r8152-firmware kmod-crypto-sha256 kmod-usb-net-cdc-ncm kmod-usb-net kmod-mii kmod-usb-net-cdc-ether
kmod-usb-printer
p910nd
luci-app-p910nd luci-compat luci-lua-runtime lua liblua5.1.5 luci-lib-base luci-lib-nixio luci-lib-ip libnl-tiny1 luci-lib-jsonc liblucihttp-lua libubus-lua ucode-mod-lua
```
(Initial package in row is the package required, all following are dependencies.)

### Docker

I don't know if I plan on doing any container things on this device, but just in case, let's install Docker.

```
opkg instal dockerd docker luci-app-dockerman docker-compose
```

In order to get port forwarding to work, you need to edit the firewall rule for `lan` such that it reads: `lan` &rArr; `wan, docker`

### Bandwidth Monitoring

```
opkg install luci-app-nlbwmon
```

### Print Server

```
opkg install luci-app-p910nd
```

Further instructions for prereqs here: https://openwrt.org/docs/guide-user/services/print_server/p910nd.server
