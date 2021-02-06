# Getting Started
This is the configuration process for my personal server `multiplexed-sunshine`, a Sun Microsystems Ultra 24 (Intel Core 2 Quad with 4GB DDR2 memory, 4 drive bays on the SATA/SAS backplane, and an NVIDIA Quadro FX 370.)

## 0. Base Installation and Comments
As it's an older and slower system than a modern PC, I thought the installer was crashing on boot.  Turns out it's just very slow to boot, which was apparent after removing `quiet` from the grub entry.  Nothing fancy on this step, just a standard installation.

There is no desktop environment by default, so the web interface really takes over for general management purposes.  I'm very impressed with it so far: It's super lightweight yet capable.

## 1. Add Data Volume
I don't know why the root partition defaults to only 15GB, but that's fine.  Use the web interface to create a new volume (75GB) and mount it at `/rdata`.

## 2. Install Docker
I followed the [Official Install Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 3. Install Docker Compose
I followed the [Official Install Guide](https://docs.docker.com/compose/install/) for this.

## 4. Drop in docker-compose.yml
So far the docker-compose is set up with:
* [audioserve](https://github.com/izderadicka/audioserve) for music and audiobook streaming.
* [filebrowser](https://github.com/hurlenko/filebrowser-docker) for file management.

The volume mounting is currently limited to the primary disk of the system, as the only other disk is for backups.  Ideally I'll get another two disks spun up for even more storage capacity.
