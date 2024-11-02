---@diagnostic disable: undefined-global
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
require("awful.hotkeys_popup.keys")


awful.rules.rules = {
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    { rule_any = {
        role = {
          "alert",
          "tk"
        }
      }, properties = { floating = true }},

    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

}

