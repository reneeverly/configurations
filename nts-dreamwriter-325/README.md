# NTS Dreamwriter 325

## Transfering Files Over Serial

```
cat /dev/tty.usbserial-AD0K5LKG > journal_2022_04_16.bin
```

## Non-ASCII Files

|Sequence|Meaning|
|--|--|
|\x08\x6c|Carriage Return|
|\x82|&eacute;|
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
