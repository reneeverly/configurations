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
luci
kmod-usb-net-rtl8152
kmod-usb-printer
p910nd
luci-app-p910nd
```
(Initial package in row is the package required, all following are dependencies.)

Edit 2023-10-06: Reflashing resulted in a weird web experience, adding LUCI here will hopefull fix that for next time.

### Bandwidth Monitoring

```
opkg install luci-app-nlbwmon
```

### Print Server
(This is already handled if config backup is applied and reflash packages are added to base image.)

```
opkg install luci-app-p910nd
```

Further instructions for prereqs here: https://openwrt.org/docs/guide-user/services/print_server/p910nd.server

### VLMCSD
Upload & install the first package:
https://github.com/cokebar/openwrt-vlmcsd

Upload & install the second package:
https://github.com/cokebar/luci-app-vlmcsd


### USB Webcam / Security Camera Setup
```
opkg install kmod-video-uvc luci-app-mjpg-streamer mjpg-streamer-input-uvc mjpg-streamer-www mjpg-streamer-output-http
```
