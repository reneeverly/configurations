# General Utilities

## Fetch CPU and GPU Temperature

From the terminal: `sudo powermetrics --samplers smc | grep -i "die temperature"`

## Fetch Memory Usage

Activity Monitor has a fairly comprehensive view.

## Disable ForceTouch if Trackpad doesn't show up in settings

Use ProperTree to edit `~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist` and set `ForceSuppressed` to True.
