#!/bin/bash

case $1 in
	red)
		VARR=255
		VARG=59
		VARB=48
		;;
	orange)
		VARR=255
		VARG=149
		VARB=0
		;;
	yellow)
		VARR=255
		VARG=204
		VARB=0
		;;
	green)
		VARR=40
		VARG=205
		VARB=65
		;;
	mint)
		VARR=0
		VARG=199
		VARB=190
		;;
	teal)
		VARR=89
		VARG=173
		VARB=196
		;;
	cyan)
		VARR=85
		VARG=190
		VARB=240
		;;
	blue)
		VARR=0
		VARG=122
		VARB=255
		;;
	indigo)
		VARR=88
		VARG=86
		VARB=214
		;;
	purple)
		VARR=175
		VARG=82
		VARB=222
		;;
	pink)
		VARR=255
		VARG=45
		VARB=85
		;;
	brown)
		VARR=162
		VARG=132
		VARB=94
		;;
	gray | grey)
		VARR=142
		VARG=142
		VARB=147
		;;
	*)
		# Solaris
		VARR=181
		VARG=74
		VARB=123
		;;
esac

VARRC=`bc -l <<< "scale=5; if (($VARR/255)<=0.04045) $VARR/255/12.92 else e(2.4*l(($VARR/255+0.055)/1.055))"`
VARGC=`bc -l <<< "scale=5; if (($VARG/255)<=0.04045) $VARG/255/12.92 else e(2.4*l(($VARG/255+0.055)/1.055))"`
VARBC=`bc -l <<< "scale=5; if (($VARB/255)<=0.04045) $VARB/255/12.92 else e(2.4*l(($VARB/255+0.055)/1.055))"`

VARCT=`bc <<< "if ((0.2126*$VARRC+0.7152*$VARGC+0.0722*$VARBC)>0.179) print \"000000\" else print \"ffffff\""`

VARIE="rgb($VARR,$VARG,$VARB)"

echo $VARIE
echo $VARCT

sed -i "s/^@define-color theme_selected_bg_color.*$/@define-color theme_selected_bg_color $VARIE;/" ~/.themes/cde-menta-colswappable/gtk-3.0/gtk-main.css
sed -i "s/^@define-color theme_selected_fg_color.*$/@define-color theme_selected_fg_color \#$VARCT;/" ~/.themes/cde-menta-colswappable/gtk-3.0/gtk-main.css
