# not sure if this is necessary
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK 

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#exec i3
exec xmonad
