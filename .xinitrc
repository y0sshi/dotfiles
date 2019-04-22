#! /bin/sh
#
#	~/.xinitrc
#
xset s noblank

# ibus setting
export GTK_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export LANG=ja_JP.UTF-8
ibus-daemon -drx

#kterm -T $HOST -n $HOST -g 80x26+0+120 &
#fvwm2 > /dev/null 2>&1 &
#kterm -C -T login -n login -g 80x5+0+0

exec gnome-session
