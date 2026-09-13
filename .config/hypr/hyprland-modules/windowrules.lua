return {
    -- Provided Windowrules -- 
    hl.window_rule({
        name = "suppress-maximize-events",
        match = {
            class = ".*"
        },

        suppress_event = "maximize",
    }),
    hl.window_rule({
        name = "fix-xwayland-drags",
        match = {
            class = "^$",
            title = "^$",
            xwayland = true,
            float = true,
            fullscreen = false,
            pin = false,
        },

        no_focus = true,
    }),
    hl.window_rule({
        name = "move-hyprland-run",
        match = {
            class = "hyprland-run"
        },

        move = "20 monitor_h-120",
        float = true,
    }),

    -- Autostart Rules --
    hl.window_rule({
        name = "autostart-browser",
        match = {
            class = "^(qutebrowser)$"
        },
        workspace = 2,
    }),
    hl.on("hyprland.start",function()
        hl.exec_cmd("qutebrowser")
    end
    )
}
