---@diagnostic disable: lowercase-global
terminal = "kitty "
editor = "kitty -e nvim "
controlvolume = "pavucontrol"
screenshot = "flameshot gui"
browser = "firefox"
pdfreader = "zathura"

brightnessup = "brillo -A 5"
brightnessdown = "brillo -U 5"

volumestop = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
volumedown = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
volumeup = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
skipback = "playerctl previous"
playpause = "playerctl play-pause"
skipforward = "playerctl next"
