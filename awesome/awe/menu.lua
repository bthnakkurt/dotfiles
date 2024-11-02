---@diagnostic disable: lowercase-global, undefined-global
local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")


require("awful.hotkeys_popup.keys")

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

myfavorites = {
    { "terminal", terminal },
    { "browser", browser },
    { "screenshot", screenshot },
    { "volume", controlvolume },
}

bloat = {
    { "increase volume", volumeup },
    { "decrease volume", volumedown },
    { "mute volume", volumestop },
    { "skip back", skipback },
    { "play/pause", playpause },
    { "skip forward", skipforward },
    { "increase brightness", brightnessup },
    { "decrease brightness", brightnessdown },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "favorites", myfavorites },
                                    { "bloat", bloat },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })


root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
