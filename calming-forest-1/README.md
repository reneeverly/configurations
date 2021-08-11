# Raspberry Pi 3 A+ (TRS 80 Model 100 temporary replacement board)

## Additions to `/etc/rc.local`

```
echo 1 | sudo tee /sys/class/graphics/fbcon/rotate_all
stty cols 151

```
