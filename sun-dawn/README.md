# Getting Started
This is the configuration process for `dawn`, the (hopefully temporary) successor to my previous server `sunshine` (perished due to a power surge on an ungrounded outlet).  `dawn` is a Dell Inspiron N4110 (Intel i3-2350m with 6GB memory).  `dawn` has two less cores than `sunshine`, but two more GB of ram - so we will see how it performs.

## 0. Fedora 35 configuration
I bricked the first four Fedora 35 installs by installing updates.  Turns out something about `wpa_supplicant` 1.10 completely breaks wireless; Whether that is due to the default `wpa_supplicant` config or the specific driver combination is something that I did not feel like determining.  It is easier to just disable updating `wpa_supplicant`.  Add the following to `/etc/dnf/dnf.conf`:
```
exclude=wpa_supplican*
```
If, at some point, I decide to update wpa_supplicant, I should definitely remember to disable kernel updates at the same time.  DNF undo only works when the kernel has not also been updated.
```
exclude=kernel*
```


An additional consideration is that closing the lid sends the laptop to sleep.  This is not ideal for a device intended to be a server.  Edit `/etc/systemd/logind.conf` and add the line:
```
HandleLidSwitch=ignore
```
## 1. Fan Control
The default fan profile is... bad.  Install lm sensors to enable fan control.
```
sudo yum install lm_sensors
```

Drop the fancontrol file in as `/etc/fancontrol`, then start the service.
```
sudo systemctl enable fancontrol
sydo systemctl start fancontrol
```

## 2. Install Docker
I followed the [Official Docker Install Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 3. Install Docker Compose
I followed the [Official Docker Compose Install Guide](https://docs.docker.com/compose/install/) for this.

## 4. Drop in docker-compose.yml
The docker-compose is set up with:
* Backend:
  * [nginx](https://github.com/nginxinc/docker-nginx) for reverse proxy.
  * phpfpm
  * coredns
* Applications:
  * [audioserve](https://github.com/izderadicka/audioserve) for music and audiobook streaming.
  * [filebrowser](https://github.com/hurlenko/filebrowser-docker) for file management.
  * [homer](https://github.com/bastienwirtz/homer) for managing links and providing a dashboard.
  * Scrutiny
  * Pinry
