# Getting Started
This is the list of steps used to bring `multiplexed-sunshine` back up to speed.  Between CentOS-6 going EOL and RedHat announcing the end of CentOS, I decided to try out Fedora for a while.

## 0. Add Data Volume
I don't know why the root partition defaults to only 15GB, but that's fine.  Use the web interface to create a new volume (75GB) and mount it.

## 1. Install Docker
I followed the [Official Guide](https://docs.docker.com/engine/install/fedora/) for this.

## 2. Install AudioServe
The project's [GitHub Repository](https://github.com/izderadicka/audioserve) is a good place to start.  For this system my run command is as follows:
```
docker run -d --name audioserve -p 3000:3000 -v /rdata/music:/music -v /rdata/audiobooks:/audiobooks izderadicka/audioserve --no-authentication /music /audiobooks
```
