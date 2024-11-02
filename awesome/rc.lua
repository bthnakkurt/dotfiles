---@diagnostic disable: undefined-global, lowercase-global, unused-local
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")


require("awe.startup_check")
beautiful.init( "/home/bai/.config/awesome/themes/default/theme.lua" )
require("awe.apps")
require("awe.layouts")
require("awe.menu")
require("awe.wibar")
require("awe.keys")
require("awe.bloat")
require("awe.rules")
require("awe.signals")
require("awe.autostart")
