# NTS Dreamwriter 325

## Transfering Files Over ~Serial~ XMODEM

In the past, I was able to get by with basic serial, but there are some challenges that come with transfering the non-ascii files that way.  Now, I am using XMODEM protocol.

To receive a file from the DreamWriter, use `./xrecv.sh filename` where `./xrecv.sh` is:
```sh
DEV=/dev/tty.usbserial-AD0K5LKG

stty -f $DEV 9600
rz $1 -X > $DEV < $DEV
```

To send a file to the DreamWriter, use `./xsend.sh filename` where `./xsend.sh` is:
```sh
DEV=/dev/tty.usbserial-AD0K5LKG

stty -f $DEV 9600
sz -X $1 > $DEV < $DEV
```

## Non-ASCII Files

### Character Set

8x and 9x are exactly the same as in CP437, but the rest differ.
8x through Bx confirmed through using the word processor, Cx exists in ROM, but might not be accessible through word processor.  TODO: Determine that.

|    | 0| 1| 2| 3| 4| 5| 6| 7| 8| 9| A| B| C| D| E| F|
|----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
|8x  | Ç| ü| é| â| ä| à| å| ç| ê| ë| è| ï| î| ì| Ä| Å|
|9x  | É| æ| Æ| ô| ö| ò| û| ù| ÿ| Ö| Ü| ¢| £| ¥| ₧| ƒ|
|Ax  | á| í| ó| ú| ñ| Ñ| ª| º| ¿| ¨| §| ½| ¼| ¡| «| »|
|Bx  | α| ß| Γ| π| Σ| σ| µ| τ| Ω| δ| φ| ±| °| ·| ²| √|
|Cx\*| └| ┴| ┬| ├| ─| ┼| │| ┤| ┐| ┘| ┌|  |  |  |  |  |

### Command Sequences

|Sequence|Meaning|
|--|--|
|\x08\x6c|Carriage Return|
|\xe5|Toggle Micro Text
|\xf0|Start Underlined Text|
|\xf1|End Underlined Text|
|\xf6|Start Expanded Text|
|\xf7|End Expanded Text|
|\xf8|Start Bolded Text|
|\xf9|End Bolded Text|
|\xfa|Start Superscript Text|
|\xfb|End Superscript Text|
|\xfc|Start Subscript Text|
|\xfd|End Subscript Text|

### Converting Non-ASCII Files to Text

This just converts CRs to ascii CRs.
```
cat journal_2022_04_16.bin | perl -pe 's,\x08\x6c,\n,g' > journal_2022_04_16.txt
```

### Converting Non-ASCII Files to RTF
wip
