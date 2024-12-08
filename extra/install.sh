#!/bin/sh

printf "press f to install firefox \npress t for theme\n press r for refind"

read -r answerme

insrefind() {
   su -c "cp -r ./refind/ /boot/efi/EFI/"
}

insgtk() {
   su -c "cp ./theme/gtk/* -r /etc/"
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

elif [ "$answerme" = "r" ]; then
   insrefind

else
   echo "gb"
fi
