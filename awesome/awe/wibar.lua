---@diagnostic disable: lowercase-global, undefined-global, unused-local
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
-- custom widget
local volume_widget = require('awesome-wm-widgets.pactl-widget.volume')
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

local ram = ram_widget({
    timeout = 10,
    widget_show_buf=true
})

local volume = volume_widget({
    tooltip=true
})

local battery = battery_widget({
    show_current_level=true,
    display_notification=true,
    warning_msg_title = "şarj bitiyor, kaptan",
    warning_msg_text = "şarja taksan iyi olur!!!"
})

mytextclock = wibox.widget.textclock()

local sep_1 = wibox.widget {
    shape = gears.shape.star,
    widget = wibox.widget.separator,
    orientation = "vertical",
    forced_width = 10,}

local sep_2 = wibox.widget {
    shape = gears.shape.powerline,
    widget = wibox.widget.separator,
    forced_width = 16,
}


local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                          end))


local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)


awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ", " ", " ", "E", " ", "" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            sep_1,
            s.mytaglist,
            sep_1,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            ram,
            sep_2,
            volume,
            sep_2,
            battery,
            sep_2,
            wibox.widget.systray(),
            mytextclock,
            sep_2,
            s.mylayoutbox,
        },
    }
end)

