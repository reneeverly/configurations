# Getting Started
This is the configuration for `syzygy`, a Dell PowerEdge R610 with Hardware RAID.  It is the permanent successor to `sunshine`, a Sun Microsystems Ultra24; which had been temporarily succeeded by `dawn`, a laptop I had on hand.  Syzygy has 32GB of RAM, two 500GB disks in RAID-1 for `/`, and four 500GB disks in RAID-6 for `/rdata/`.  It also has four NICs which could be relevant for when I move it in like six months.

## 0. Fedora 39 upgrade
Syzygy was running Fedora 37, so followed [Upgrading Fedora Linux Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/) along the official guidance to only hop two releases.  Reminder to self: Fedora 39 goes EOL in November, Fedora 41 releases in October; Upgrade then.

## 2. Install Docker
I followed the [Official Docker Install Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 3. Install Docker Compose
I followed the [Official Docker Compose Install Guide](https://docs.docker.com/compose/install/) for this.

## 4. Drop in docker-compose.yml
The docker-compose is set up with:
* [filebrowser](https://github.com/hurlenko/filebrowser-docker) for file management.
* [docker-static-website](https://github.com/lipanski/docker-static-website) for static site hosting, homepage, link management, etc.

## 5. Fix mDNS
Via [This guide](https://gist.github.com/jimmydo/cdd07003150b379afd3d40ba233f5835):
>Set `MulticastDNS` to `yes` and apply the change:
>
>```shell
>sudo vi /etc/systemd/resolved.conf
>sudo systemctl restart systemd-resolved
>```
>
>Enable mDNS on the network interface and apply the change:
>
>```shell
>sudo nmcli connection modify eno1 connection.mdns yes
>sudo nmcli connection up eno1
>```
And [this reddit comment](https://www.reddit.com/r/Fedora/comments/1afn0kz/how_to_enable_fedora_server_39_local_name_and/):
>Add UDP 5353 to the firewall via Cockpit.

## 6. Acquire the Immich compose file
Follow the [Official Guide Here](https://immich.app/docs/install/docker-compose/#step-4---upgrading).

Edit the `.env` file such that:
```shell
# The location where your uploaded files are stored
UPLOAD_LOCATION=/rdata/immich
# The location where your database files are stored
DB_DATA_LOCATION=/rdata/configs/immich
```
Note to self: I typo'd the `DB_DATA_LOCATION` path in the current live version of the env file.  I should probably fix that sometime soon.  I'm also considering moving `UPLOAD_LOCATION` since the data isn't parsable except by Immich anyways.  Generally the stuff in `/rdata` is standard files-in-folders paradigm so it's not ideal.
