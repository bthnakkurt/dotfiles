xrdb ~/.config/extra/.Xresources
xsetroot -xcf $HOME/.local/share/icons/catppuccin-mocha-blue-cursors/cursors/left_ptr 20 &
exec setxkbmap tr &
exec herbe "$(acpi)" &
exec xset r rate 300 30 &
exec brillo -S 100 &
exec fastcompmgr -o 0.4 -r 12 -c -C -i 0.9666 &

exec bspwm
