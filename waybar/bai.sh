#!/usr/bin/yash

playing=$(playerctl status)
whatisplayed=$(playerctl metadata --format "{{ artist }} - {{ title }}")

if [ "$playing" = "Playing" ]; then
    echo "$whatisplayed "
else
    echo ""
fi

