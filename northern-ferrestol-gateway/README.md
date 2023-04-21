# northern-ferrestol-gateway

A Raspberry Pi 3B+ running OpenWRT.

## Steps

### Installing OpenWRT

Follow instructions: https://medium.com/swlh/raspberry-pi-as-a-home-router-539afc7a9574

Connect via the wireless modem in order to install the rtl8152 driver.

### Docker

I don't know if I plan on doing any container things on this device, but just in case, let's install Docker.

```
opkg instal dockerd docker luci-app-dockerman docker-compose
```

### Bandwidth Monitoring

```
opkg install luci-app-nlbwmon
```

### Print Server

```
opkg install luci-app-p910nd
```

Further instructions for prereqs here: https://openwrt.org/docs/guide-user/services/print_server/p910nd.server
