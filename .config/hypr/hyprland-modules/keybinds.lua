return function(terminal, fileManager, launcher, appLauncher)
    local mod = "SUPER"

    local binds = {
        -- General --
        hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(terminal)),
        hl.bind(mod .. " + Q", hl.dsp.window.close()),
        hl.bind(mod .. " + I", hl.dsp.exec_cmd(fileManager)),
        hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle "})),
        hl.bind(mod .. " + D", hl.dsp.exec_cmd(appLauncher)),
        hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd(launcher)),
        hl.bind(mod .. " + P", hl.dsp.window.pseudo()),
        hl.bind(mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")),

        -- Move Focus With VIM Keys --
        hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" })),
        hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" })),
        hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" })),
        hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" })),

        -- Cycle Through Workspaces With Scroll -- 
        hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" })),
        hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" })),

        -- Move/Resize Windows Using LMB/RMB
        hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }),
        hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }),

        -- Multimedia Keys --
        hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true }),
        hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true }),
        hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true }),

        -- Playerctl Binds -- 
        hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), { locked = true }),
        hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }),
        hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }),
        hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), { locked = true }),

        -- Personal Binds --
        hl.bind("insert", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')),
        hl.bind(mod .. " + SHIFT + TAB", hl.dsp.exec_cmd("~/.config/hypr/scripts/togglesink.bash")),
        hl.bind(mod .. " + R + W", hl.dsp.exec_cmd("pkill waybar && waybar &")),
    }

    -- Switch and Move Workspaces -- 
    for i = 1, 10 do
        local key = i % 10
        table.insert(binds, { hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i })) })
        table.insert(binds, { hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) })
    end

    return binds
end
