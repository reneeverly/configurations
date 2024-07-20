# Getting Started
This is the configuratiopn for `syzygy`, the successor to `dawn`, which was the successor to `sunshine`.  It is a Dell R610 with hardware Raid 6.

## 0. Fedora 40 upgrade
I'm not sure which version of Fedora is on it right now.  Likely Fedora 37 or 38.  Now that Fedora 40 is out, we'll definitely need to upgrade it.

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
