-- Hyprland Lua Config --

-- Monitors --

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1.5,
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1.25,
    mirror = "eDP-1",
})

-- Programs --

local terminal = "ghostty"
local launcher = "rofi -show run"
local appLauncher = "rofi -show drun"

-- Autostart --

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar & hyprpaper -c ~/.config/hypr/hyprpaper/hyprpaper.conf")
    hl.exec_cmd("mako")
end)

-- Environment Variables --

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

-- Permissions --

hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

-- Look and Feel --

require("modules.config")

hl.config({
    cursor = {
        no_hardware_cursors = 2,
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,

        active_opacity = 1,
        inactive_opacity = 1,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },

        blur = {
            enabled = false,
            size = 1,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },
})

-- Input & Keybinds --

hl.config({
    input = {
        -- Keyboard
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:super",
        kb_rules = "",

        -- Mouse
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        }
    }
})

local keyBinds = require("modules.keybinds")
keyBinds(terminal, launcher, appLauncher)

-- Windowrules --

require("modules.windowrules")
