---@diagnostic disable: lowercase-global
terminal = "kitty "
editor = "kitty -e nvim "
controlvolume = "pavucontrol"
screenshot = "/home/bai/.local/bin/at.sh"
browser = "/opt/waterfox/waterfox"
pdfreader = "zathura"
ocr= "flameshot gui --raw | tesseract-ocr -l tur+eng+equ+osd  stdin stdout | xclip -in -selection clipboard"
launcher= "rofi -show drun"

brightnessup = "brillo -A 5"
brightnessdown = "brillo -U 5"

volumestop = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
volumedown = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
volumeup = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
skipback = "playerctl previous"
playpause = "playerctl play-pause"
skipforward = "playerctl next"
