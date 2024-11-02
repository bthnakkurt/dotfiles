---@diagnostic disable: lowercase-global, undefined-global
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

modkey = "Mod4"


globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    awful.key({ modkey,           }, "Left",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Right",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),


    awful.key({ modkey,           }, "a", function () awful.spawn(browser) end,
              {description = "open browser", group = "launcher"}),
    awful.key({ modkey,           }, "z", function () awful.spawn(pdfreader) end,
              {description = "open pdf reader", group = "launcher"}),
    awful.key({ modkey,           }, "v", function () awful.spawn(controlvolume) end,
              {description = "open volume control", group = "launcher"}),
    -- Standard program
    awful.key({ modkey,           }, "q", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),


    awful.key({ "Control" }, "Print", function () awful.spawn.with_shell(ocr) end,
               {description = "screenshot", group = "video"}),
    awful.key({}, "Print", function () awful.spawn(screenshot) end,
               {description = "screenshot", group = "video"}),
    awful.key({}, "XF86AudioRaiseVolume", function () awful.spawn(volumeup) end,
              {description = "increase volume", group = "hotkeys"}),
    awful.key({}, "XF86AudioLowerVolume", function () awful.spawn(volumedown) end,
              {description = "decrease volume", group = "hotkeys"}),
    awful.key({}, "XF86AudioMute", function () awful.spawn(volumestop) end,
              {description = "mute volume", group = "hotkeys"}),
    awful.key({}, "XF86MonBrightnessUp", function () awful.spawn(brightnessup) end,
              {description = "increase brightness", group = "hotkeys"}),
    awful.key({}, "XF86MonBrightnessDown", function () awful.spawn(brightnessdown) end,
              {description = "decrease brightness", group = "hotkeys"}),
    awful.key({}, "XF86AudioPlay", function () awful.spawn(playpause) end,
              {description = "play/pause", group = "hotkeys"}),
    awful.key({}, "XF86AudioPrev", function () awful.spawn(skipback) end,
              {description = "skip back", group = "hotkeys"}),
    awful.key({}, "XF86AudioNext", function () awful.spawn(skipforward) end,
              {description = "skip forward", group = "hotkeys"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

  awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey,           }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"})
)

