# Getting Started
This is the list of steps used to bring `multiplexed-sunshine` back up to speed.  It previously ran CentOS-6, but I decided to try out Fedora 33 after CentOS-6 went EOL.

## 0. Add Data Volume
I don't know why the root partition defaults to only 15GB, but that's fine.  Use the web interface to create a new volume (75GB) and mount it.

## 1. Install Docker
I followed the [Official Install Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 2. Install AudioServe
The project's [GitHub Repository](https://github.com/izderadicka/audioserve) is a good place to start.  For this system my run command is as follows:
```
docker run -d --name audioserve -p 3000:3000 -v /rdata/music:/music -v /rdata/audiobooks:/audiobooks izderadicka/audioserve --no-authentication /music /audiobooks
```

## 3. Install Docker Compose
I followed the [Official Install Guide](https://docs.docker.com/compose/install/) for this.
