# General Utilities

## Fetch CPU and GPU Temperature

From the terminal: `sudo powermetrics --samplers smc | grep -i "die temperature"`

## Fetch Memory Usage

Activity Monitor has a fairly comprehensive view.

# OpenCore Utilities

## Disable ForceTouch if Trackpad doesn't show up in settings

Use ProperTree to edit `~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist` and set `ForceSuppressed` to True.

## Check OpenCore Version

`nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version`

# Internet Sharing Complications

## Forcing WPA2

I diy'd the edit, but theoretically this command would do the job as well.
```
sudo /usr/libexec/PlistBuddy -c "set :InternetSharing:SecurityType 'WPA2 Personal'" /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist
```

As it turns out my Surface 3 running Windows 8.1 cannot connect to WPA3 nor WPA2/WPA3 networks, so I have to force downgrade to WPA2.
