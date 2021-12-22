# Installing mDNS on Elementary OS

## The Problem
Installing `avahi-daemon` shouldn't be a problem, right?
```
sudo apt install avahi-daemon
```
After hanging for about 30 seconds, it returns error code (1).

## The Solution
As suggested at https://www.linuxquestions.org/questions/linux-software-2/avahi-daemon-error-messages-that-may-be-solved-by-editing-the-configuration-file-4175672196/

Edit `/etc/avahi/avahi-daemon.conf` to comment out the line `enable-dbus=no`.

Now you can rerun the apt command and it will complete as expected.
