# Getting Started
This is the configuration for `syzygy`, a Dell PowerEdge R610 with Hardware RAID.  It is the permanent successor to `sunshine`, a Sun Microsystems Ultra24; which had been temporarily succeeded by `dawn`, a laptop I had on hand.  Syzygy has 32GB of RAM, two 500GB disks in RAID-1 for `/`, and four 500GB disks in RAID-6 for `/rdata/`.

## 0. Fedora 39 upgrade
Syzygy was running Fedora 37, so followed [Upgrading Fedora Linux Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/) along the official guidance to only hop two releases.  Reminder to self: Fedora 39 goes EOL in November, Fedora 41 releases in October; Upgrade then.

## 2. Install Docker
I followed the [Official Docker Install Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 3. Install Docker Compose
I followed the [Official Docker Compose Install Guide](https://docs.docker.com/compose/install/) for this.

## 4. Drop in docker-compose.yml
The docker-compose is set up with:
* Backend:
  * [nginx](https://github.com/nginxinc/docker-nginx) for reverse proxy.
  * phpfpm
  * hardillb/nginx-proxy-avahi-helpera to catch container startup
  * static-mdns.Dockerfile to publish mdns for each container when it starts
* Applications:
  * [filebrowser](https://github.com/hurlenko/filebrowser-docker) for file management.
  * [homer](https://github.com/bastienwirtz/homer) for managing links and providing a dashboard.
  * [Piwigo](https://github.com/linuxserver/docker-piwigo) as a photo and art backup system.
