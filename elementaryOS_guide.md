# Guide for setting up after installing Elementary OS
## Common First Steps
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim
```

## Disable automatic printer detection
```
vi /etc/avahi/avahi-daemon.conf -> enable-dbus=no
sudo service avahi-daemon stop
sudo service avahi-daemon start
```

### if too late to prevent initial printer detection issues...
```
sudo /etc/init.d/cups stop
vi /etc/cups/printers.conf -> remove bad printers
sudo /etc/init.d/cups start
```

## DO NOT INSTALL backport-iwlwifi-dkms

## Firefox style fix
Sure, install firefox from the app store.  Following the instructions [here](https://github.come/Zonnev/elementaryos-firefox-theme) gives you a pretty close visual to the GNOME browser that comes with elementary.

## Install windows fonts
So long as you have a valid license to install the standard set of Windows fonts, you can pull them from your windows partition.

C:/Windows/Fonts
* calibri.ttf, calibrib.ttf, calibrii.ttf, calibril.ttf, calibrili.ttf, calibriz.ttf
* times.ttf, timesbd.ttf, timesbi.ttf, timesi.ttf
* arial.ttf, arialbd.ttf, arialbi.ttf, ariali.ttf
* comic.ttf, comicbd.ttf, comici.ttf, comicz.ttf
* segoeui.ttf, segoeuib.ttf, segoeuii.ttf, segoeuiz.ttf, seguisym.ttf

## install LibreOffice the right way
using the store doesn't work very well
```
sudo apt-get install libreoffice
```

### Fix Calibri (maybe not required with the "right way" LibreOffice)
create `~/.config/fontconfig/fonts.conf`
Add text:
```
<match target="font" >
    <edit name="embeddedbitmap" mode="assign">
        <bool>false</bool>
    </edit>
</match>
```

## DO NOT INSTALL dropbox
Dropbox has not updated their linux client in a while, and it does not support links of any kind (must be located on boot disk)

If required, install from Windows instead.

## Bluetooth File Transfer
`blueman` from the app store
