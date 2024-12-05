#!/bin/sh

printf "press f to install firefox \npress t for theme\n"

read -r answerme

insrefind() {
   doas cp -r ./refind/ /boot/efi/EFI/
}

insgtk() {
   doas cp ./theme/gtk/* -r /etc/
}

insthe() {
   isdoas pacman -S --noconfirm "$1"
}

insthemes() {
   echo "installing themes"
   cp -r ./theme/themes/ ~/.local/share/
   cp -r  ./theme/fonts/ ~/.local/share/
   cp -r ./theme/icons/ ~/.local/share/
   echo "to install gtk system-wide allow this"
   insgtk
   echo "finished"
}

insfirefox() {
   echo "setting up firefox"
   cp -r -v ./firefox/user.js ./firefox/chrome/ ~/.mozilla/firefox/*default-def*/
   echo "finished"
}


if [ "$answerme" = "f" ]; then
   insfirefox

elif [ "$answerme" = "t" ]; then
   insthemes

else
   echo "gb"
fi
